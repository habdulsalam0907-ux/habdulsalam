page 60612 "Job Grade & Benefits Setup"
{
    PageType = List;
    SourceTable = "HR Job Grades & Benefits Setup";
    Caption = 'Job Grade & Benefits Setup';
    ApplicationArea = All;
    DelayedInsert  = true;
    UsageCategory = Administration;

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
                field("Job Grade Code"; Rec."Job Grade Code")
                {
                    ToolTip = 'Specifies the value of the Job Grade Code field.';
                }
                field("Job Grade Description"; Rec."Job Grade Description")
                {
                    ToolTip = 'Specifies the value of the Job Grade Description field.';
                }
                field("Grade Level Code"; Rec."Grade Level Code")
                {
                    ToolTip = 'Specifies the value of the Grade Level Code field.';
                }
                field("Grade Level Description"; Rec."Grade Level Description")
                {
                    ToolTip = 'Specifies the value of the Grade Level Description field.';
                }
                field("Annual Leave Days"; Rec."Annual Leave Days")
                {
                    ToolTip = 'Specifies the value of the Annual Leave Days field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(JobGrades)
            {
                Caption = 'Job Grades';
                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                RunObject = page "Job Grades";
                RunPageMode = Edit;
            }
            action(JobGradeLevel)
            {
                Caption = 'Job Grade Level';
                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                RunObject = page "Job Grade Levels";
                RunPageMode = Edit;
            }
        }
    }
}

