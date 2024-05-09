page 60608 "Employee Role History"
{
    PageType = List;
    SourceTable = "Employee Role History";
    Caption = 'Employee Role History';
    Editable = false;
    // DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
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

    var
        UserSetup: Record "User Setup";
        HRSetup: Record "REI-HR Setup";

    trigger OnOpenPage()
    begin
        UserSetup.Reset;
        UserSetup.Get(UserId);
        if (UserSetup."HR Manager" or UserSetup."Payroll Officer" or UserSetup.CEO or UserSetup."Head of Corp Services") Or
            (UserId IN [HRSetup."HCS User ID", 
                        HRSetup."HR Manager ID",
                        HRSetup."CEO User ID"]) then 
        begin
            exit;
        end else begin // User will see record relating User ID
                       //even after having permission to view others record
            UserSetup.TestField("Employee No.");
            Rec.FilterGroup(10);
            Rec.SetRange("Employee No", UserSetup."Employee No.");
            Rec.FilterGroup(0);
        end;
    end;
}

