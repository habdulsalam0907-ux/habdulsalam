pageextension 60610 "Currency Card Ext" extends "Currency Card"
{
    layout
    {
        addafter("ISO Numeric Code")
        {
            field("Minor Unit Code"; Rec."Minor Unit Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Minor Unit Code field. Minor unit is the smallest unit of a currency, e.g. 1 dollar equals 100 cents (with 2 decimals).';
            }
            field("Minor Unit Description"; Rec."Minor Unit Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Minor Unit Description field. Minor unit is the smallest unit of a currency, e.g. 1 dollar equals 100 cents (with 2 decimals).';
            }
        }
    }
}

pageextension 60611 "Currency List Ext" extends Currencies
{
    layout
    {
        addafter("ISO Numeric Code")
        {
            field("Minor Unit Code"; Rec."Minor Unit Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Minor Unit Code field. Minor unit is the smallest unit of a currency, e.g. 1 dollar equals 100 cents (with 2 decimals).';
            }
            field("Minor Unit Description"; Rec."Minor Unit Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Minor Unit Description field. Minor unit is the smallest unit of a currency, e.g. 1 dollar equals 100 cents (with 2 decimals).';
            }
        }
    }
}
