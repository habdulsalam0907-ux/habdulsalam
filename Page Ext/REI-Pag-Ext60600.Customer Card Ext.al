pageextension 60600 MyExtension extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Blocked)
        {
            // Add changes to page layout here
            field("Billing Cycle"; Rec."Billing Cycle")
            {
                ApplicationArea = All;
                Caption = 'Billing Cycle';
                ToolTip = 'Specifies the value of the Billing Cycle field.';
            }
            field("LPG Customer"; Rec."LPG Customer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LPG Customer field.';
            }
            field("Location Customer"; Rec."Location Customer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Location Customer field.';
            }
            field("Credit Customer"; Rec."Credit Customer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Credit Customer field.';
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
        modify("E-Mail")
        {
            ShowMandatory = true;
            ApplicationArea = All;
        }

    }
    trigger OnClosePage()
    begin
        if Rec."E-Mail" = '' then
            Error('The customer email address field must not be emptied!');
    end;
}