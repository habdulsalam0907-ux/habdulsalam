page 60611 "Job Grade Levels"
{
    PageType = List;
    SourceTable = "Job Grade Level";
    Caption = 'Job Grade Levels';
    ApplicationArea = All;


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
                field("Grade Level"; Rec."Grade Level")
                {
                    ToolTip = 'Specifies the value of the Grade Level field.';
                }
            }
        }
    }
}

