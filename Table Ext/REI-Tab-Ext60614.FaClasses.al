tableextension 60614 "Fa Classes Ext" extends "FA Class"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Use As Vehicle"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                FaClasses: Record "FA Class";
            begin
                FaClasses.SetRange("Use As Vehicle", true);
                if FaClasses.FindFirst() then begin
                    Error('You can only select one class for vehicle usage');
                end
            end;
        }

    }
}

tableextension 60615 "FA SubClasses Ext" extends "FA Subclass"
{
    fields
    {
        field(60600; "For Vehicles"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                FASubClass: Record "FA Subclass";
            begin
                FASubClass.SetRange("For Vehicles", true);
                if FASubClass.FindFirst() then begin
                    Error('You can only select one sub class for vehicle usage!!!');
                end
            end;
        }
    }
}