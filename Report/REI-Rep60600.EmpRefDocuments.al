report 60600 "EMPLOYEE REFERENCE FORM"
{
    DefaultLayout = Word;
    WordLayout = './Report/Layouts/EMPLOYEE REFERENCE CONFIRMATION FORM.docx';
    ApplicationArea = All;
    Caption = 'EMPLOYEE REFERENCE CONFIRMATION FORM';

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(No_Employee; "No.")
            {
            }
        }
    }

}

report 60601 "NON-EMPLOYEE REFERENCE FORM"
{
    DefaultLayout = Word;
    WordLayout = './Report/Layouts/NON-EMPLOYEE REFERENCE FORM.docx';
    ApplicationArea = All;
    Caption = 'NON-EMPLOYEE REFERENCE FORM';

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(No_Employee; "No.")
            {
            }
        }
    }

}
