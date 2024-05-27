page 60619 "Employee Religion List"
{
    PageType = List;
    SourceTable = "Employee Religion";
    Caption = 'Employee Religion List';
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Religion; Rec.Religion)
                {
                    ToolTip = 'Specifies the value of the Religion field.';
                }
            }
        }
    }
}

