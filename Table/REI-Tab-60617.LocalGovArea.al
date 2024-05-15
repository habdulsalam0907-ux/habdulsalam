Table 60617 "Local Government Area"
{
    DrillDownPageID = "Local Government Area List";
    LookupPageID = "Local Government Area List";

    fields
    {
        field(1; "Local Government Area"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Local Government Area")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Local Government Area") { }
    }
}
