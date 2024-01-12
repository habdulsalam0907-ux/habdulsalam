tableextension 60607 SalesReceivableSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(60600; "Head, SM"; Boolean)
        {
            Caption = 'Head, SM';
            DataClassification = ToBeClassified;
        }
        field(60601; "Head, SM First Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60602; "Head, SM Email"; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
    }
}
