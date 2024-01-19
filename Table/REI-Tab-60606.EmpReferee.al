table 60606 "Employee Referees/Guarantor"
{
    LookupPageId = "Employee Referees/Guarantors";

    fields
    {
        field(1; "Employee No"; Code[50])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Referee Full Name"; Text[200])
        {
        }
        field(4; Designation; Text[100])
        {
        }
        field(5; Institution; Text[100])
        {
        }
        field(6; Address; Text[200])
        {
        }
        field(7; "Telephone No"; Text[100])
        {
        }
        field(8; "E-Mail"; Text[200])
        {
        }
        field(9; "Reference Type"; Option)
        {
            OptionMembers =  ,"Personal Reference","Previous Employer";
        }
        field(10; Blocked; Boolean)
        {
        }
        field(11; "Submission Deadline"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Employee No","Line No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Reference Type", "Referee Full Name")
        {
        }
    }
}

