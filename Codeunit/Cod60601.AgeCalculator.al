codeunit 60601 "Age Calculator"
{
    procedure CalculateAgeFromBirthDate(BirtDate: Date) Age: Integer
    var
        YearsDiff, MonthsDiff, DaysDiff: integer;
        CurrYearBirtDate: Date;
    begin
        YearsDiff := Date2DMY(Today,3) - Date2DMY(BirtDate,3);
        CurrYearBirtDate := DMY2Date(Date2DMY(BirtDate,1),
                                    Date2DMY(BirtDate,2),
                                    Date2DMY(Today,3));
        If  Today >= CurrYearBirtDate then
            MonthsDiff := 0
        else
            MonthsDiff := 1;
        Age := YearsDiff - MonthsDiff;
        exit(Age);
    End;

    procedure GetApproximateBirthDateFromAge(Age: Integer) BirthDate: Date
    begin
        If Age > 0 then
            BirthDate := CalcDate(StrSubstNo('%1Y',Age),Today)
        else
            BirthDate := 0D;
        exit(BirthDate);
    End;
}

