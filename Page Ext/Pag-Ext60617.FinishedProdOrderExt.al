pageextension 60617 "Finished Prod. Order Ext" extends "Finished Production Order"
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
