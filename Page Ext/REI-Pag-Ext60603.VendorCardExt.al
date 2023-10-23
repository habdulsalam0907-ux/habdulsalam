pageextension 60603 VendorCardExt extends "Vendor Card"
{
    layout
    {
        // Add changes to page layout here
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
            }
        }

    }

}