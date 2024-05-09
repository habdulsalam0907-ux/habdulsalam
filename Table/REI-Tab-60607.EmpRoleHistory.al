table 60607 "Employee Role History"
{
    LookupPageId = "Employee Role History";

    fields
    {
        field(1; "Employee No"; Code[50])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Previous Role Description"; Text[100])
        {
        }
        field(4; "New Role Description"; Text[100])
        {
        }
        field(5; "New Role Start Date"; Date)
        {
            trigger OnValidate()
            begin
                Validate("Days Spent On Role");
            end;
        }
        field(6; "New Role End Date"; Date)
        {
            trigger OnValidate()
            begin
                Validate("Days Spent On Role");
            end;
        }
        field(7; "Previous Role End Date"; Date)
        {
        }
        field(8; "Days Spent On Role"; Decimal)
        {
            trigger OnValidate()
            begin
                If "New Role End Date" = 0D then
                    "Days Spent On Role" := Today() - "New Role Start Date"
                else
                    "Days Spent On Role" := "New Role End Date" - "New Role Start Date";
            end;
        }
    }

    keys
    {
        key(Key1; "Employee No", "Line No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Employee No", "New Role Description", "New Role Start Date")
        {
        }
    }
    trigger OnDelete()
    begin
        UserSetup.Get(UserId);
        If Not (UserSetup."System Admin" or UserSetup."HR Manager" or UserSetup."Head of Corp Services") then
            Error('You are not authorised to perform this action!!!');
    end;

    var
        UserSetup: Record "User Setup";
}

