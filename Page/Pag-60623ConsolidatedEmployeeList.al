page 60623 "Consolidated Employee List"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Consolidated Employees';
    CardPageID = "Consolidated Emp Card";
    Editable = false;
    PageType = List;

    SourceTable = "Consolidated Employee";
    UsageCategory = Lists;
    Permissions = tabledata "Consolidated Employee" = r;
    ModifyAllowed = false;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field(Initials; Rec.Initials)
                {
                    ToolTip = 'Specifies the value of the Initials field.';
                }
                field("Company Display Name"; Rec."Company Display Name")
                {
                    ToolTip = 'Specifies the value of the Company Name field.';
                }

                field("Job Title"; Rec."Job Title")
                {
                    ToolTip = 'Specifies the value of the Job Title field.';
                }

                field("Search Name"; Rec."Search Name")
                {
                    ToolTip = 'Specifies the value of the Search Name field.';
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
            action(Update)
            {
                ApplicationArea = All;
                Caption = 'Update Employee List';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    consolidationAction: Codeunit "Emp Consolidation Events";
                begin
                    if consolidationAction.ImportEmployeeRec() then Message('Employee Record Inserted Sucessfully!');
                end;
            }
            action(deleteall)
            {
                ApplicationArea = All;
                Caption = 'Delete Employee List';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to delete the records', true) then Rec.DeleteAll();
                end;
            }
        }
    }
}