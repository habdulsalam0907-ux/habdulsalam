page 60616 "Employee Bank Name"
{
    PageType = List;
    SourceTable = "Employee Bank Name";
    Caption = 'Employee Bank Name';
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
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}

