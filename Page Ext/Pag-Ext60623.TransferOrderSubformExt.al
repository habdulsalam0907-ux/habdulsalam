pageextension 60623 TransferOrderSubformExt extends "Transfer Order Subform"
{
    layout
    {
        modify(Quantity)
        {
            Caption = 'Actual Quantity';
        }
        addbefore(Quantity)
        {

            field("Requested Quantity"; Rec."Requested Quantity")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Requested Quantity field.';
            }
        }
        addafter("Receipt Date")
        {
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
