page 60600 "Product/Service List"
{
    ApplicationArea = All;
    Caption = 'Customer Product/Service';
    PageType = List;
    InsertAllowed = true;
    DeleteAllowed = true;
    SourceTable = "Product/Services";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
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
