pageextension 60627 ItemLedger extends "Item Ledger Entries"
{
    layout
    {


        // Add changes to page layout here
        addbefore(Quantity)
        {

            field("Planned Quantity"; Rec."Planned Quantity")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Planned Quantity field.';
                HideValue = notHideValue;

            }
            field("Excess  Qty"; Rec."Excess  Qty")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Excess  Qty field.';
                HideValue = notHideValue;
                StyleExpr = TextColor;
            }

            field("Loss  Qty"; Rec."Loss  Qty")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Loss  Qty field.';
                Caption = 'Un-used Qty ';
                HideValue = notHideValue;
                StyleExpr = TextColor;
            }

            field("Planned Output"; Rec."Planned Output")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Planned Output field.', Comment = '%';
                HideValue = HideValue;
            }
            field("Component Variance"; Rec."Component Variance")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Component Variance field.';
                HideValue = HideValue;
                StyleExpr = TextColorOutput;
            }


        }
    }

    var
        notHideValue, HideValue : Boolean;
        TextColor, TextColorOutput : code[20];

}