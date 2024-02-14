codeunit 60601 "Age Calculator"
{
    procedure CalculateAgeFromBirthDate(BirtDate: Date) Age: Integer
    var
        YearsDiff, MonthsDiff, DaysDiff: integer;
    begin
        YearsDiff := Date2DMY(Today,3) - Date2DMY(BirtDate,3);
        If  Date2DMY(Today,2) > Date2DMY(BirtDate,2) then
            MonthsDiff := 1
        else
            MonthsDiff := 0;
        Age := YearsDiff - MonthsDiff;
        exit(Age);
    End;

}

