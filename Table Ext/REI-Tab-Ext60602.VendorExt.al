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

    }
    
    var
        myInt: Integer;
}


