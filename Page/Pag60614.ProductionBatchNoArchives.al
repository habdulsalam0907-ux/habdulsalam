page 60614 "Production Batch No. Archives"
{
    ApplicationArea = All;
    Caption = 'Production Batch No. Archives';
    PageType = List;
    SourceTable = "Production Bach Order Archive";
    UsageCategory = History;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Batch No."; Rec."Batch No.")
                {
                    ToolTip = 'Specifies the value of the Batch No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Production Date"; Rec."Production Date")
                {
                    ToolTip = 'Specifies the value of the Production Date field.';
                }
            }
        }
    }
}
