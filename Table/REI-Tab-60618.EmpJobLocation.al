Table 60618 "Employee Job Location"
{
    DrillDownPageID = "Employee Job Location";
    LookupPageID = "Employee Job Location";

    fields
    {
        field(1; "Code"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code) { }
    }
}
