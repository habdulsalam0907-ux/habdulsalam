pageextension 60600 MyExtension extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Blocked)
        {
            field("Verification Status"; Rec."Verification Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Verification Status field.';
                Editable = false;
            }
            field("LPG Customer"; Rec."LPG Customer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LPG Customer field.';
            }
            field("Location Customer"; Rec."Location Customer")
            {
                ApplicationArea = All;
                Caption = 'Customer Location';
                ToolTip = 'Specifies the value of the Location Customer field.';
            }
            field("Credit Customer"; Rec."Credit Customer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Credit Customer field.';
            }
            field("Product/Services"; Rec."Product/Services")
            {
                ApplicationArea = All;
                Caption = 'Product/Services';
                ToolTip = 'Specifies the value of the Product/Services field.';
            }
            field("Customer Status"; Rec."Customer Status")
            {
                ApplicationArea = All;
                Caption = 'Customer Status';
                ToolTip = 'Specifies the value of the Customer Status field.';
            }
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = All;
                Caption = 'Customer Type';
                ToolTip = 'Specifies the value of the Customer Type field.';
            }
            field("Customer Name Abbreviation"; Rec."Customer Name Abbreviation")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer Name Abbreviation field.';
            }
            field("Customer Business Group"; Rec."Customer Business Group")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer Business Group field.';
            }
        }
        modify("E-Mail")
        {
            ShowMandatory = true;
            ApplicationArea = All;
        }


    }
    actions
    {

    }
    trigger OnClosePage()
    begin
        if Rec."E-Mail" = '' then
            Error('The customer email address field must not be emptied!');
    end;

    var
        DocumentApprovalWorkflow: Codeunit 50000;
        DocumentApprovalEntry: Record "REI-Document Approval Entry";
        Customer: Record Customer;
        RecRef: RecordRef;
        RecID: RecordID;
        canPost, cansendApproval, canApproval : Boolean;
}