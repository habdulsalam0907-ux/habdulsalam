table 60620 "Company Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Company Setup';
    DataPerCompany = false;
    Scope = Cloud;
    ReplicateData = false;

    fields
    {
        field(1; Name; Text[30])
        {
            Caption = 'Name';
            TableRelation = Company;
            trigger OnValidate()
            var
                CompanyRec: Record Company;
                Companies: page Companies;
            begin
                if CompanyRec.Get(Name) then begin
                    "Display Name" := CompanyRec."Display Name";
                end
            end;
        }
        field(3; "Display Name"; Text[1000])
        {
            Caption = 'Display Name';
            Editable = false;
        }
        field(4; Id; Guid)
        {
            Caption = 'Id';
            Editable = false;
        }
        field(5; "Is Active?"; Boolean)
        {
            Caption = 'Is Active?';
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

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