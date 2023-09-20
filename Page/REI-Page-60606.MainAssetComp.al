page 60606 "MainAsset Components"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "FA Depreciation Book";
    UsageCategory = Lists;
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("FA No."; Rec."FA No.")
                {
                    ToolTip = 'Specifies the number of the related fixed asset. ';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value in the Description field on the fixed asset card.';
                }
                field("Book Value"; Rec."Book Value")
                {
                    ToolTip = 'Specifies the book value for the fixed asset.';
                }
            }
            // group(Totals)
            // {
            //     field(BookValue; Rec.CalcSums("Book Value"))
            //     {
            //         ToolTip = 'Specifies the number of the related fixed asset. ';
            //         Caption = 'Total Book Value';
            //         Editable = false;
            //         DrillDown = true;
            //     }
            // }
        }
    }
}
