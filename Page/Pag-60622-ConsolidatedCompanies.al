page 60622 "Consolidated Companies"
{

    ApplicationArea = Basic, Suite;
    Caption = 'Consolidated Companies Setup';
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Company Setup";
    UsageCategory = Lists;
    Permissions = tabledata "Company Setup" = r;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Display Name"; Rec."Display Name")
                {
                    ToolTip = 'Specifies the value of the Display Name field.';
                }
                field("Is Active?"; Rec."Is Active?")
                {
                    ToolTip = 'Specifies the value of the Is Active? field.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
}