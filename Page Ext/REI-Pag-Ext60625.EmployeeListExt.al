pageextension 60625 EmployeeListExt extends "Employee List"
{
    layout
    {
        addafter("Global Dimension 2 Code")
        {
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
            }
            field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
            }
            field("Employment Type"; Rec."Employment Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employment Type.';
            }
            field("Contract Currency Code"; Rec."Contract Currency Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Contract/Salary Currency Code field.';
                Visible = false;
            }
            field("Tax Authority"; Rec."Tax Authority")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Tax Authority field.';
            }
            field("Employee Job Location"; Rec."Employee Job Location")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employee Job Location field.';
            }
        }

    }

}