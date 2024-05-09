// codeunit 60602 "Retirement Age Reminders"
// {
//     trigger OnRun()
//     var
//         DuePeriodUnit: Option Months,Day;
//     begin
//         SendLeaseReminder(9,DuePeriodUnit::Months);
//         SendLeaseReminder(6,DuePeriodUnit::Months);
//         SendLeaseReminder(3,DuePeriodUnit::Months);
//         SendLeaseReminder(1,DuePeriodUnit::Day);
//     end;

//     var
//         GlobalSerialNumber: Integer;
//         SystemGenerated: Label 'This is a system generated mail.';
//         NextSequence: Integer;
//         PrevApprover: Code[30];
//         NextApprover: Code[30];
//         PrevSequence: Integer;

//     procedure GetRecordLink(TableID: Integer; DocNo: Code[30]): Text
//     var
//         hyperlinkText: Text;
//         Link: Text;
//         Employee: Record Employee;
//     begin
//         CASE TableID OF
            
//             Database::Employee:
//                 BEGIN
//                     Employee.RESET;
//                     Employee.SETRANGE("No.", DocNo);
//                     IF Employee.FINDFIRST THEN
//                         Link := GETURL(CLIENTTYPE::Web, COMPANYNAME, OBJECTTYPE::Page,
//                           PAGE::"Employee Card", Employee);
//                     hyperlinkText := STRSUBSTNO('<a href=' + Link + '>' + 'Click here to view.</a>');
//                     EXIT(hyperlinkText);
//                 END;
//         END;
//     End;

//     local procedure CreateLeaseDueList(var Employee: Record Employee) TableData: Text
//     var
//         SerialNumber: Integer;
//         Type: Text;
//         Link: Text;
//         EmployeeCopy: Record Employee;
//     begin
//         GlobalSerialNumber := 0;
//         SerialNumber := 0;
//         TableData += '<table border ="1">'; //start creating table
//         TableData += '<tr>';
//         TableData += STRSUBSTNO('<th> %1 </th>', 'S/N'); //creating table  header
//         TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE('Document No.'));
//         TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE(Employee.FIELDCAPTION("Sell-to Customer Name")));
//         TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE(Employee.FIELDCAPTION("Lease Location Code")));
//         TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE(Employee.FIELDCAPTION("Annual Rent Esc.")));
//         TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE(Employee.FIELDCAPTION("Lease Effective Date")));
//         TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE(Employee.FIELDCAPTION("Lease Expiration Date")));
//         TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE('Record Link'));
//         TableData += '</tr>';

//         IF Employee.FINDSET THEN REPEAT
//                 Clear(link);
//                 Link := GetRecordLink(DATABASE::Employee, Employee."No.");
//                 SerialNumber += 1;
//                 TableData += '<tr>';
//                 TableData += '<td>' + FORMAT(SerialNumber) + '</td>'; //creating table data
//                 TableData += '<td>' + FORMAT(Employee."No.") + '</td>';
//                 TableData += '<td>' + FORMAT(Employee."Sell-to Customer Name") + '</td>';
//                 TableData += '<td>' + FORMAT(Employee."Lease Location Code") + '</td>';
//                 TableData += '<td>' + FORMAT(Employee."Annual Rent Esc.") + '</td>';
//                 TableData += '<td>' + FORMAT(Employee."Lease Effective Date") + '</td>';
//                 TableData += '<td>' + FORMAT(Employee."Lease Expiration Date") + '</td>';
//                 TableData += '<td>' + FORMAT(Link) + '</td>';
//                 TableData += '</tr>';
//         UNTIL Employee.NEXT = 0;

//         TableData += '</table>';

//         GlobalSerialNumber := SerialNumber;
//         EXIT(TableData);
//     end;

//     procedure SendLeaseReminder(DueAsAtWhen: Integer; DuePeriodUnit: Option Months,Day)
//     var
//         Subject: Text;
//         EmailBody: Text;
//         EmailMessage: Codeunit "Email Message";
//         EmailSend: Codeunit "Email";
//         hyperlinkText: Text;
//         Link: Text;
//         SenderEmail: Text;
//         SenderName: Text;
//         Employee: Record Employee;
//         Seq: Integer;
//         UserSetup: Record "User Setup";
//         SentBy: Record "User Setup";
//         RequisitionsList: Text;
//         Body: Label 'As we are rounding up our engagements for today, Kindly be reminded that below is a list showing lease agreements whose due date is %1 %2 from now.';
//         HRSetup: Record "REI-HR Setup";
//         CustomSetup: Record "Custom Setup";
//         DateFilterText: Text;
//     begin
//         if DuePeriodUnit = DuePeriodUnit::Day then
//             DateFilterText := StrSubstNo('%1D',DueAsAtWhen)
//         else
//             DateFilterText := StrSubstNo('%1M',DueAsAtWhen);

//         EmailBody := STRSUBSTNO(Body, DueAsAtWhen,DuePeriodUnit);
//         Subject := STRSUBSTNO('Lease Agreements Due In %1 %2 - %3', DueAsAtWhen,DuePeriodUnit,COMPANYNAME);

//         HRSetup.Get();
//         CustomSetup.Get();
//         CustomSetup.TestField("Space & Premise Team E-mail");
//         GlobalSerialNumber := 0;

//         //Getting Requsitions List to Display
//         Employee.RESET;
//         Employee.SETRANGE("Sales Type",Employee."Sales Type"::Lease);
//         Employee.SETFILTER("Lease Expiration Date", '%1..%2',
//                   TODAY, CALCDATE(StrSubstNo('%1',DateFilterText), TODAY));

//         IF Employee.FINDSET THEN begin
//             RequisitionsList := CreateLeaseDueList(Employee);
//             IF GlobalSerialNumber > 0 THEN BEGIN
//                 EmailMessage.Create(CustomSetup."Space & Premise Team E-mail", Subject, '', TRUE);
//                 EmailMessage.AppendToBody(FORMAT(STRSUBSTNO('Dear Team,')));
//                 EmailMessage.AppendToBody('<br><br>');
//                 EmailMessage.AppendToBody(FORMAT(EmailBody));
//                 EmailMessage.AppendToBody('<br><br>');
//                 EmailMessage.AppendToBody(FORMAT(RequisitionsList));
//                 EmailMessage.AppendToBody('<br><br>');
//                 EmailMessage.AppendToBody('Kindly Attend.<br><br>Regards,');
//                 EmailMessage.AppendToBody('<br><br>');
//                 EmailMessage.AppendToBody('<HR>');
//                 EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SystemGenerated)));
//                 IF EmailSend.Send(EmailMessage, Enum::"Email Scenario"::"Lease Mgt. Reminders") THEN;
//             END;
//         end;
//     end;
// }

