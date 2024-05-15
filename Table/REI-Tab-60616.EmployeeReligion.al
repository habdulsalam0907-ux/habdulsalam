Table 60616 "Employee Religion"
{
    DrillDownPageID = "Employee Religion List";
    LookupPageID = "Employee Religion List";

    fields
    {
        field(1; "Religion"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Religion)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Religion) { }
    }
}
