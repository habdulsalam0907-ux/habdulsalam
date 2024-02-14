Table 60608 "HR Job Grades & Benefits Setup"
{
    DrillDownPageID = "Job Grade & Benefits Lookup";
    LookupPageID = "Job Grade & Benefits Lookup";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Job Grade Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Grade";

            trigger OnValidate()
            var
                JobGrade: Record "Job Grade";
            begin
                If JobGrade.Get("Job Grade Code") then 
                    "Job Grade Description" := JobGrade.Description
                else
                    Clear("Job Grade Description");
            end;
        }
        field(3; "Job Grade Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Grade Level Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Grade Level";

            trigger OnValidate()
            var
                JobGradeLevel: Record "Job Grade Level";
            begin
                If JobGradeLevel.Get("Grade Level Code") then 
                    "Grade Level Description" := JobGradeLevel."Grade Level"
                else
                    Clear("Grade Level Description");
            end;
        }
        field(5; "Grade Level Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Annual Leave Days"; Decimal)
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
        fieldgroup(DropDown; Code, "Job Grade Description", "Grade Level Description") { }
    }

    trigger OnInsert()
    begin
        CreateJobGradeSetupCode();
    end;

    local procedure CreateJobGradeSetupCode()
    begin
        TestField("Grade Level Code");
        TestField("Job Grade Code");
        Code := "Job Grade Code" + "Grade Level Code";
    end;
}
