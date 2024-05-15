page 60618 "State/County List"
{
    PageType = List;
    SourceTable = "Address States/County";
    Caption = 'State/County List';
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(State; Rec.State)
                {
                    ToolTip = 'Specifies the value of the State field.';
                }
            }
        }
    }
}

