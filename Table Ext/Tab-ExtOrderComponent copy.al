tableextension 60642 "Item Journal Ext" extends "Item Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Planned Quantity"; Decimal)
        {

        }
        field(50001; "Excess  Qty"; Decimal)
        {

        }
        field(50002; "Loss  Qty"; Decimal)
        {

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