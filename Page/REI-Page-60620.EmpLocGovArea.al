page 60620 "Local Government Area List"
{
    PageType = List;
    SourceTable = "Local Government Area";
    Caption = 'Local Government Area List';
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Local Government Area"; Rec."Local Government Area")
                {
                    ToolTip = 'Specifies the value of the Local Government Area field.';
                }
            }
        }
    }
}

