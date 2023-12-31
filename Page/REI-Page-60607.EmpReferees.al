page 60607 "Employee Referees/Guarantors"
{
    PageType = List;
    SourceTable = "Employee Referees/Guarantor";
    Caption = 'Referees/Guarantors';
    AutoSplitKey = true;
    DelayedInsert = true;
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application No field.';
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Visible = false;
                }
                field("Reference Type"; Rec."Reference Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reference Type field.';
                }
                field("Referee Full Name"; Rec."Referee Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Referee Full Name field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Telephone No"; Rec."Telephone No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telephone No field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

