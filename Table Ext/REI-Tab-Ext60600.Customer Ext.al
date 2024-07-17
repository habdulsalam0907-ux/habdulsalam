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
        field(50009; "LPG Customer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50099; "Lubricant Customer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Credit Customer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        //Lubricants Customer, White Product customer, and Bitumen. 
        field(50022; "White Product customer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Bitumen Customer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }



        field(50011; "Location Customer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Verification Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Rejected,Verified';
            OptionMembers = Open,"Pending Approval",Rejected,Verified;
        }
        field(60618; "Primary Contact Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        //position, c. email d. phone no
        field(60619; "Primary Contact Position"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(60620; "Primary Contact"; Text[20])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(60621; "Primary Contact Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        //Operations Contact a. Name b. position c. email d. phone no
        field(60622; "Operations Contact Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(60623; "Operations Contact Phone"; Text[20])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(60624; "Operations Contact Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        //  RC no 3. Country of registration
        field(60625; "RC No."; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(60627; "TIN."; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(60626; "Country of Registration"; enum "Country/Region Address Format")
        {
            DataClassification = ToBeClassified;

        }
        field(60639; "Country of Registrations"; text[100])
        {
            TableRelation = "Country/Region";

        }
    }

    var
        myInt: Integer;

        local procedure MyProcedure()
        var
            myInt: Integer;
        begin
          
        end;
}


