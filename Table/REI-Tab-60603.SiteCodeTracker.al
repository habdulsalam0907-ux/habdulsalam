table 60603 "Project Site Code Tracker"
{
    DataClassification = ToBeClassified;
    DataCaptionFields = "Customer Name Abbreviation", 
                        "Location State Code", 
                        "Last Project No";
    LookupPageID = "Project Site Code Tracker";
    
    fields
    {
        field(1; "Customer Name Abbreviation"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Location State Code"; Code[3])
        {
            DataClassification = ToBeClassified;
            TableRelation = "State of Project Location";
        }
        field(3; "Last Project No"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(Key1; "Customer Name Abbreviation","Location State Code")
        {
            Clustered = true;
        }
    }
    
    trigger OnInsert()
    begin
        "Last Project No" := '000';
    end;
    
}