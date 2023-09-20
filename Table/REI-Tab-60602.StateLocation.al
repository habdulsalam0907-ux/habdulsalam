table 60602 "State of Project Location"
{
    DataClassification = ToBeClassified;
    DataCaptionFields = "Code", Description;
    LookupPageID = "State of Project Location";
    
    fields
    {
        field(1;Code; Code[3])
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