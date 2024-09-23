pageextension 60649 "Transfer OrderExt" extends "Transfer Order"
{

    layout
    {
        modify(Status)
        {
            Visible = false;
        }
        addafter(Status)
        {
            field("Production Description"; Rec."Production Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Production Description field.', Comment = '%';
                MultiLine = true;
                NotBlank = true;
                ShowMandatory = true;
            }

            field(Status1; Rec.Status1)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Status field.';
            }

        }
        addafter(Control1905767507)
        {
            part(Approvals; "REI-Doc. Approval WF Factbox")
            {
                Caption = 'Approvals';
                SubPageLink = "Document No." = FIELD("No.");
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                if Rec.Status1 <> Rec.Status1::Approved then Error('Approval is required before posting this document.');
            end;
        }
        addbefore("&Print")
        {
            group(approvalRequest)
            {
                action(SendApprovalRequest)
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    Visible = RequesterVisible;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        TransferLine: Record "Transfer Line";
                        count: Integer;
                    begin
                        Rec.TestField("No.");
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        IF Rec.Status1 = Rec.Status1::Approved THEN
                            ERROR('The document is already approved!');
                        IF DocumentWorkflow.GET(USERID, Database::"Transfer Header") THEN
                            IF UserSetup.GET(DocumentWorkflow."1st Approver") THEN;
                        TransferLine.Reset();
                        TransferLine.SetRange("Document No.", Rec."No.");
                        TransferLine.SetFilter("Line No.", '<>%1', 0);
                        if TransferLine.Count < 1 then Error('You cannot send this document for Approval. You are yet to program the line');
                        if TransferLine.FindSet() then begin
                            repeat
                                count += 1;
                                if ((TransferLine.Quantity < 1)) then Error('Kindly fill in the necessary fields on line %1', count);

                            until TransferLine.Next() = 0;
                        end;
                        TransferOrder.SETRANGE("No.", Rec."No.");
                        IF TransferOrder.FINDFIRST THEN
                            RecID := TransferOrder.RECORDID;
                        DocumentApprovalWorkflow.SendApprovalRequest(RecID.TABLENO, Rec."No.", RecID, TODAY, 0, 'Transfer Order - Approval Requisition');
                        SendApprovalRequestNotification(UserSetup, Rec."No.", Rec."Production Description");
                        Rec.Status1 := Rec.Status1::"Pending Approval";
                        Rec.MODIFY;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Request';
                    Ellipsis = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    Visible = RequesterVisible;
                    ApplicationArea = All;
                    // Visible = cansendApproval;

                    trigger OnAction()
                    var
                        sender, Receiver : code[50];
                        usersetup: Record "User Setup";
                    begin
                        IF Rec.Status1 = Rec.Status1::Approved THEN
                            ERROR('The document is already approved!');

                        TransferOrder.SETRANGE("No.", Rec."No.");
                        if TransferOrder.FINDFIRST THEN
                            RecID := TransferOrder.RECORDID;
                        DocumentApprovalEntry.RESET;
                        DocumentApprovalEntry.SETCURRENTKEY(Sequence, "Document No.");
                        DocumentApprovalEntry.SETRANGE("Document No.", Rec."No.");
                        if DocumentApprovalEntry.FindFirst() then begin
                            Receiver := DocumentApprovalEntry.Approver;
                            // if usersetup.Get(Receiver) then begin
                            //     usersetup.TestField("E-Mail");
                            //     SendApprovalRequestNotification(usersetup)
                            // end
                        end;
                        DocumentApprovalWorkflow.CancelApprovalRequest(RecID.TABLENO, Rec."No.");
                        Rec.Status1 := Rec.Status1::Open;
                        Rec.MODIFY;
                    end;
                }
                action(Approve)
                {
                    Caption = 'Approve';
                    Image = Approve;
                    ApplicationArea = All;
                    // Visible = canPost;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    Visible = ApprovalRequestVisible;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        IF Rec.Status1 = Rec.Status1::Approved THEN
                            ERROR('The document is already approved!');
                        DocumentApprovalWorkflow.ApproveDocument(Rec."No.", 0DT);
                        if DocumentApprovalWorkflow.ApprovalStatusCheck(RecID.TABLENO, Rec."No.", RecID) THEN BEGIN
                            Rec.Status1 := Rec.Status1::Approved;
                            Rec.Status := Rec.Status::Released;
                            Rec.MODIFY;
                        END;
                    end;
                }
                action(Reject)
                {
                    Caption = 'Reject';
                    Image = Reject;
                    ApplicationArea = All;
                    // Visible = canPost;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = ApprovalRequestVisible;
                    PromotedOnly = true;
                    trigger OnAction()
                    begin
                        IF Rec.Status1 = Rec.Status1::Approved THEN
                            ERROR('The document is already approved!');

                        DocumentApprovalWorkflow.RejectDocument(Rec."No.");
                        IF NOT DocumentApprovalWorkflow.ApprovalStatusCheck(RecID.TABLENO, Rec."No.", RecID) THEN BEGIN
                            Rec.Status1 := Rec.Status1::Rejected;
                            Rec.MODIFY;
                        END;
                    end;
                }

            }

        }

    }
    trigger OnAfterGetCurrRecord()
    var
        userSetup: Record "User Setup";
    begin
        userSetup.Get(UserId);

        if rec."Raised by" <> UserId then RequesterVisible := false else RequesterVisible := true;
        IF Rec.Status1 = Rec.Status1::"Pending Approval" THEN
            ApprovalRequestVisible := TRUE
        Else
            ApprovalRequestVisible := false;

        IF Rec.Status1 = Rec.Status1::"Pending Approval" THEN BEGIN
            DocumentApprovalEntry.RESET;
            DocumentApprovalEntry.SETCURRENTKEY(Sequence, "Document No.");
            DocumentApprovalEntry.SETRANGE("Document No.", Rec."No.");
            DocumentApprovalEntry.SETRANGE("Table No.", Database::"Transfer Header");
            DocumentApprovalEntry.SETFILTER(DocumentApprovalEntry."Approval Status", '%1', DocumentApprovalEntry."Approval Status"::Pending);
            IF DocumentApprovalEntry.FINDFIRST THEN begin
                // Start of Logic that allows only current approver see approve or reject action
                IF DocumentApprovalEntry.Approver = USERID THEN
                    ApprovalRequestVisible := TRUE
                ELSE
                    ApprovalRequestVisible := FALSE;
                // End of Logic that allows only current approver see approve or reject action
                Rec."Current Pending Person" := DocumentApprovalEntry.Approver;
                Rec.MODIFY(TRUE);
            END;
        END;
        // if (Rec.Status1 in [Rec.Status::Approved]) then canPost := true;
        // if ((Rec.Status = Rec.Status::" ") and (userSetup."Station Manager")) then cansendApproval := true;
        // case Rec.Status1 of
        //     Rec.Status1::Approved:
        //         begin
        //             if userSetup."Sales Marketer" then
        //                 canPost := true;
        //             if userSetup."Station Manager" then begin
        //                 cansendApproval := false;
        //                 canApproval := false;
        //             end

        //         end;
        //     Rec.Status1::"Open":
        //         begin
        //             if userSetup."Sales Marketer" then
        //                 canPost := false;
        //             if userSetup."Station Manager" then begin
        //                 cansendApproval := true;
        //                 canApproval := true;
        //             end;
        //         end;
        //     Rec.Status1::"Pending Approval":
        //         begin
        //             if userSetup."Station Manager" then begin
        //                 canApproval := true;
        //                 cansendApproval := true;
        //             end;
        //             if userSetup."Sales Marketer" then
        //                 canPost := true;
        //         end;

        // end;
    end;


    procedure SendApprovalRequestNotification(Recipient: Record "User Setup"; DocNo: Code[20]; Description: Text[1000])
    var
        Subject: Text;
        EmailBody: Text;
        EMail: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Recipient1: List of [Text];
        hyperlinkText: Text;
        Link: Text;
        GLSetup: Record "General Ledger Setup";
        CurrCode: Code[50];
        SentBy: Record "User Setup";
    begin
        IF SentBy.GET(USERID) THEN;

        Recipient1.add(Recipient."E-mail");

        EmailBody := STRSUBSTNO(Text001, CurrCode, 0, Rec."Production Description", UserId);

        Rec.SETRECFILTER;
        Link := GETURL(CLIENTTYPE::Web, COMPANYNAME, OBJECTTYPE::Page,
                    PAGE::"Transfer Order", Rec);
        hyperlinkText := STRSUBSTNO('<a href=' + Link + '>' + 'Click here to approve or reject record.</a>');
        Subject := STRSUBSTNO('Approval Request for %1 by %2', Rec."Production Description", UserId);
        EmailMessage.Create(Recipient1, Subject, '', TRUE);
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO('Dear ' + Recipient."Full Name" + ',')));
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody(FORMAT(EmailBody));
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody(hyperlinkText);
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody('Regards,');
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SentBy."Full Name")));
        EmailMessage.AppendToBody('<HR>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SystemGenerated)));
        IF Email.Send(EmailMessage, Enum::"Email Scenario"::Default) THEN;
    end;

    var
        DocumentApprovalWorkflow: Codeunit 50000;
        ApprovalRequestVisible, RequesterVisible : Boolean;

        DocumentApprovalEntry: Record "REI-Document Approval Entry";
        TransferOrder: Record "Transfer Header";
        RecRef: RecordRef;
        RecID: RecordID;
        UserSetup: Record "User Setup";
        canPost, cansendApproval, canApproval : Boolean;
        Text001: Label 'Kindly approve %1';
        SystemGenerated: Label 'This is a system generated mail.';
        DocumentWorkflow: Record "REI-Document Workflow";
}