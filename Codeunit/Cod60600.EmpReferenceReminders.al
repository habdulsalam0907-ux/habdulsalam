codeunit 60600 "Employee Reference Reminder"
{

    trigger OnRun()
    begin
        SendReminder2HR4ReferenceDue();
        //MESSAGE('Run sucessful');
    end;

    var
        GlobalSerialNumber: Integer;
        SystemGenerated: Label 'This is a system generated mail.';
        NextSequence: Integer;
        PrevApprover: Code[30];
        NextApprover: Code[30];
        PrevSequence: Integer;

    procedure GetRecordLink(TableID: Integer; DocNo: Code[30]): Text
    var
        hyperlinkText: Text;
        Link: Text;
        Employee: Record Employee;
    begin
        CASE TableID OF
            Database::Employee:
                BEGIN
                    Employee.RESET;
                    Employee.SETRANGE("No.", DocNo);
                    IF Employee.FINDFIRST THEN
                        Link := GETURL(CLIENTTYPE::Web, COMPANYNAME, OBJECTTYPE::Page,
                          PAGE::"Employee Card", Employee);
                    hyperlinkText := STRSUBSTNO('<a href=' + Link + '>' + 'Click here to view.</a>');
                    EXIT(hyperlinkText);
                END;
        END;
    End;

    local procedure CreateReferenceDueList(var Employee: Record Employee) TableData: Text
    var
        SerialNumber: Integer;
        Type: Text;
        Link: Text;
        EmployeeCopy: Record Employee;
    begin
        GlobalSerialNumber := 0;
        SerialNumber := 0;
        TableData += '<table border ="1">'; //start creating table
        TableData += '<tr>';
        TableData += STRSUBSTNO('<th> %1 </th>', 'S/N'); //creating table  header
        TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE(Employee.FIELDCAPTION("First Name")));
        TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE(Employee.FIELDCAPTION("Last Name")));
        TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE(Employee.FIELDCAPTION("Global Dimension 2 Code")));
        TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE(Employee.FIELDCAPTION("Job Title")));
        TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE(Employee.FIELDCAPTION("Employment Date")));
        TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE(Employee.FIELDCAPTION("Manager Name")));
        TableData += STRSUBSTNO('<th> %1 </th>', UPPERCASE('Record Link'));
        TableData += '</tr>';

        IF Employee.FINDSET THEN
            REPEAT
                SerialNumber += 1;
                Link := GetRecordLink(DATABASE::Employee, Employee."No.");
                TableData += '<tr>';
                TableData += '<td>' + FORMAT(SerialNumber) + '</td>'; //creating table data
                TableData += '<td>' + FORMAT(Employee."First Name") + '</td>';
                TableData += '<td>' + FORMAT(Employee."Last Name") + '</td>';
                TableData += '<td>' + FORMAT(Employee."Global Dimension 2 Code") + '</td>';
                TableData += '<td>' + FORMAT(Employee."Job Title") + '</td>';
                TableData += '<td>' + FORMAT(Employee."Employment Date") + '</td>';
                TableData += '<td>' + FORMAT(Employee."Manager Name") + '</td>';
                TableData += '<td>' + FORMAT(Link) + '</td>';
                TableData += '</tr>';
            UNTIL Employee.NEXT = 0;

        TableData += '</table>';

        GlobalSerialNumber := SerialNumber;
        EXIT(TableData);
    end;

    procedure SendReminder2HR4ReferenceDue()
    var
        Subject: Text;
        EmailBody: Text;
        EmailMessage: Codeunit "Email Message";
        EmailSend: Codeunit "Email";
        hyperlinkText: Text;
        Link: Text;
        SenderEmail: Text;
        SenderName: Text;
        Employee: Record Employee;
        Seq: Integer;
        UserSetup: Record "User Setup";
        SentBy: Record "User Setup";
        RequisitionsList: Text;
        Body: Label 'As we are rounding up our engagements for today, Kindly be reminded that below is a list showing employees whose reference confirmation mail should be triggered.';
        HRSetup: Record "REI-HR Setup";
    begin
        // SenderEmail := 'ops@relianceinfosystems.com';
        // SenderName := 'Business Central';

        EmailBody := STRSUBSTNO(Body);
        Subject := STRSUBSTNO('Reminder For Triggering Employee Reference Confirmation Mail', COMPANYNAME);

        HRSetup.GET;
        GlobalSerialNumber := 0;

        //Getting Requsitions List to Display
        Employee.RESET;
        Employee.SETFILTER("Employment Date", '%1..%2',
                  TODAY, CALCDATE('+1M', TODAY));
        IF Employee.FINDSET THEN
            IF HRSetup."HR Team E-mail" <> '' THEN BEGIN
                RequisitionsList := CreateReferenceDueList(Employee);
                IF GlobalSerialNumber > 0 THEN BEGIN
                    EmailMessage.Create(HRSetup."HR Team E-mail", Subject, '', TRUE);
                    EmailMessage.AppendToBody(FORMAT(STRSUBSTNO('Dear Team,')));
                    EmailMessage.AppendToBody('<br><br>');
                    EmailMessage.AppendToBody(FORMAT(EmailBody));
                    EmailMessage.AppendToBody('<br><br>');
                    EmailMessage.AppendToBody(FORMAT(RequisitionsList));
                    EmailMessage.AppendToBody('<br><br>');
                    EmailMessage.AppendToBody('Kindly Attend.<br><br>Regards,');
                    EmailMessage.AppendToBody('<br><br>');
                    EmailMessage.AppendToBody('<HR>');
                    EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SystemGenerated)));
                    IF EmailSend.Send(EmailMessage, Enum::"Email Scenario"::"HR Communication") THEN;
                END;
            END;
    end;

    
}

