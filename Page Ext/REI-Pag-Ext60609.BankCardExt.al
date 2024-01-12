pageextension 60609 BankAccountCardExt extends "Bank Account Card"
{
    layout
    {
        addafter(Blocked)
        {
            field("Use For Imprest"; Rec."Use For Imprest")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Use For Imprest field.';
            }
            group(ImpLimit)
            {
                ShowCaption = false;
                Visible = Rec."Use For Imprest";
                field("Imprest/Float Limit"; Rec."Imprest/Float Limit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Imprest/Float Limit field.';
                    ShowMandatory = true;
                    Style = Unfavorable;
                }
            }
        }
        modify("Bank Account No.")
        {
            ShowMandatory = true;
        }
    }
    trigger OnClosePage()
    begin
        if Rec."No." <> '' then begin
            if (Rec."Bank Account No." = '') then
                Error('Bank Account No. must not be emptied!');
        end;
    end;

}