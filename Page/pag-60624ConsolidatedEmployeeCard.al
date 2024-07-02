page 60624 "Consolidated Emp Card"
{
    Caption = 'Employee Card';
    PageType = Card;
    SourceTable = "Consolidated Employee";

    layout
    {
        area(Content)
        {

            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. field.';
            }
            field("First Name"; Rec."First Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the First Name field.';
            }
            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Last Name field.';
            }
            field("Middle Name"; Rec."Middle Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Middle Name field.';
            }
            field(Initials; Rec.Initials)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Initials field.';
            }
            field("Job Title"; Rec."Job Title")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Title field.';
            }
            field("Search Name"; Rec."Search Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Search Name field.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Status field.';
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