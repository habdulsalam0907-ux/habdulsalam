pageextension 60604 VendListExt extends "Vendor List"
{
    layout
    {
        addafter(Contact)
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

    }

}