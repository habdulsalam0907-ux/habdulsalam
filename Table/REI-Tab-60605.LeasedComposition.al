table 60605 "Leased Asset Composition"
{
    DataClassification = ToBeClassified;
    DataCaptionFields = Description;
    LookupPageID = "Leased Asset Classes";
    
    fields
    {
        field(1; "Fixed Asset Code"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; "First Depreciation Date"; Date)
        {
            DataClassification = ToBeClassified;
            
        }
        field(4; Description; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Opening Cost"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("Total cost");
            end;
        }
        field(7; "Additions Cost"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("Total cost");
            end;
        }
        field(8; "Total cost"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Total cost" := "Additions Cost" + "Opening Cost";
            end;
        }
        field(9; "Tenor (Mths)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(Key1; "Fixed Asset Code","Line No.")
        {
            Clustered = true;
        }
    }
    
}
