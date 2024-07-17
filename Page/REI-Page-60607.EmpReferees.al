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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Reference Type"; Rec."Reference Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reference Type field.';
                    ShowMandatory = true;
                }
                field("Referee Full Name"; Rec."Referee Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Referee Full Name field.';
                    ShowMandatory = true;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                    ShowMandatory = true;
                }
                field("Submission Deadline"; Rec."Submission Deadline")
                {
                    ToolTip = 'Specifies the value of the Submission Deadline field.';
                    ShowMandatory = true;
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

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SendReferenceConf)
            {
                Caption = 'Send Reference Confirmation';
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;

                trigger OnAction()
                var
                    Referees: Record "Employee Referees/Guarantor";
                    Counter, TotalRec : integer;
                begin
                    Referees.RESET;
                    Referees.SETRANGE("Employee No", Rec."Employee No");
                    Referees.SETRANGE(Blocked, FALSE);
                    IF Referees.FINDSET THEN BEGIN
                        Counter := 0;
                        TotalRec := Referees.COUNT;
                        REPEAT
                            IF Referees."E-Mail" <> '' THEN BEGIN
                                Counter += 1;
                                SendGuarantorForm4EmployedApplicant(Referees);
                            END;
                        UNTIL Referees.NEXT = 0;
                        // MESSAGE('%1 out of %2 Referee(s) for %3 has/have been notified successfully!!!',
                        //     Counter, TotalRec, Rec."Employee No");
                    END ELSE
                        MESSAGE('%1 does not have active referees!!!', Rec."Employee No");
                end;
            }
        }
    }
    local procedure SendGuarantorForm4EmployedApplicant(Referees: Record "Employee Referees/Guarantor") Employed: Boolean;
    var
        EmailMessage: Codeunit "Email Message";
        EmailSend: Codeunit "Email";
        EmailAccount: Record "Email Account";
        TempBlob, TempBlob1 : Codeunit "Temp Blob";
        outStreamReport, outStreamReport1 : OutStream;
        inStreamReport, inStreamReport1 : InStream;
        ReportToSend, ReportToSend1 : Integer;
        XMLParameter, Subject, EmailBody : Text;
        RecRef: RecordRef;
        FileName, FileName1 : Text[1000];
        ReportAsPdfFileNameMsg: Label 'EMPLOYEE REFERENCE CONFIRMATION FORM.pdf';
        ReportAsPdfFileNameMsg1: Label 'NON-EMPLOYEE REFERENCE FORM.pdf';
        HRsetup: Record "REI-HR Setup";
        Employee: Record Employee;
    begin
        HRsetup.Get();
        Employee.Get(Rec."Employee No");
        RecRef.GetTable(Employee);

        //Generate blob from report
        ReportToSend := REPORT::"EMPLOYEE REFERENCE FORM";
        TempBlob.CreateOutStream(outStreamReport);
        TempBlob.CreateInStream(inStreamReport);
        Report.SaveAs(ReportToSend, XMLParameter, ReportFormat::Pdf, outStreamReport, RecRef);
        FileName := STRSUBSTNO(ReportAsPdfFileNameMsg);

        ReportToSend1 := REPORT::"NON-EMPLOYEE REFERENCE FORM";
        TempBlob1.CreateOutStream(outStreamReport1);
        TempBlob1.CreateInStream(inStreamReport1);
        Report.SaveAs(ReportToSend1, XMLParameter, ReportFormat::Pdf, outStreamReport1, RecRef);
        FileName1 := STRSUBSTNO(ReportAsPdfFileNameMsg1);


        Subject := STRSUBSTNO('EMPLOYEE REFERENCE CONFIRMATION - %1', Employee.FullName());

        Rec.TestField("Submission Deadline");
        Rec.TestField("E-Mail");

        EmailBody := StrSubstNo('Warm greetings from %1!', CompanyName);
        EmailBody += StrSubstNo('<br><br><b>%1</b> is currently in the employment of %2 as %3, and he has nominated you as one of his referees.',
                            Employee.FullName(), CompanyName, Employee."Job Title");
        EmailBody += '<br><br>We would appreciate if you could complete one of the two forms (Employee Reference form if you are his ex-employer or Non-Employee form if otherwise).';
        EmailBody += StrSubstNo('<br>Kindly send a signed soft/hard copy of the applicable form to the undersigned on or before the close of business on %1.',
                                FORMAT(Rec."Submission Deadline", 0, '<Weekday Text>, <Month Text> <Day>, <Year4>'));
        EmailBody += '<br><br>We assure you that your response will be treated with strict confidentiality and no financial responsibility whatever is incurred by filling up and signing the form.';
        EmailBody += '<br><br>Many thanks for your cooperation.';

        EmailMessage.Create(Rec."E-Mail", Subject, '', TRUE);
        EmailMessage.AddRecipient(Enum::"Email Recipient Type"::Cc, HrSetup."HR Manager E-mail");
        EmailMessage.AddAttachment(FileName, 'pdf', inStreamReport);
        EmailMessage.AddAttachment(FileName1, 'pdf', inStreamReport1);
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO('Good day Sir/Madam,')));
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody(FORMAT(EmailBody));
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody('Best Regards,<BR>');
        EmailMessage.AppendToBody('Human Resources,<BR>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO('%1 <BR>', COMPANYNAME)));
        EmailMessage.AppendToBody('<HR>');
        // IF EmailSend.Send(EmailMessage, Enum::"Email Scenario"::"HR Communication") THEN;
        IF EmailSend.OpenInEditorModallyWithScenario(EmailMessage, EmailAccount, Enum::"Email Scenario"::"HR Communication") = Enum::"Email Action"::Sent then begin
            MESSAGE('Employee Reference Confirmation is Successfully sent!!!');
        end else begin
            MESSAGE('No Mail was sent!!!');
        end;
    end;
}

