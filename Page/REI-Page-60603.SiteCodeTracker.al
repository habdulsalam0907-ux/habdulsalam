page 60603 "Project Site Code Tracker"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Project Site Code Tracker";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer Name Abbreviation"; Rec."Customer Name Abbreviation")
                {
                    ToolTip = 'Specifies the value of the Customer Name Abbreviation field.';
                }
                field("Location State Code"; Rec."Location State Code")
                {
                    ToolTip = 'Specifies the value of the Location State Code field.';
                }
                field("Last Project No"; Rec."Last Project No")
                {
                    ToolTip = 'Specifies the value of the Last Project No field.';
                }
            }
        }
    }
}
