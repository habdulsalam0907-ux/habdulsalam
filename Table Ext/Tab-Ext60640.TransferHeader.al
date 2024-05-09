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
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}