page 60601 "Vendor Product/Service List"
{
    ApplicationArea = All;
    Caption = 'Vendor Product/Service Categories';
    PageType = List;
    InsertAllowed = true;
    DeleteAllowed = true;
    SourceTable = "Vendor Prod/Services Category";
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
