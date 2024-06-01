tableextension 60621 "Item Ledger ent Ext" extends "Item Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Planned Quantity"; Decimal)
        {
            Editable = false;
        }
        field(50001; "Excess  Qty"; Decimal)
        {
            Editable = false;
        }
        field(50002; "Loss  Qty"; Decimal)
        {
            Editable = false;
        }
        field(50003; "Component Variance"; Decimal)
        {
            Editable = false;
        }
        field(50004; "Actual Output"; Decimal)
        {
            Editable = false;
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