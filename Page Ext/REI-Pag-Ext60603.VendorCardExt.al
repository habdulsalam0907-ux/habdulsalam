pageextension 60603 VendorCardExt extends "Vendor Card"
{
    layout
    {
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
            }
        }
        modify("E-Mail")
        {
            ApplicationArea = All;
            ShowMandatory = true;
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
}