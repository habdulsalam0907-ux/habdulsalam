tableextension 60604 ItemTabExt extends Item
{
    fields
    {
        field(60600; "Leased Asset Class"; Enum LeasedAssetClasses)
        {
            Caption = 'Leased Asset Class';
            DataClassification = ToBeClassified;
        }
        field(50252; "Item Cost Account No."; Code[20])
        {
            Caption = 'Item Cost Account No.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
            trigger OnValidate()
            var
                GLAcc2: Record "G/L Account";
            begin
                if GLAcc2.Get("Item Cost Account No.") then
                    "Item Cost Account Name" := GLAcc2.Name
                else
                    "Item Cost Account Name" := '';
            end;
        }
        field(50253; "Item Cost Account Name"; Text[50])
        {
            Caption = 'Item Cost Account Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
