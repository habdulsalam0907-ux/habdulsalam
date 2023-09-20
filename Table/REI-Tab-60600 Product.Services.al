table 60600 "Product/Services"
{
    DataClassification = ToBeClassified;
    DataCaptionFields = "Code", Description;
    LookupPageID = "Product/Service List";
    
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
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}