tableextension 60642 "Item Journal Ext" extends "Item Journal Line"
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
        field(50003; "Output Type"; Option)
        {
            OptionCaption = 'Excess,Loss,Normal';
            OptionMembers = Excess,Loss,Normal;

        }
        field(50004; "Component Variance"; Decimal)
        {
            Editable = false;
            Caption = 'Output Difference';
        }
        field(50005; "Planned Output"; Decimal)
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