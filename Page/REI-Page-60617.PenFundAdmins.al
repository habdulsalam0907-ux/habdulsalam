page 60617 "Pension Fund Administrator"
{
    PageType = List;
    SourceTable = "Pension Fund Administrator";
    Caption = 'Pension Fund Administrator';
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
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}

