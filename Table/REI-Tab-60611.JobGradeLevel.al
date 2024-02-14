Table 60611 "Job Grade Level"
{
    DrillDownPageID = "Job Grade Levels";
    LookupPageID = "Job Grade Levels";

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Grade Level"; Text[100])
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
        fieldgroup(DropDown; Code,"Grade Level") { }
    }
}
