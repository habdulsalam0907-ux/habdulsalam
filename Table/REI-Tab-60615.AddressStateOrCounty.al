Table 60615 "Address States/County"
{
    DrillDownPageID = "State/County List";
    LookupPageID = "State/County List";

    fields
    {
        field(1; "State"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; State)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; State) { }
    }
}
