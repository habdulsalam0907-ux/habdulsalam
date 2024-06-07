pageextension 60603 VendorCardExt extends "Vendor Card"
{
    layout
    {
        movefirst(Payments; "Balance (LCY)")
        movelast(Payments; "Balance Due (LCY)")
        movelast(Payments; BalanceAsCustomer)
        movelast(General; GLN)
        modify("Home Page")
        {
            Caption = 'Website Url';
        }
        addlast(General)
        {
            field("Country of Registrations"; Rec."Country of Registrations")
            {
                ApplicationArea = All;
                Caption = 'Country of Registrations';
                ToolTip = 'Specifies the value of the Country of Registrations field.';
            }


            field("RC No."; Rec."RC No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the RC No. field.';
            }
        }
        addafter(Blocked)
        {

            field("Vendor Type"; Rec."Vendor Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vendor Type field.';
            }
            field("Product/Services"; Rec."Product/Services")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Product/Service Category field.';
            }
            field("Vendor Status"; Rec."Vendor Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vendor Status field.';
            }
        }
        modify(Receiving)
        {
            Visible = false;
        }


        addafter("Our Account No.")
        {
            field("Means Of Identification"; Rec."Means Of Identification")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Means Of Identification field.';
                trigger OnValidate()
                begin
                    case Rec."Means Of Identification" of
                        Rec."Means Of Identification"::Passport:
                            begin
                                showPassport := true;
                                showDriverLicense := false;
                                showVoterCard := false;
                                shoNationalIDCard := false;
                            end;
                        Rec."Means Of Identification"::"Driver License":
                            begin
                                showPassport := false;
                                showDriverLicense := true;
                                showVoterCard := false;
                                shoNationalIDCard := false;
                            end;
                        Rec."Means Of Identification"::"National ID Card":
                            begin
                                showPassport := false;
                                showDriverLicense := false;
                                showVoterCard := false;
                                shoNationalIDCard := true;
                            end;
                        Rec."Means Of Identification"::"Voter's Card":
                            begin
                                showPassport := false;
                                showDriverLicense := false;
                                showVoterCard := false;
                                shoNationalIDCard := true;
                            end;
                    end;
                end;
            }
            field(NIN; Rec.NIN)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the NIN field.';
            }
            field("Passport ID"; Rec."Passport ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Passport ID field.';
            }
            field("Voter's ID"; Rec."Voter's ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Voter''s ID field.';
            }
            field("Driver License ID"; Rec."Driver License ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Driver License ID field.';
            }
        }
        modify("Address & Contact")
        {
            Caption = 'Personal Information';

        }

        addafter("Address & Contact")
        {
            group("Service Classes")
            {
                field(Insurance; Rec.Insurance)
                {
                    ApplicationArea = All;
                }
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = All;
                }
                field("Inspection/Quality"; Rec."Inspection/Quality")
                {
                    ApplicationArea = All;
                }
                field("Agencies Vendor"; Rec."Agencies Vendor")
                {
                    ApplicationArea = All;
                }
                field("Freight Vendor"; Rec."Freight Vendor")
                {
                    ApplicationArea = All;
                }
                field("Jetty Depot Vendor"; Rec."Jetty Depot Vendor")
                {
                    ApplicationArea = All;
                }
                field(Surveyor; Rec.Surveyor)
                {
                    ApplicationArea = All;
                }
                field("STS/Fendering"; Rec."STS/Fendering")
                {
                    ApplicationArea = All;
                }
                field("Storage Vendor"; Rec."Storage Vendor")
                {
                    ApplicationArea = All;
                }
                field(MaintenanceVendor; Rec.MaintenanceVendor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MaintenanceVendor field.';
                }
                field("Civil Contractor"; Rec."Civil Contractor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Civil Contractor field.';
                }
                field("Electrical contractor"; Rec."Electrical contractor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Electrical contractor field.';
                }
                field("Process/Mechanical"; Rec."Process/Mechanical")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Process/Mechanical field.';
                }
                field(Branding; Rec.Branding)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Branding field.';
                }
                field("FX Vendor"; Rec."FX Vendor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the FX Vendor field.';
                }
                field("Human Resources"; Rec."Human Resources")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Human Resources field.';
                }
                field("Legal Services"; Rec."Legal Services")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Legal Services field.';
                }
                field("Transport/logistics"; Rec."Transport/logistics")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport/logistics field.';
                }
                field(Regulatory; Rec.Regulatory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Regulatory field.';
                }
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
            ApplicationArea = All;
            ShowMandatory = true;
            Caption = 'Company / Personal Email';
        }

    }
    actions
    {
        addfirst("Ven&dor")
        {
            action(VerifyCustomer)
            {
                ApplicationArea = basic, suite;
                Promoted = true;
                PromotedCategory = New;
                Caption = 'Verify Vendor';
                trigger OnAction()
                var

                begin
                    if not (Rec."Verification Status" = Rec."Verification Status"::Verified) then begin
                        Rec."Verification Status" := Rec."Verification Status"::Verified;
                        if confirm('Do you want the system to send verification mail?', true) then begin
                            if SendVerificationMessage() then Message('Email has been sent to vendor');
                        end;
                        Rec."Vendor Status" := Rec."Vendor Status"::Active;
                    end

                end;
            }

            action(RejectCustomer)
            {
                ApplicationArea = basic, suite;
                Promoted = true;
                PromotedCategory = New;
                Caption = 'Reject Vendor';
                trigger OnAction()
                var

                begin
                    if not (Rec."Verification Status" = Rec."Verification Status"::Rejected) then begin
                        Rec."Verification Status" := Rec."Verification Status"::Rejected;
                        Rec."Vendor Status" := Rec."Vendor Status"::Inactive;
                    end

                end;
            }
        }
    }



    trigger OnOpenPage()
    begin
        showPassport := false;
        showDriverLicense := false;
        showVoterCard := false;
        shoNationalIDCard := false;
        case Rec."Means Of Identification" of
            Rec."Means Of Identification"::Passport:
                begin
                    showPassport := true;
                    showDriverLicense := false;
                    showVoterCard := false;
                    shoNationalIDCard := false;
                end;
            Rec."Means Of Identification"::"Driver License":
                begin
                    showPassport := false;
                    showDriverLicense := true;
                    showVoterCard := false;
                    shoNationalIDCard := false;
                end;
            Rec."Means Of Identification"::"National ID Card":
                begin
                    showPassport := false;
                    showDriverLicense := false;
                    showVoterCard := false;
                    shoNationalIDCard := true;
                end;
            Rec."Means Of Identification"::"Voter's Card":
                begin
                    showPassport := false;
                    showDriverLicense := false;
                    showVoterCard := false;
                    shoNationalIDCard := true;
                end;
        end;

    end;

    trigger OnClosePage()
    begin
        if Rec."E-Mail" = '' then
            Error('The vendor email address field must not be filled!');
    end;

    var
        showPassport, showDriverLicense, showVoterCard, shoNationalIDCard : boolean;


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