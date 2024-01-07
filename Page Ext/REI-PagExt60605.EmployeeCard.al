pageextension 60605 EmployeeCardExt extends "Employee Card"
{
    layout
    {
        addafter("Job Title")
        {
            field("Manager ID"; Rec."Manager ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Manager User ID field.';
            }
            field("Manager No."; Rec."Manager No.")
            {
                Caption = 'Manager No.';
                ApplicationArea = All;
                Description = 'Manager No. for the employee';
                ToolTip = 'Specifies the Manager No. for the employee';
            }
            field("Manager Name"; Rec."Manager Name")
            {
                Caption = 'Manager Name';
                ApplicationArea = All;
                Description = 'Manager Name for the employee';
                ToolTip = 'Specifies the Manager Name for the employee';
            }
            field("Manager's Email"; Rec."Manager's Email")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Manager''s Email field.';
            }
            field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            }
            field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            }
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
        }
        addafter(Gender)
        {
            field(Nationality; Rec.Nationality)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Nationality field.';
                Editable = EditableAcess;
            }
            field("Nationality Text"; Rec."Nationality Text")
            {
                Caption = 'Nationality Details';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Nationality Name field.';
            }
            field("State Of Origin"; Rec."State Of Origin")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the State Of Origin field.';
                Editable = EditableAcess;
            }
            field(LGA; Rec.LGA)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Local Government Area field.';
                Editable = EditableAcess;
            }
            field("Employee Balance"; Rec."Employee Balance LCY")
            {
                Caption = 'Employee Balance';
                ApplicationArea = All;
                Description = 'Employee Balance for the employee';
                ToolTip = 'Specifies the Employee Balance for the employee';
                DrillDownPageId = "Detailed Empl. Ledger Entries";
            }
            field("Employee Balance LCY"; Rec."Employee Balance LCY")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Employee Balance LCY for the employee';
                Caption = 'Employee Balance LCY';
                DrillDownPageId = "Detailed Empl. Ledger Entries";
            }
        }

        addafter(Administration)
        {
            group("Dependent Information")
            {
                Caption = 'Dependent Information';
                Visible = UnlimitedAccess;
                Editable = EditableAcess;

                field("Maiden Name"; Rec."Maiden Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maiden Name field.';
                }
                field("Spouse's Name"; Rec."Spouse's Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Spouse''s Name field.';
                }
                field("No of Children"; Rec."No of Children")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Children field.';
                }
                field("Dependant 1 Name"; Rec."Dependant 1 Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 1 Name field.';
                }
                field("Dependant 1 Sex"; Rec."Dependant 1 Sex")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 1 Sex field.';
                }
                field("Dependant 1 DOB"; Rec."Dependant 1 DOB")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 1 DOB field.';
                }
                field("Dependant 2 Name"; Rec."Dependant 2 Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 2 Name field.';
                }
                field("Dependant 2 Sex"; Rec."Dependant 2 Sex")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 2 Sex field.';
                }
                field("Dependant 2 DOB"; Rec."Dependant 2 DOB")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 2 DOB field.';
                }
                field("Dependant 3 Name"; Rec."Dependant 3 Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 3 Name field.';
                }
                field("Dependant 3 Sex"; Rec."Dependant 3 Sex")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 3 Sex field.';
                }
                field("Dependant 3 DOB"; Rec."Dependant 3 DOB")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 3 DOB field.';
                }
                field("Dependant 4 Name"; Rec."Dependant 4 Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 4 Name field.';
                }
                field("Dependant 4 Sex"; Rec."Dependant 4 Sex")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 4 Sex field.';
                }
                field("Dependant 4 DOB"; Rec."Dependant 4 DOB")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependant 4 DOB field.';
                }

            }

        }
        addbefore("Employment Date")
        {
            field("Employment Type"; Rec."Employment Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employment Type.';
            }
            field("Confirmation Status"; Rec."Confirmation Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Confirmation Status.';
            }
            field("Date of Joining the company"; Rec."Date of Joining the company")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Date of Joining the company.';
                Editable = (Rec."Employment Type" = Rec."Employment Type"::"Internship");
                ShowMandatory = true;
            }
            field("Internship Duration"; Rec."Internship Duration")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Internship Duration.';
                Editable = (Rec."Employment Type" = Rec."Employment Type"::"Internship");
            }
            field("Internship Due-Date"; Rec."Internship Due-Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Internship Due-Date';
                Editable = false;
            }
            field(EndInternshipNotificatnSent; Rec.EndInternshipNotificatnSent)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the End Of Internship Notice Sent.';
                Editable = false;
            }

        }
        addafter("Employment Date")
        {
            field("Probation Period"; Rec."Probation Period")
            {
                Caption = 'Probation Period (Months)';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Probation Period.';
                Editable = (Rec."Confirmation Status" = Rec."Confirmation Status"::"On Probation");
                ShowMandatory = true;
            }
            field("End of Probation"; Rec."End of Probation")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the end of probation';
                Editable = false;
            }
            field(EndProbationNotificatnSent; Rec.EndProbationNotificatnSent)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the End Of Internship Notice Sent.';
                Editable = false;
            }
            field("Confirmation Date"; Rec."Confirmation Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Confirmation Date.';
                Editable = false;

            }
            field("Confirmed Employee"; Rec."Confirmed Employee")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Confirmation Employee';
                Editable = false;
            }
        }
        addlast(Administration)
        {
            field("Marital Status"; Rec."Marital Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Marital Status field.';
            }
        }
        addafter("Bank Account No.")
        {
            field("Bank Account Name"; Rec."Bank Account Name")
            {
                ApplicationArea = All;
            }
            field("Bank Name"; Rec."Bank Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bank Name field.';
            }
            field("Bank Sort Code"; Rec."Bank Sort Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bank Sort Code field.';
            }
            
        }
        addafter(Payments)
        {
            group("Benefits")
            {
                Caption = 'Benefit And Others';
                Visible = UnlimitedAccess;
                field("Tax Authority"; Rec."Tax Authority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tax Authority field.';
                }
                field("Tax ID"; Rec."Tax ID")
                {
                    Caption = 'Tax Identification Number';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tax ID Number field.';
                }
                field("PFA Code"; Rec."PFA Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("PFA Administrator"; Rec."PFA Administrator")
                {
                    ApplicationArea = All;
                }
                field("PFA No."; Rec."PFA No.")
                {
                    ApplicationArea = All;
                    Caption = 'PFA/RSA No.';
                }
                field("NHF Number"; Rec."NHF Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NHF Number field.';
                }
                field("BVN"; Rec."BVN")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BVN field.';
                }
                field("NIN"; Rec."NIN")
                {
                    Caption = 'NIN';
                    ToolTip = 'Specifies the value of the BVN field.';
                    ApplicationArea = All;
                }
                group(AnnualPayDetails)
                {
                    Caption = 'Annual Pay Details';
                    Editable = EditableAcess;
                    field("Contract Currency Code"; Rec."Contract Currency Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Contract/Salary Currency Code field.';
                    }
                    field("Annual Gross"; Rec."Annual Gross")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Annual Gross field.';
                    }
                    field("Annual Basic Salary"; Rec."Annual Basic Salary")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Annual Basic Salary field.';
                    }
                    field("Annual Housing"; Rec."Annual Housing")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Annual Housing field.';
                    }
                    field("Annual Transport"; Rec."Annual Transport")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Annual Transport field.';
                    }
                    field("Annual Other"; Rec."Annual Other")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Annual Other field.';
                    }
                    field("Annual Leave Allowance"; Rec."Annual Leave Allowance")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Annual Leave Allowance field.';
                    }
                    field("Special 13th Month"; Rec."Special 13th Month")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Special 13th Month field.';
                    }
                }
            }
            group("Health Information")
            {
                Editable = EditableAcess;

                field("Medical Condition?"; Rec."Medical Condition?")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medical Condition? field.';

                    trigger OnValidate()
                    begin
                        if Rec."Medical Condition?" then
                            IsMedical := TRUE
                        ELSE BEGIN
                            CLEAR(Rec."Medical List");
                            IsMedical := FALSE;
                        end
                    end;
                }
                field("Medical List"; Rec."Medical List")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Medical List field.';
                    Multiline = true;
                    Editable = IsMedical;
                }
                field(Genotype; Rec.Genotype)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Genotype field.';
                }
                field("Blood Type"; Rec."Blood Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blood Type field.';
                }
            }
        }

        addafter("Employee Posting Group")
        {
            field("Salary Net Pay"; Rec."Salary Net Pay")
            {
                Caption = 'Salary Net Pay';
                ApplicationArea = All;
                Description = 'Salary Net Pay for the employee';
                ToolTip = 'Specifies the Salary Net Pay for the employee';
            }
        }
        addafter(LGA)
        {

            field(Religion; Rec.Religion)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Religion field.';
            }
        }

        addafter("Birth Date")
        {
            field("Business Area"; Rec."Business Area")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Business Area field.';
            }
        }
        #region ModifyingFieldGroupProperties
        modify(General)
        {
            Editable = EditableAcess;
            Visible = UnlimitedAccess;
        }
        modify("No.")
        {
            Editable = EditableAcess;
        }
        modify("Address & Contact")
        {
            Visible = UnlimitedAccess;
            Editable = EditableAcess;
        }
        modify(Administration)
        {
            Visible = UnlimitedAccess;
            Editable = EditableAcess;
        }
        modify(Control13)
        {
            Visible = UnlimitedAccess;
            Editable = EditableAcess;
        }
        modify(Control31)
        {
            Visible = UnlimitedAccess;
            Editable = EditableAcess;
        }
        modify(Control7)
        {
            Visible = UnlimitedAccess;
            Editable = EditableAcess;
        }
        modify(Payments)
        {
            Visible = UnlimitedAccess;
            Editable = EditableAcess;
        }
        modify(Personal)
        {
            Visible = UnlimitedAccess;
            Editable = EditableAcess;
        }
        modify("Employment Date")
        {
            Editable = (Rec."Confirmation Status" = Rec."Confirmation Status"::"On Probation");
            Importance = Promoted;
            ShowMandatory = true;
        }
        #endregion ModifyingFieldGroupProperties
        addafter(Control3)
        {
            part(EmpRoleHistory; "Employee Role History FactBox")
            {
                ApplicationArea = BasicHR;
                SubPageLink = "Employee No" = field("No.");
            }
        }
    }

    actions
    {
        modify("E&mployee")
        {
            Visible = UnlimitedAccess;
        }
        modify(History)
        {
            Visible = UnlimitedAccess;
        }
        modify("F&unctions")
        {
            Visible = UnlimitedAccess;
        }
        modify("&Confidential Information")
        {
            Visible = UnlimitedAccess;
        }
        modify("&Picture")
        {
            Visible = UnlimitedAccess;
        }
        modify("&Relatives")
        {
            Visible = UnlimitedAccess;

        }
        modify("A&bsences")
        {
            Visible = UnlimitedAccess;

        }
        modify(PayEmployee)
        {
            Visible = UnlimitedAccess;
        }
        modify(Contact)
        {
            Visible = UnlimitedAccess;
        }
        modify("Q&ualifications")
        {
            Visible = UnlimitedAccess;
        }
        addafter("&Relatives")
        {
            action("Next of Kin")
            {
                image = Relatives;
                Caption = 'Next of Kin';
                ApplicationArea = Basic, Suite;
                RunObject = Page "HR Employee Kin SF";
                RunPageView = where(type = filter("Next of Kin"));
                RunPageLink = "Employee Code" = field("No.");
            }

            action("Beneficiary")
            {
                image = Opportunity;
                Caption = 'Beneficiary';
                ApplicationArea = Basic, Suite;
                RunObject = Page "HR Employee Kin SF";
                RunPageView = where(type = filter("Beneficiary"));
                RunPageLink = "Employee Code" = field("No.");
            }
            action(Referee)
            {
                image = ContactReference;
                Caption = 'Referees';
                ApplicationArea = Basic, Suite;
                RunObject = Page "Employee Referees/Guarantors";
                RunPageLink = "Employee No" = field("No.");
            }
            action(RoleHistory)
            {
                image = ContactReference;
                Caption = 'Job Role History';
                ApplicationArea = Basic, Suite;
                RunObject = Page "Employee Role History";
                RunPageLink = "Employee No" = field("No.");
            }
        }

    }



    var
        UnlimitedAccess: Boolean;
        IsMedical: Boolean;
        EditableAcess: Boolean;


    #region SetUserAccessLevel
    procedure SetUserAccessLevel()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId) then begin
            if (UserSetup."HR Manager" or UserSetup."HR Officer" Or
                UserSetup."Finance Manager" Or UserSetup."Fin/Acc Officer") and
                UserSetup."View Employee Record" then 
            begin
                UnlimitedAccess := true;
                exit;
            end else
                if UserSetup."View Employee Record" And
                    (UserSetup."Team Lead" Or UserSetup.HODGeneral Or
                    UserSetup."ESS Proxy") then 
                begin
                    Rec.FILTERGROUP(10);
                    Rec.SETRANGE("Global Dimension 2 Code", UserSetup."Department Code");
                    Rec.FILTERGROUP(0);
                    UnlimitedAccess := false;
                end else begin
                    If UserSetup."Employee No." = '' then
                        Message('Your Employee No, has not been assigned to your user setup.');
                    Rec.Reset();
                    Rec.FilterGroup(20);
                    Rec.SetRange("No.", UserSetup."Employee No.");
                    Rec.FilterGroup(0);
                    UnlimitedAccess := true;
                end;

            If (Rec."No." = UserSetup."Employee No.") Or
                ((UserSetup."HR Manager" or UserSetup."HR Officer" Or
                UserSetup."Finance Manager" Or UserSetup."Fin/Acc Officer") and
                UserSetup."View Employee Record")
            then
                UnlimitedAccess := true
            else
                UnlimitedAccess := false;
        end else begin
            Message('Contact IT to add/complete your user setup record in this company!!!');
            Rec.Reset();
            Rec.FilterGroup(20);
            Rec.SetRange("No.", '');
            Rec.FilterGroup(0);
        end;
    end;
    #endregion SetUserAccessLevel

    #region OnOpenPage
    trigger OnOpenPage()
    var
        HRSetup: Record "REI-HR Setup";
        UserSetup: Record "User Setup";
    begin
        SetUserAccessLevel();

        // Hrsetup.Get();
        // UserSetup.Reset();
        // If UserSetup.Get(UserId) then begin
        //     if (Usersetup."HR Manager" or UserSetup."HR Officer") OR
        //         (HRSetup."HR Manager ID" = UserSetup."User ID") then begin
        //         EditableAcess := true
        //     end else begin
        //         EditableAcess := false;
        //     end
        // end;
    end;

    #endregion OnOpenPage

    #region OnAfterGetRecord
    trigger OnAfterGetRecord()
    var
        HRSetup: Record "REI-HR Setup";
        UserSetup: Record "User Setup";
    begin
        SetUserAccessLevel();

        Hrsetup.Get();
        UserSetup.Get(UserId);
        if (Usersetup."HR Manager" or UserSetup."HR Officer") OR
            (HRSetup."HR Manager ID" = UserSetup."User ID") then
            EditableAcess := true
        else
            EditableAcess := false;
    end;
    #endregion OnAfterGetRecord

}
