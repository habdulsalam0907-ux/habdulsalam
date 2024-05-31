Table 60613 "Employee Bank Name"
{
    DrillDownPageID = "Employee Bank Name";
    LookupPageID = "Employee Bank Name";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Bank Sort Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, Description, "Bank Sort Code") { }
    }
}
