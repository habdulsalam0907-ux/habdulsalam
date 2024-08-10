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
                Visible = false;
            }
        }
    }
}

pageextension 60624 "FA SubClass Ext" extends "FA Subclasses"
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            field("For Vehicles"; Rec."For Vehicles")
            {
                ApplicationArea = All;
            }
        }
    }
}