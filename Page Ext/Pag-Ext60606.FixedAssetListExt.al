pageextension 60606 FixedAssetListExt extends "Fixed Asset List"
{
    layout
    {
        addafter(Acquired)
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
