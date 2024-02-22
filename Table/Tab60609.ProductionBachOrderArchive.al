table 60609 "Production Bach Order Archive"
{
    Caption = 'Production Bach Order Archive';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Batch No."; Code[100])
        {
            Caption = 'Batch No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Production Date"; Date)
        {
            Caption = 'Production Date';
        }
        field(5; "Source Document No."; Code[100])
        {
            Caption = 'Source Document No.';
        }

    }
    keys
    {
        key(PK; "Batch No.")
        {
            Clustered = true;
        }
    }
}
