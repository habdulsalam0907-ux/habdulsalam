pageextension 60616 "Released Prod. Order Ext" extends "Released Production Order"
{
    layout
    {
        addafter("No.")
        {
            field("Batch No."; Rec."Reference Batch No.")
            {
                ApplicationArea = All;
            }
        }
        modify("No.")
        {
            Caption = 'Batch No.';
        }
    }
}
