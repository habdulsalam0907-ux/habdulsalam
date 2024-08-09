pageextension 60626 "Fa Class Ext" extends "FA Classes"
{
    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            field("Use As Vehicle"; Rec."Use As Vehicle")
            {
                ApplicationArea = All;

            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}