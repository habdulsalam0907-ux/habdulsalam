pageextension 60600 MyExtension extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Blocked)
        {
            field("Verification Status"; Rec."Verification Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Verification Status field.';
                Editable = false;
            }
            field("LPG Customer"; Rec."LPG Customer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LPG Customer field.';
            }
            field("Location Customer"; Rec."Location Customer")
            {
                ApplicationArea = All;
                Caption = 'Customer Location';
                ToolTip = 'Specifies the value of the Location Customer field.';
            }
            field("Bitumen Customer"; Rec."Bitumen Customer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bitumen Customer field.';
            }
            field("White Product customer"; Rec."White Product customer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the White Product customer field.';
            }
            field("Credit Customer"; Rec."Credit Customer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Credit Customer field.';
            }
            field("Product/Services"; Rec."Product/Services")
            {
                ApplicationArea = All;
                Caption = 'Product/Services';
                ToolTip = 'Specifies the value of the Product/Services field.';
            }
            field("Customer Status"; Rec."Customer Status")
            {
                ApplicationArea = All;
                Caption = 'Customer Status';
                ToolTip = 'Specifies the value of the Customer Status field.';
            }
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = All;
                Caption = 'Customer Type';
                ToolTip = 'Specifies the value of the Customer Type field.';
            }
            field("Customer Name Abbreviation"; Rec."Customer Name Abbreviation")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer Name Abbreviation field.';
            }
            field("Customer Business Group"; Rec."Customer Business Group")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer Business Group field.';
            }
        }
        addlast("Address & Contact")
        {

            field("Operations Contact Name"; Rec."Operations Contact Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Operations Contact Name field.';
            }
            field("Operations Contact Email"; Rec."Operations Contact Email")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Operations Contact Email field.';
            }
            field("Operations Contact Phone"; Rec."Operations Contact Phone")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Operations Contact Phone field.';
            }
            field("Primary Contact Email"; Rec."Primary Contact Email")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Primary Contact Email field.';
            }
            field("Primary Contact Name"; Rec."Primary Contact Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Primary Contact Name field.';
            }
            field("Primary Contact Position"; Rec."Primary Contact Position")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Primary Contact Position field.';
            }
            field("Primary Contact"; Rec."Primary Contact")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Primary Contact field.';
            }
        }
        modify("E-Mail")
        {
            ShowMandatory = true;
            ApplicationArea = All;
        }


    }
    actions
    {
        addafter("&Customer")
        {
            action(VerifyCustomer)
            {
                ApplicationArea = basic, suite;
                Promoted = true;
                PromotedCategory = New;
                Caption = 'Verify Customer';
                trigger OnAction()
                var

                begin
                    if not (Rec."Verification Status" = Rec."Verification Status"::Verified) then begin
                        Rec."Verification Status" := Rec."Verification Status"::Verified;
                        if confirm('Do you want the system to sent verification mail?', true) then begin
                            if SendVerificationMessage() then Message('Email has been sent to Customer');
                        end;
                        Rec."Customer Status" := Rec."Customer Status"::Active;
                    end

                end;
            }

            action(RejectCustomer)
            {
                ApplicationArea = basic, suite;
                Promoted = true;
                PromotedCategory = New;
                Caption = 'Reject Customer';
                trigger OnAction()
                var

                begin
                    if not (Rec."Verification Status" = Rec."Verification Status"::Rejected) then begin
                        Rec."Verification Status" := Rec."Verification Status"::Rejected;
                        Rec."Customer Status" := Rec."Customer Status"::Inactive;
                    end

                end;
            }
        }

    }


    trigger OnOpenPage()
    var
        Notification: Notification;
        NotificationScope: NotificationScope;
    begin
        if not (Rec."Verification Status" in [Rec."Verification Status"::Rejected, Rec."Verification Status"::Verified]) then begin
            Notification.Message('Customer Account is yet to be verified or Rejected');
        end
    end;

    trigger OnClosePage()
    begin
        if Rec."E-Mail" = '' then
            Error('The customer email address field must not be emptied!');
    end;

    var
        DocumentApprovalWorkflow: Codeunit 50000;
        DocumentApprovalEntry: Record "REI-Document Approval Entry";
        Customer: Record Customer;
        RecRef: RecordRef;
        RecID: RecordID;
        canPost, cansendApproval, canApproval : Boolean;


    local procedure SendVerificationMessage(): Boolean
    var
        Subject: Text;
        EmailBody: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        hyperlinkText: Text;
        Link: Text;
        GLSetup: Record "General Ledger Setup";
        CurrCode: Code[10];
        SenderEmail: Text;
        SenderName: Text;
        Recipient1: List of [Text];
        RecipientMail: Text;
        RecipientName: Text;
        usersetup: Record "User Setup";
        SalesRep: Record "Salesperson/Purchaser";
        customSetup: Record "Custom Setup";
        customer: Record customer;
        SentBy: Record "User Setup";
        Text007: label 'We are pleased to inform you that your onboarding process with Hyde Energy has been successful. A warm welcome from the Hyde team. We look forward to a successful business relationship together.';
        SystemGenerated: Label 'This is a system generated mail.';
    begin

        // usersetup.SetFilter("User ID", UserId);

        IF SentBy.GET(UserId) THEN;
        SenderEmail := SentBy."E-Mail";
        SenderName := SentBy."Full Name";
        Rec.TestField("E-Mail");
        Recipient1.Add(Rec."E-Mail");

        Subject := STRSUBSTNO('Congratulations! Your onboarding process has been verified');

        EmailBody := STRSUBSTNO(Text007);
        if Recipient1.Count > 0 then begin
            EmailMessage.Create(Recipient1, Subject, '', TRUE);
            EmailMessage.AppendToBody(FORMAT(STRSUBSTNO('Hello %1', Rec.Name)));
            EmailMessage.AppendToBody('<br><br>');
            EmailMessage.AppendToBody('I hope this mail finds you well.');
            EmailMessage.AppendToBody('<br><br>');
            EmailMessage.AppendToBody(FORMAT(EmailBody));
            EmailMessage.AppendToBody('<br><br>');
            EmailMessage.AppendToBody(hyperlinkText);
            EmailMessage.AppendToBody('<br><br>');
            EmailMessage.AppendToBody('Kind Regards,');
            EmailMessage.AppendToBody('<br><br>');
            EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SentBy."Full Name")));
            EmailMessage.AppendToBody('<HR>');
            EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SystemGenerated)));
            IF Email.Send(EmailMessage, Enum::"Email Scenario"::Default) THEN exit(true)

        end
    end;
}