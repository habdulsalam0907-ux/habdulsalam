tableextension 60610 "Transfer Line Ext" extends "Transfer Line"
{
    fields
    {
        field(60600; "Shortcut Dimension 3 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 3 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(60601; "Shortcut Dimension 4 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 4 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(60602; "Shortcut Dimension 5 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 5 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(60603; "Shortcut Dimension 6 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 6 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(60604; "Shortcut Dimension 7 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 7 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(60605; "Shortcut Dimension 8 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 8 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
    }
}
