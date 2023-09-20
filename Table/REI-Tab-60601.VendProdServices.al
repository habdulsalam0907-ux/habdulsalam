table 60601 "Vendor Prod/Services Category"
{
    DataClassification = ToBeClassified;
    DataCaptionFields = "Code", Description;
    LookupPageID = "Vendor Product/Service List";
    Caption = 'Product/Services Categories';
    
    fields
    {
        field(1;Code; Code[30])
        {
            DataClassification = ToBeClassified;
            
        }
        field(2;Description; Text[150])
        {
            DataClassification = ToBeClassified;
            
        }
    }
    
    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
    
}