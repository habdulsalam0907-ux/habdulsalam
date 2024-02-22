pageextension 60621 "Finished Prod. Orders Ext" extends "Finished Production Orders"
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
