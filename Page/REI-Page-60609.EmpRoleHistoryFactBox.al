page 60609 "Employee Role History FactBox"
{
    PageType = ListPart;
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
                    Caption = 'Description';
                }
                field("New Role Start Date"; Rec."New Role Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Role Start Date field.';
                    Caption = 'Start Date';
                }
                field("New Role End Date"; Rec."New Role End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Role End Date field.';
                    Caption = 'End Date';
                }
                field("Days Spent On Role"; Rec."Days Spent On Role")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Days Spent On Role field.';
                    Caption = 'Days On Role';

                    trigger OnDrillDown()
                    begin

                    end;
                }
            }
        }
    }
}

