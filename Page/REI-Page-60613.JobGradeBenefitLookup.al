page 60613 "Job Grade & Benefits Lookup"
{
    PageType = List;
    SourceTable = "HR Job Grades & Benefits Setup";
    Caption = 'Job Grade & Benefits Lookup';
    ApplicationArea = All;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Job Grade Description"; Rec."Job Grade Description")
                {
                    ToolTip = 'Specifies the value of the Job Grade Description field.';
                }
                field("Grade Level Description"; Rec."Grade Level Description")
                {
                    ToolTip = 'Specifies the value of the Grade Level Description field.';
                }
            }
        }
    }
}

