pageextension 60622 "PBOM Subform Ext" extends "Production BOM Lines"
{
    layout
    {
        modify("Quantity per")
        {
            Caption = 'Quantity per';
        }
        addbefore("Quantity per")
        {
            field("Qty per (Ltr)"; Rec."Qty per (Ltr)")
            {
                ApplicationArea = All;
            }
            field("Specific Gravity"; Rec."Specific Gravity")
            {
                ApplicationArea = All;
            }
        }
    }
}
