tableextension 60605 BankAccountTableExt extends "Bank Account"
{
    fields
    {
        field(60600; "Use For Imprest"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60601; "Imprest/Float Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}
