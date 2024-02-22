pageextension 60615 "Firm Planned Prod. Order Ext" extends "Firm Planned Prod. Order"
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
