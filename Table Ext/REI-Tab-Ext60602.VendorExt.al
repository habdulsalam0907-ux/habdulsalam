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
        field(60601; "Vendor Status"; Enum VendorStatusEnum)
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
    }
    var
        myInt: Integer;
}


