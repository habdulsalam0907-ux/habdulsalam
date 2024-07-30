tableextension 60602 VendorExt extends Vendor
{
    fields
    {
        // Add changes to table fields here
        field(60600; "Product/Services"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Prod/Services Category";
            Caption = 'Product/Service Category';
        }
        field(60601; "Vendor Status"; Enum CustStatusEnum)
        {
            DataClassification = ToBeClassified;
        }
        field(60602; "Vendor Type"; Enum VendorTypeEnum)
        {
            DataClassification = ToBeClassified;
        }
        field(60603; Insurance; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60604; "STS/Fendering"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60605; "Agencies Vendor"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60606; "Jetty Depot Vendor"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60607; "Storage Vendor"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60608; "Supplier"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60609; "Freight Vendor"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60610; "Inspection/Quality"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60611; Surveyor; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60612; MaintenanceVendor; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance Vendor';
        }
        field(60613; "Means Of Identification"; Option)
        {
            OptionMembers = Passport,"Driver License","Voter's Card","National ID Card";

        }
        field(60614; "Passport ID"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60615; NIN; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60616; "Voter's ID"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60617; "Driver License ID"; code[50])
        {
            DataClassification = ToBeClassified;
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
        field(60625; "RC No."; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(60626; "Country of Registration"; enum "Country/Region Address Format")
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(60639; "Country of Registrations"; text[100])
        {
            TableRelation = "Country/Region";

        }
        field(60627; "Civil Contractor"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60628; "Electrical contractor"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60629; "Process/Mechanical"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60630; Branding; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60631; "FX Vendor"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60632; "Human Resources"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60633; "Legal Services"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60634; "Transport/logistics"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60640; "Verification Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Rejected,Verified';
            OptionMembers = Open,"Pending Approval",Rejected,Verified;
        }

        // Regulatory
        field(60635; "Regulatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60636; "Vendor Business Posting Grp."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Bus Posting Group";
        }



        modify("Partner Type")
        {
            Caption = 'Business Type';
        }
        modify("Preferred Bank Account Code")
        {
            Caption = 'Preferred Bank Account  ';
        }

        modify(GLN)
        {
            Caption = 'Vendor TIN';
        }


    }


    var
        myInt: Integer;
}


