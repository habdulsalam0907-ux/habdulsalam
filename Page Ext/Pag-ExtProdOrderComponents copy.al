pageextension 60631 ProductionJournal extends "Production Journal"
{
    layout
    {
        // Add changes to page layout here
        addafter("Consump. Qty.")
        {

            field("Planned Quantity"; Rec."Planned Quantity")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Planned Quantity field.';
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