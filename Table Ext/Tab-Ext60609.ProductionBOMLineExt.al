tableextension 60609 "Production BOM Line Ext" extends "Production BOM Line"
{
    fields
    {
        field(60600; "Qty per (Ltr)"; Decimal)
        {
            Caption = 'Qty per (Ltr)';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                "Quantity per" := "Qty per (Ltr)" * "Specific Gravity";
                Validate("Quantity per");
            end;
        }
        field(60601; "Specific Gravity"; Decimal)
        {
            Caption = 'Specific Gravity';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                "Quantity per" := "Qty per (Ltr)" * "Specific Gravity";
                Validate("Quantity per");
            end;
        }
    }
}
