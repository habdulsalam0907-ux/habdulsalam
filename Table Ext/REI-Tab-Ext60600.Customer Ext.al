tableextension 60600 CustomerEx extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Product/Services"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Product/Services";
        }
        field(50001; "Customer Status"; Enum CustStatusEnum)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "System Type"; Enum SystemTypeEnum)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Billing Cycle"; Enum BillingCycleEnum)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Customer Type"; Enum CustTypeEnum)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Customer Name Abbreviation"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Customer Business Group"; Text[30])
        {
            DataClassification = ToBeClassified;
        }

    }

    var
        myInt: Integer;
}


