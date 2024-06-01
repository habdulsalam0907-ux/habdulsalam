pageextension 60630 ProdOrderComponents extends "Prod. Order Components"
{
    layout
    {
        // Add changes to page layout here
        addafter("Expected Quantity")
        {
            field("Actual Quantity"; Rec."Actual Quantity")
            {

            }
            field(Variance; Rec."Variance Qty")
            {
                Editable = false;

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