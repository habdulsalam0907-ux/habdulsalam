tableextension 60641 "Prod.Order Component Ext" extends "Prod. Order Component"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Actual Quantity"; Decimal)
        {
            trigger OnValidate()
            begin
                if "Actual Quantity" <> 0 then
                    "Variance Qty" := "Expected Quantity" - "Actual Quantity";
            end;

        }
        field(50001; "Variance Qty"; Decimal)
        {

        }
        modify("Expected Quantity")
        {
            Caption = 'Planned Quantity';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}