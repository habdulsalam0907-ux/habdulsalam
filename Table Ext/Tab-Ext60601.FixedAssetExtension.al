tableextension 60601 FixedAssetExtension extends "Fixed Asset"
{
    fields
    {
        field(60600; "Customer ID"; Code[50])
        {
            Caption = 'Customer ID';
            DataClassification = ToBeClassified;
            TableRelation = Customer;

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                If Customer.Get("Customer ID") then
                    "Customer Name" := Customer.Name
                else
                    Clear("Customer Name");
            end;
        }
        field(60601; "Customer Name"; Text[200])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(60602; Location; Text[100])
        {
            Caption = 'Location';
            DataClassification = ToBeClassified;
        }
        field(60603; "State of Location"; Text[50])
        {
            Caption = 'State of Location';
            DataClassification = ToBeClassified;
            TableRelation = "State of Project Location";
        }
        field(60604; "Leased Asset"; Boolean)
        {
            Caption = 'Leased Asset';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                LeasedComponents: Record "Leased Asset Composition";
            begin
                if NOT "Leased Asset" then begin
                    Clear("Leased Asset Class");
                    Clear("Include Leased Composition");

                    // LeasedComponents.Reset();
                    // LeasedComponents.SetRange("Fixed Asset Code", "No.");
                    // IF LeasedComponents.FindSet() then
                    //     LeasedComponents.DeleteAll();
                end;
            end;
        }
        field(60605; "Leased Asset Class"; Enum LeasedAssetClasses)
        {
            Caption = 'Leased Asset Class';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                FADepBook: Record "FA Depreciation Book";
                LeasedClasses: Record "Leased Asset Class";
            begin
                FADepBook.Reset();
                FADepBook.SetRange("FA No.", Rec."No.");
                IF FADepBook.FindFirst() then begin
                    LeasedClasses.Get("Leased Asset Class");
                    FADepBook.Validate("No. of Depreciation Years", LeasedClasses."Useful Life (Yrs)");
                    FADepBook.Validate("No. of Depreciation Months", LeasedClasses."Useful Life (Mth)");
                    FADepBook.Modify(true);
                end;
            end;
        }
        field(60606; "Include Leased Composition"; Boolean)
        {
            Caption = 'Include Leased Composition';
            DataClassification = ToBeClassified;
        }
        field(60607; "Classify As Vehicle"; Boolean)
        {
            Caption = 'Classify As Vehicle';
            DataClassification = ToBeClassified;
        }
        field(60608; Model; Text[70])
        {
            Caption = 'Model';
            DataClassification = ToBeClassified;
        }
        field(60609; "Is A Pool Car"; Boolean)
        {
            Caption = 'Is A Pool Car';
            DataClassification = ToBeClassified;
        }
        field(60610; "Tag No."; Code[30])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
            begin
                UserSetup.Reset();
                UserSetup.Get(UserId);
                if (UserSetup."Allow Tag No. Edit" = true) and (Rec."Tag No." <> '') AND (Rec."Tag No." <> xRec."Tag No.") then
                    exit else
                    Error('Sorry, you are not authorized to modify the Tag No. field. Contact your system admin!');
            end;
        }
        field(60611; "Plate No."; Code[30])
        {
            DataClassification = ToBeClassified;
            trigger Onvalidate()
            var
                UserSetup: Record "User Setup";
            begin
                UserSetup.Get(UserId);
                if (UserSetup."Allow Tag No. Edit" = true) and (Rec."Plate No." <> '') AND (Rec."Plate No." <> xRec."Plate No.") then
                    exit else
                    Error('Sorry, you are not authorized to modify the Plate No. field. Contact your system admin!');
            end;
        }
    }
}