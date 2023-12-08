tableextension 60603 EmployeeTabExt extends Employee
{
    fields
    {
        modify("Manager No.")
        {
            trigger OnAfterValidate()
            begin
                If emp.Get("Manager No.") then
                    "Manager name" := Emp.FullName()
                else
                    Clear("Manager Name");
            end;
        }
        modify("Birth Date")
        {
            trigger OnAfterValidate()
            begin
                "Date Of Birth" := "Birth Date";
            end;
        }
        modify("Employment Date")
        {
            trigger OnAfterValidate()
            begin
                //"Date of Joining the company" := "Employment Date";
                IF "Employment Date" = 0D THEN BEGIN
                    CLEAR("Probation Period");
                    CLEAR("End of Probation");
                END ELSE
                    VALIDATE("Probation Period");
            end;
        }

        field(50000; "Salary Net Pay"; Decimal)
        {
            Caption = 'Salary Net Pay - Monthly';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /* If "Salary Net Pay" <> 0 then
                    "Annual Leave Allowance" := "Salary Net Pay" * 0.15
                else
                    Clear("Annual Leave Allowance"); */
            end;
        }
        field(50001; "Employee Balance"; Decimal)
        {
            Caption = 'Employee Balance';
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Detailed Employee Ledger Entry".Amount where("Employee No." = field("No."),
                                                "Entry Type" = filter("Initial Entry" | Application)));
        }
        field(50002; "Employee Balance LCY"; Decimal)
        {
            Caption = 'Employee Balance LCY';
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Employee Ledger Entry"."Amount (LCY)" WHERE("Employee No." = FIELD("No.")));
            Editable = false;

            //DataClassification = ToBeClassified;
        }
        field(50003; "Annual Gross"; Decimal)
        {
            Caption = 'Annual Gross';
            DataClassification = ToBeClassified;
        }
        field(50004; "Annual Basic Salary"; Decimal)
        {
            Caption = 'Annual Basic Salary';
            DataClassification = ToBeClassified;
        }
        field(50005; "Annual Housing"; Decimal)
        {
            Caption = 'Annual Housing';
            DataClassification = ToBeClassified;
        }
        field(50006; "Annual Transport"; Decimal)
        {
            Caption = 'Annual Transport';
            DataClassification = ToBeClassified;
        }
        field(50007; "Annual Other"; Decimal)
        {
            Caption = 'Annual Other';
            DataClassification = ToBeClassified;
        }
        field(50008; "Annual Leave Allowance"; Decimal)
        {
            Caption = 'Annual Leave Allowance';
            DataClassification = ToBeClassified;
        }
        field(50009; "Special 13th Month"; Decimal)
        {
            Caption = 'Special 13th Month';
            DataClassification = ToBeClassified;
        }
        field(50010; "Contract Currency Code"; Code[50])
        {
            Caption = 'Contract/Salary Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(50011; "Salary Grade"; Code[50])
        {
            Caption = 'Salary Grade';
            DataClassification = ToBeClassified;
        }
        field(50012; "Salary Step"; Code[10])
        {
            Caption = 'Salary Step';
            DataClassification = ToBeClassified;
        }
        field(50020; "Employee Group"; Code[20])
        {
            Caption = 'Employee Group';
            DataClassification = ToBeClassified;
        }
        field(50021; Designation; Text[50])
        {
            Caption = 'Designation';
            DataClassification = ToBeClassified;
        }
        field(50022; "Business Area"; Option)
        {
            Caption = 'Business Area';
            DataClassification = ToBeClassified;
            OptionMembers = " ",Profit,Cost;
        }
        field(50030; "Postal Address"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Postal Address';
        }
        field(50031; "Residential Address"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Residential Address';
        }
        field(50032; "Home Phone Number"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Home Phone Number';
        }
        field(50033; "Cell Phone Number"; Text[30])
        {
            Caption = 'Cell Phone Number';
            DataClassification = ToBeClassified;
        }
        field(50034; "Work Phone Number"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Work Phone Number';
        }
        field(50035; "Ext."; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ext.';
        }
        field(50036; "Personal E-Mail"; Text[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'Personal E-Mail';
        }
        field(50037; "ID Number"; Code[20])
        {
            Caption = 'ID Number';
            DataClassification = ToBeClassified;
            Description = 'Stores the id number of the applicant in the database';

            trigger OnValidate()
            begin
                HREmp.RESET;
                HREmp.SETRANGE(HREmp."ID Number", "ID Number");
                IF HREmp.FIND('-') THEN BEGIN
                    ERROR('This ID Number has been used in a prior Employee Registration.');
                END;
            end;
        }

        field(50038; "Nationality"; Text[20])
        {
            TableRelation = "Country/Region";
            Caption = 'Nationality';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                CIT.RESET;
                CIT.SETRANGE(CIT.Code, Nationality);
                IF CIT.FIND('-') THEN BEGIN
                    "Nationality Text" := CIT.Name;
                    "Country/Region Code" := Nationality;
                END;
            end;
        }
        modify("Country/Region Code")
        {
            trigger OnAfterValidate()
            begin
                validate(Nationality,"Country/Region Code");
            end;
        }
        field(50039; "Fax Number"; Text[30])
        {
            Caption = 'Fax Number';
            DataClassification = ToBeClassified;
        }
        field(50040; "Marital Status"; Option)
        {
            Caption = 'Marital Status';
            DataClassification = ToBeClassified;
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
            OptionCaption = '';
        }
        field(50041; "Ethnic Origin"; Option)
        {
            Caption = 'Ethnic Origin';
            DataClassification = ToBeClassified;
            OptionMembers = African,Indian,White,Coloured;
        }
        field(50042; "First Language (R/W/S)"; Text[50])
        {
            TableRelation = "HR Lookup Values".Code WHERE(Type = FILTER(Language));
            Caption = 'First Language (R/W/S)';
            DataClassification = ToBeClassified;
        }
        field(50043; "Disabled"; Option)
        {
            OptionMembers = No,Yes," ";
            Caption = 'Disabled';
            DataClassification = ToBeClassified;
        }
        field(50044; "Medical Condition?"; Boolean)
        {
            Caption = 'Medical Condition?';
            DataClassification = ToBeClassified;
        }
        field(50045; "Medical List"; Text[200])
        {
            Caption = 'Medical List';
            DataClassification = ToBeClassified;
        }
        field(50046; "Date Of Birth"; Date)
        {
            Caption = 'Date Of Birth';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            Var
                DateRec: Record Date;
            begin
                "Birth Date" := "Date Of Birth";
                IF FORMAT("Birth Date") <> '' THEN BEGIN
                    DateRec.GET(DateRec."Period Type"::Date, "Birth Date");
                    Age := DateRec."Period Name";
                END;
            end;
        }
        field(50047; "Second Language (R/W/S)"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code WHERE(Type = FILTER(Language));
            Caption = 'Second Language (R/W/S)';
            DataClassification = ToBeClassified;
        }
        field(50048; "Additional Language"; Code[20])
        {
            Caption = 'Additional Language';
            DataClassification = ToBeClassified;
        }
        field(50049; "State Of Origin"; Text[50])
        {
            Caption = 'State Of Origin';
            DataClassification = ToBeClassified;
        }
        field(50050; "LGA"; Text[50])
        {
            Caption = 'Local Government Area';
            DataClassification = ToBeClassified;
        }
        field(50051; "Religion"; Text[50])
        {
            Caption = 'Religion';
            DataClassification = ToBeClassified;
        }
        field(50052; "Residential Address 3"; Text[30])
        {
            Caption = 'Residential Address 3';
            DataClassification = ToBeClassified;
        }
        field(50053; "Post Code 2"; Code[20])
        {
            Caption = 'Post Code 2';
            DataClassification = ToBeClassified;
        }
        field(50054; "BVN"; Text[50])
        {
            Caption = 'BVN';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                HREmp.RESET;
                HREmp.SETRANGE(HREmp."BVN", "BVN");
                IF HREmp.FIND('-') THEN BEGIN
                    ERROR('This Passport Number has been used in a prior Employee Registration');
                END;
            end;
        }
        field(50055; "First Language Write"; Boolean)
        {
            Caption = 'First Language Write';
            DataClassification = ToBeClassified;
        }
        field(50056; "First Language Read"; Boolean)
        {
            Caption = 'First Language Read';
            DataClassification = ToBeClassified;
        }
        field(50057; "First Language Speak"; Boolean)
        {
            Caption = 'First Language Speak';
            DataClassification = ToBeClassified;
        }
        field(50058; "Second Language Read"; Boolean)
        {
            Caption = 'Second Language Read';
            DataClassification = ToBeClassified;
        }
        field(50059; "Second Language Write"; Boolean)
        {
            Caption = 'Second Language Write';
            DataClassification = ToBeClassified;
        }
        field(50060; "Second Language Speak"; Boolean)
        {
            Caption = 'Second Language Speak';
            DataClassification = ToBeClassified;
        }
        field(50061; "Nationality Text"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nationality Text';
        }
        field(50062; "NHF Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'NHF Number';
        }
        field(50063; Age; Text[50])
        {
            Caption = 'Age';
            DataClassification = ToBeClassified;
        }
        field(50064; "Date of Joining the company"; Date)
        {
            Caption = 'Date Of Joining the company';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "Date of Joining the company" = 0D THEN BEGIN
                    CLEAR("Internship Duration");
                    CLEAR("Internship Due-Date");
                END ELSE
                    VALIDATE("Internship Duration");
            end;

        }
        field(50065; "Manager Name"; Text[200])
        {
            Caption = 'Manager Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50066; "Manager's Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50067; "NIN"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'NIN';
        }
        field(50068; "PFA Administrator"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50069; "PFA Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Pension Administrators";

            // trigger OnValidate()
            // var
            //     PFA: Record "Pension Administrators";
            // begin
            //     If PFA.Get("PFA Code") then
            //         "PFA Administrator" := PFA.Name
            //     else
            //         "PFA Administrator" := '';
            // end;
        }
        field(50070; "PFA No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50081; "Bank Account Name"; Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50082; "No of Children"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50083; "Dependant 1 Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50084; "Maiden Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50085; "Spouse's Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50086; "Dependant 2 Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50087; "Dependant 3 Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50088; "Dependant 4 Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50089; "Genotype"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50090; "Blood Type"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50091; "Tax ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50092; "Bank Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50093; "Manager ID"; Code[50])
        {
            Caption = 'Manager User ID';
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                If UserSetUp.Get("Manager ID") then begin
                    "Manager Name" := UserSetUp."Full Name";
                    "Manager's Email" := UserSetUp."E-Mail";
                    "Manager No." := UserSetUp."Employee No.";
                end else begin
                    Clear("Manager Name");
                    Clear("Manager's Email");
                    Clear("Manager No.");
                end;
            end;
        }
        field(50094; "HMO Plan"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        
        field(50095; "Tax Authority"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "Dependant 1 Sex"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Male,Female;

        }
        field(50102; "Dependant 2 Sex"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Male,Female;
        }
        field(50103; "Dependant 3 Sex"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Male,Female;

        }
        field(50104; "Dependant 4 Sex"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Male,Female;
        }
        field(50105; "Dependant 1 DOB"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50106; "Dependant 2 DOB"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50107; "Dependant 3 DOB"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50108; "Dependant 4 DOB"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50109; "Employment Type"; Option)
        {
            Caption = 'Employment Type';
            DataClassification = ToBeClassified;
            OptionMembers = Other,Internship,"Full Time",Contract;
            OptionCaption = 'Other,Internship,Permanent,Contract';
            trigger OnValidate()
            begin
                IF "Employment Type" = "Employment Type"::Other THEN BEGIN
                    CLEAR("Probation Period");
                    CLEAR("End of Probation");
                    CLEAR("Employment Date");
                    CLEAR("Date of Joining the company");
                    CLEAR("Internship Duration");
                    CLEAR("Internship Due-Date");
                    CLEAR("Confirmation Status");
                    CLEAR("Confirmation Date");
                END ELSE
                    IF "Employment Type" = "Employment Type"::Internship THEN
                        "Confirmation Status" := ("Confirmation Status"::"On Internship")
                    ELSE
                        "Confirmation Status" := ("Confirmation Status"::"On Probation");
            end;
        }
        field(50110; "Confirmation Status"; Option)
        {
            Caption = 'Confirmation Status';
            DataClassification = ToBeClassified;
            OptionMembers = ,"On Internship","On Probation",Confirmed;
            trigger OnValidate()
            begin
                IF ("Confirmation Status" = "Confirmation Status"::Confirmed) OR
                    ("Confirmation Status" = "Confirmation Status"::"On Probation")
                THEN BEGIN
                    IF "Employment Type" <> "Employment Type"::"Full Time" THEN
                        ERROR('Employment type must be %1 before you can make use of %2',
                                "Employment Type"::"Full Time", "Confirmation Status");
                END ELSE
                    IF "Confirmation Status" = ("Confirmation Status"::"On Internship") THEN BEGIN
                        IF "Employment Type" <> "Employment Type"::Internship THEN
                            ERROR('Employment type must be %1 before you can make use of %2',
                                    "Employment Type"::Internship, "Confirmation Status");
                    END ELSE BEGIN
                        IF "Employment Type" <> "Employment Type"::Other THEN
                            ERROR('Employment type must be %1 before you can make use of %2',
                                    "Employment Type"::Other, "Confirmation Status");
                    END;
            end;
        }
        field(50111; "Internship Duration"; Decimal)
        {
            Caption = 'Internship Duration(Month)';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                TESTFIELD("Date of Joining the company");
                IF "Internship Duration" <> 0 THEN
                    "Internship Due-Date" := CALCDATE(STRSUBSTNO('%1M', "Internship Duration"),
                                            "Date of Joining the company")
                ELSE
                    "Internship Due-Date" := 0D;
            end;
        }
        field(50112; "Internship Due-Date"; Date)
        {
            Caption = 'Internship Due-Date';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(50113; "EndInternshipNotificatnSent"; Boolean)
        {
            Caption = 'End Of Intership Notice Sent';
            DataClassification = ToBeClassified;
        }
        field(50114; "EndProbationNotificatnSent"; Boolean)
        {
            Caption = 'End Of Probation Notice Sent';
            DataClassification = ToBeClassified;
        }
        field(50115; "Shortcut Dimension 1 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1), Blocked = CONST(false));
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';

            trigger OnValidate()
            begin
                Validate("Global Dimension 1 Code","Shortcut Dimension 1 Code");
            end;
        }
        field(50116; "Shortcut Dimension 2 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2), Blocked = CONST(false));
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,2';

            trigger OnValidate()
            begin
                Validate("Global Dimension 2 Code","Shortcut Dimension 2 Code");
            end;
        }
        field(50117; "Shortcut Dimension 3 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3), Blocked = CONST(false));
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,3';
            
        }
        field(50118; "Probation Period"; Decimal)
        {
            Caption = 'Probation Period (Months)';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TestField("Employment Date");
                IF "Probation Period" <> 0 THEN
                    "End of Probation" := CALCDATE(STRSUBSTNO('%1M', "Probation Period"),
                                            "Employment Date")
                ELSE
                    "End of Probation" := 0D;

                TESTFIELD("Employment Date");
                IF "Probation Period" <> 0 THEN
                    "Confirmation Date" := CALCDATE(STRSUBSTNO('%1M', "Probation Period"),
                                            "Employment Date")
                ELSE
                    "Confirmation Date" := 0D;
            end;
        }
        field(50119; "End of Probation"; Date)
        {
            Caption = 'End of Probation';
            DataClassification = ToBeClassified;
        }
        field(50120; "Confirmation Date"; Date)
        {
            Caption = 'Confirmation Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50121; "Confirmed Employee"; Boolean)
        {
            Caption = 'Confirmation Employee';
            DataClassification = ToBeClassified;
        }
        field(50122; "Length Of Service"; Text[50])
        {
            Caption = 'Length Of Service';
            DataClassification = ToBeClassified;
        }
        field(50123; "Citizenship Text"; Text[50])
        {
            Caption = 'Citizenship Text';
            DataClassification = ToBeClassified;
        }
        field(50124; Citizenship; Text[50])
        {
            Caption = 'Citizenship Text';
            DataClassification = ToBeClassified;
        }
        field(50125; "Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50126; "Bank Sort Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50127; "Shortcut Dimension 5 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5), Blocked = CONST(false));
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,5';
        }
    }

    var
        HREmp: Record Employee;
        CIT: Record "Country/Region";
        UserSetUp: Record "User Setup";
        Emp: record Employee;
}
