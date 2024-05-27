pageextension 60608 BankAccountListExt extends "Bank Account List"
{
    layout
    {
        addafter(Name)
        {
            field("Use For Imprest"; Rec."Use For Imprest")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Use For Imprest field.';
            }
        }
    }
    
    trigger OnOpenPage()
    begin
        UserSetup.Get(USERID);
        if not UserSetup."View Bank Account List" THEN
            error(ErrorMsg);
    end;

    var
        UserSetup: Record "User Setup";
        ErrorMsg: Label 'Ops! You do not have access to the bank account list. Kindly contact your admin!';
}