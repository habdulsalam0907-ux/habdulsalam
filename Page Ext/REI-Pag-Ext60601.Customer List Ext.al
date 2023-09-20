pageextension 60601 CustListExt extends "Customer List"
{
    layout
    {
        addafter(Contact)
        {
            // Add changes to page layout here
            field("Billing Cycle"; Rec."Billing Cycle")
            {
                ApplicationArea = All;
                Caption = 'Billing Cycle';
                ToolTip = 'Specifies the value of the Billing Cycle field.';
            }
            field("System Type"; Rec."System Type")
            {
                ApplicationArea = All;
                Caption = 'System Type';
                ToolTip = 'Specifies the value of the System Type field.';
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
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}