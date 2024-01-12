pageextension 60613 SalesReceivableSetupExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Document Default Line Type")
        {
            field("Head, SM"; Rec."Head, SM")
            {
                ApplicationArea = All;
            }
            field("Head, SM First Name"; Rec."Head, SM First Name")
            {
                ApplicationArea = All;
            }
            field("Head, SM Email"; Rec."Head, SM Email")
            {
                ApplicationArea = All;
            }
        }
    }
}
