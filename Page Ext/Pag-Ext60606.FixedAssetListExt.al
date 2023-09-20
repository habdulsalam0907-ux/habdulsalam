pageextension 60606 FixedAssetListExt extends "Fixed Asset List"
{
    layout
    {
        addafter(Acquired)
        {
            field("Main Asset/Component"; Rec."Main Asset/Component")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if the fixed asset is a main fixed asset or a component of a fixed asset.';
            }
            field("Customer Name"; Rec."Customer Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer Name field.';
            }
            field(Location; Rec.Location)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Location field.';
            }
            field("State of Location"; Rec."State of Location")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the State of Location field.';
            }
            field("Leased Asset"; Rec."Leased Asset")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Leased Asset field.';
            }
            field("Leased Asset Class"; Rec."Leased Asset Class")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Leased Asset Class field.';
                Editable = Rec."Leased Asset";
            }
            field("Include Leased Composition"; Rec."Include Leased Composition")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Include Leased Composition field.';
                Editable = Rec."Leased Asset";
                Caption = 'Includes Leased Composition';
            }
        }
    }
}
