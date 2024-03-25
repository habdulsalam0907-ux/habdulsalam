pageextension 60607 "Item Card Ext" extends "Item Card"
{
    layout
    {
        addafter("Item Category Code")
        {
            field("Leased Asset Class"; Rec."Leased Asset Class")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Leased Asset Class field.';
            }
            field("Item Cost Account No."; Rec."Item Cost Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Cost Account No. field.';
            }
            field("Item Cost Account Name"; Rec."Item Cost Account Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Cost Account Name field.';
            }

        }
    }
}
