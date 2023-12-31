page 60608 "Employee Role History"
{
    PageType = List;
    SourceTable = "Employee Role History";
    Caption = 'Employee Role History';
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("New Role Description"; Rec."New Role Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Role Description field.';
                }
                field("New Role Start Date"; Rec."New Role Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Role Start Date field.';
                }
                field("New Role End Date"; Rec."New Role End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Role End Date field.';
                }
                field("Days Spent On Role"; Rec."Days Spent On Role")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Days Spent On Role field.';

                    trigger OnDrillDown()
                    begin

                    end;
                }
                field("Previous Role Description"; Rec."Previous Role Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Previous Role Description field.';
                }
                field("Previous Role End Date"; Rec."Previous Role End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Previous Role End Date field.';
                }
            }
        }
    }
}

