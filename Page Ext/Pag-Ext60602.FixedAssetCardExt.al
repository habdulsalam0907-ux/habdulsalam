pageextension 60602 FixedAssetCardExt extends "Fixed Asset Card"
{
    layout
    {
        addlast(General)
        {

            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                NotBlank = true;
                ShowMandatory = true;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
                NotBlank = true;
                ShowMandatory = true;
            }
            field("Classify As Vehicle"; Rec."Classify As Vehicle")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Classify As Vehicle field.';
            }
            field("Tag No."; Rec."Tag No.")
            {
                ApplicationArea = All;

            }
            field("Plate No."; Rec."Plate No.")
            {
                ApplicationArea = All;
            }
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Model field.';
                Editable = true;
            }
            group(MainAssBookValue)
            {
                ShowCaption = false;
                Visible = (Rec."Main Asset/Component" = Rec."Main Asset/Component"::"Main Asset");

                field(AssetBookValue; BookValue)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Main Asset Book Value';
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        FADeprBook, FADeprBook1 : Record "FA Depreciation Book";
                        DepBookCode: Text;
                    begin
                        FADeprBook.Reset();
                        FADeprBook.SetRange("FA No.", Rec."No.");
                        if FADeprBook.FindFirst() then begin
                            DepBookCode := FADeprBook."Depreciation Book Code";
                            // Page.Run(page::"Main Asset Statistics",FADeprBook);
                        end;


                        FADeprBook1.Reset();
                        FADeprBook1.SetCurrentKey("Depreciation Book Code", "Component of Main Asset");
                        FADeprBook1.SetRange("Depreciation Book Code", DepBookCode);
                        FADeprBook1.SetRange("Component of Main Asset", Rec."Component of Main Asset");
                        if FADeprBook1.FindSet() then
                            Page.Run(page::"MainAsset Components", FADeprBook1);
                    end;
                }
            }

        }
        addafter(General)
        {
            part(LeasedComp; "Leased Asset Composition Line")
            {
                Caption = 'Leased Asset Composition';
                SubPageLink = "Fixed Asset Code" = field("No.");
                Visible = (Rec."Leased Asset" And Rec."Include Leased Composition");
                Editable = (Rec."Leased Asset" And Rec."Include Leased Composition" And (NOT Rec.Acquired));
                ApplicationArea = All;
            }
        }
    }

    var
        BookValue: Decimal;

    trigger OnAfterGetRecord()
    begin
        GetBookValue();
    end;

    trigger OnClosePage()
    begin
        if Rec."No." <> '' then begin
            if (Rec."Global Dimension 1 Code" = '') then
                Error('Business Unit Code must not be emptied!');

            if (Rec."Global Dimension 2 Code" = '') then
                Error('Business Unit Code must not be emptied!');
        end;

    end;

    local procedure GetBookValue()
    var
        FADeprBook: Record "FA Depreciation Book";
        FADeprBook2: Record "FA Depreciation Book";
        DepBookCode: Text;
    begin
        Clear(BookValue);

        FADeprBook2.Reset();
        FADeprBook2.SetRange("FA No.", Rec."No.");
        IF FADeprBook2.FindFirst() then begin
            DepBookCode := FADeprBook2."Depreciation Book Code";
        end;

        if Rec."Main Asset/Component" <> Rec."Main Asset/Component"::"Main Asset" then begin
            FADeprBook2.CalcBookValue();
            BookValue := FADeprBook2."Book Value";
        end else begin
            FADeprBook.SetCurrentKey("Depreciation Book Code", "Component of Main Asset");
            FADeprBook.SetRange("Depreciation Book Code", DepBookCode);
            FADeprBook.SetRange("Component of Main Asset", Rec."Component of Main Asset");
            if FADeprBook.Find('-') then begin
                repeat
                    if FADeprBook."Disposal Date" = 0D then begin
                        if FADeprBook."Last Acquisition Cost Date" > 0D then begin
                            FADeprBook.CalcFields("Book Value", "Depreciable Basis");
                            BookValue += FADeprBook."Book Value";
                        end;
                    end;
                until FADeprBook.Next() = 0;
            end;
        end;
    end;
}
