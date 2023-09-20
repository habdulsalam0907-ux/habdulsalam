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
        }
    }
}
