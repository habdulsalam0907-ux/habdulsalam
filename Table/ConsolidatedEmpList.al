table 60619 "Consolidated Employee"
{
    DataClassification = ToBeClassified;
    Caption = 'Consolidated Employee';
    DataPerCompany = false;
    Scope = Cloud;
    ReplicateData = true;
    DataCaptionFields = "No.", "First Name", "Middle Name", "Last Name";
    // DrillDownPageID = "Employee List";
    // LookupPageID = "Employee List";
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
            Editable = false;

        }
        field(3; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
            Editable = false;
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
            Editable = false;
        }
        field(5; Initials; Text[30])
        {
            Caption = 'Initials';
            Editable = false;


            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Initials)) or ("Search Name" = '') then
                    "Search Name" := Initials;
            end;
        }
        field(6; "Job Title"; Text[30])
        {
            Caption = 'Job Title';
            Editable = false;
        }
        field(7; "Search Name"; Code[250])
        {
            Caption = 'Search Name';
            Editable = false;

        }
        field(8; "Company Display Name"; Text[250])
        {
            Caption = 'Display Name';
            Editable = false;
        }
        field(9; "Email"; Code[250])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
            Editable = false;

        }
        field(10; "Company Name."; Text[30])
        {
            Caption = 'Company Name';
            Editable = false;
        }
        field(31; Status; Enum "Employee Status")
        {
            Caption = 'Status';
            Editable = false;
        }

    }

    keys
    {
        key(Key1; "No.", "Company Name.")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "First Name", "Last Name", "Job Title") { }
        fieldgroup(Brick; "No.", "First Name", "Last Name", "Job Title") { }
        // Add changes to field groups here
    }

    var
        myInt: Integer;
        emp: Record Employee;



    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}