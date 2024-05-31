pageextension 60625 EmployeeListExt extends "Employee List"
{
    layout
    {
        addafter("No.")
        {
            field("Custom Title/Honorific"; Rec."Custom Title/Honorific")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Title field.', Comment = '%';
            }
        }
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
            field("Tax ID"; Rec."Tax ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Tax ID Number field.';
            }
            field("Employee Job Location"; Rec."Employee Job Location")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employee Job Location field.';
            }
            field("Years In Service"; Rec.GetYearsInService())
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of years employee has spent in service';
                Editable = false;
                DrillDown = true;

                trigger OnDrillDown()
                begin
                    
                end;
            }
        }
        addafter("Search Name")
        {
            field("Date Of Birth"; Rec."Date Of Birth")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Date Of Birth field.', Comment = '%';
            }
            field(Gender; Rec.Gender)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the gender with which the employee identifies.';
            }
            field("Marital Status"; Rec."Marital Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Marital Status field.';
            }
            field("Company E-Mail"; Rec."Company E-Mail")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the employee''s email address at the company.';
            }
            field(Designation; Rec.Designation)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Designation field.', Comment = '%';
            }
            field("Employment Date"; Rec."Employment Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the date when the employee began to work for the company.';
            }
            field("Bank Code"; Rec."Bank Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bank Code field.';
            }
            field("Bank Account No."; Rec."Bank Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number used by the bank for the bank account.';
            }
            field("Bank Sort Code"; Rec."Bank Sort Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bank Sort Code field.';
            }
            field("PFA Code"; Rec."PFA Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the PFA Code field.', Comment = '%';
            }
            field("PFA Administrator"; Rec."PFA Administrator")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the PFA Administrator field.', Comment = '%';
            }
            field("PFA No."; Rec."PFA No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the PFA No. field.', Comment = '%';
            }
            field("Applicable Job Grade"; Rec."Applicable Job Grade")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Applicable Job Grade field.';
            }
            field("Job Grade Description"; Rec."Job Grade Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Grade Description field.';
            }
            field(Nationality; Rec.Nationality)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Nationality field.';
            }
            field("State Of Origin"; Rec."State Of Origin")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the State Of Origin field.';
            }
            field(LGA; Rec.LGA)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Local Government Area field.';
            }
            field(Religion; Rec.Religion)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Religion field.';
            }
            field(BVN; Rec.BVN)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the BVN field.';
            }
            field(NIN; Rec.NIN)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the BVN field.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        If Rec.FindSet() then begin
            repeat
                Rec.UpdateEmployeeBankAccountName();
            until Rec.Next() = 0;
        end;
    end;
}