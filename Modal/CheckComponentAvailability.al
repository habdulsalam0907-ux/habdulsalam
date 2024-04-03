page 60649 "Check Component Availability"
{
    PageType = StandardDialog;
    // PromptMode = Prompt;
    Extensible = false;
    ApplicationArea = Basic, suite;

    layout
    {

        area(Content)
        {

            field("From Location"; FromLocation)
            {
                Caption = 'From Location';
                TableRelation = Location;
                ShowMandatory = true;
                NotBlank = true;
            }

            field("To Location"; ToLocation)
            {
                Caption = 'To Location';
                TableRelation = Location;
                ShowMandatory = true;
                NotBlank = true;
            }
        }
    }

    actions
    {

    }
    var
        FromLocation: code[20];
        ToLocation: code[20];

    procedure getFromLocation(): Code[20]
    begin
        if FromLocation <> '' then exit(FromLocation)
    end;

    procedure setFromLocation(var from: code[20])
    begin
        if from <> '' then FromLocation := from;

    end;

    procedure getToLocation(): Code[20]
    begin
        if ToLocation <> '' then exit(ToLocation)
    end;

    procedure setToLocation(var ToLocations: code[20])
    begin
        if ToLocations <> '' then ToLocation := ToLocations;

    end;

}