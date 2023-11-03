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
}