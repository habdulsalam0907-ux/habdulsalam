tableextension 60620 HRSetupEx extends "REI-HR Setup"
{
    fields
    {
        field(60620; "Retirement Age"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                If "Retirement Age" < 0 then
                    Error('This msut be a positive value!!!');
            end;
        }
    }
}


