page 60604 "Leased Asset Classes"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Leased Asset Class";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec.Classes)
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Useful Life (Yrs)"; Rec."Useful Life (Yrs)")
                {
                    ToolTip = 'Specifies the value of the Useful Life (Yrs) field.';
                }
                field("Useful Life (Mth)"; Rec."Useful Life (Mth)")
                {
                    ToolTip = 'Specifies the value of the Useful Life (Mth) field.';
                }
            }
        }
    }
}
