tableextension 60640 "Transfer Header Ext" extends "Transfer Header"
{
    fields
    {
        // Add changes to table fields here
        field(50009; Status1; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Caption = 'Status';
            OptionCaption = ' Open,Pending Approval,Approved,Rejected,Posted';
            OptionMembers = "Open","Pending Approval",Approved,Rejected,Posted;
        }
        field(50010; "Current Pending Person"; Code[50])
        {
            Caption = 'Current Pending Person';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }
        field(50011; "Raised by"; text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnAfterInsert()
    begin
        "Raised by" := UserId;
        Modify();
    end;

    var
        myInt: Integer;
}