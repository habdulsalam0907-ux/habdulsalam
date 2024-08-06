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

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}