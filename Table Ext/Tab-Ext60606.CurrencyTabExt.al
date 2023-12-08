tableextension 60606 CurrencyTableExt extends Currency
{
    fields
    {
        field(60600; "Minor Unit Code"; code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Minor unit is the smallest unit of a currency, e.g. 1 dollar equals 100 cents (with 2 decimals).';
        }
        field(60601; "Minor Unit Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Minor unit is the smallest unit of a currency, e.g. 1 dollar equals 100 cents (with 2 decimals).';
        }
    }
}
