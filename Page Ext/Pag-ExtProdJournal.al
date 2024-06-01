pageextension 60631 ProductionJournal extends "Production Journal"
{
    layout
    {
        // Add changes to page layout here
        addbefore("Setup Time")
        {

            field("Planned Quantity"; Rec."Planned Quantity")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Planned Quantity field.';
            }

        }
        addbefore("Scrap Quantity")
        {

            field("Excess  Qty"; Rec."Excess  Qty")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Excess  Qty field.';
             
            }
            field("Loss  Qty"; Rec."Loss  Qty")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Loss  Qty field.';
            }
            field("Component Variance"; Rec."Component Variance")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Component Variance field.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}