report 60603 "Fixed Asset Reg"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = DepreciationRegister;
    Caption = 'Custom Fixed Asset Register';

    dataset
    {
        dataitem(FixedAsset; "Fixed Asset")
        {
            RequestFilterHeading = 'Fixed Asset Register';
            RequestFilterFields = "No.", "FA Subclass Code", "FA Location Code", "FA Posting Date Filter", "FA Posting Group", "Global Dimension 1 Code", "Global Dimension 2 Code";
            column(Picture_CompanyInformation; CompanyInfo.Picture)
            {
            }
            column(conpanyName; CompanyInfo.Name)
            {

            }
            column(companyAddress; CompanyInfo.Address)
            {

            }
            column(Acquired_FixedAsset; Acquired)
            {
            }

            column(BudgetedAsset_FixedAsset; "Budgeted Asset")
            {
            }

            column(FapostingGroupName; FapostingGroupName)
            {

            }
            column(FaLocationName; FaLocationName)
            {

            }

            column(Description_FixedAsset; Description)
            {
            }

            column(FAClassCode_FixedAsset; "FA Class Code")
            {
            }
            column(FALocationCode_FixedAsset; "FA Location Code")
            {
            }

            column(FAPostingGroup_FixedAsset; "FA Posting Group")
            {
            }
            column(FASubclassCode_FixedAsset; "FA Subclass Code")
            {
            }
            column(GlobalDimension1Code_FixedAsset; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_FixedAsset; "Global Dimension 2 Code")
            {
            }




            column(No_FixedAsset; "No.")
            {
            }

            column(VendorNo_FixedAsset; "Vendor No.")
            {
            }
            column(PurchasePrice; PurchasePrice)
            {

            }
            column(RevaluedAmount; RevaluedAmount)
            {

            }
            column(TotalCumDepreciation; TotalCumDepreciation)
            {

            }
            column(CurrentPeriodDepreciationAmount; CurrentPeriodDepreciationAmount)
            {

            }
            column(CurrentYearDeprAmount; CurrentYearDeprAmount)
            {

            }
            column(PriorYearDepAmount; PriorYearDepAmount)
            {

            }
            column(bookValue; bookValue)
            {

            }
            column(PurchaseDate; PurchaseDate)
            {

            }


            dataitem("FA Depreciation Book"; "FA Depreciation Book")
            {

                DataItemLink = "FA No." = field("No.");
                DataItemLinkReference = FixedAsset;



                column(BookValue_FADepreciationBook; "Book Value")
                {
                }
                column(DepreciationStartingDate_FADepreciationBook; "Depreciation Starting Date")
                {
                }
                column(EndingBookValue_FADepreciationBook; "Ending Book Value")
                {
                }
            }



            //PurchasePrice, RevaluedAmount, TotalCumDepreciation, bookValue, CurrentPeriodDepreciationAmount, CurrentYearDeprAmount, PriorYearDepAmount

            trigger OnAfterGetRecord()
            var
                Fadepbook: Record "FA Depreciation Book";
                FaLedger, FaLeger1, FaLedger2 : Record "FA Ledger Entry";
                FixedAst: Record "Fixed Asset";

                FadepStartDate, FadepEndDate : Date;
                NumOfYears: Integer;
                CurrentMonth: Text[30];
                LastYear: Text[30];
                Expr3: Text[30];
                RefDate: Date;
                CM: Date;
                LY: Date;
            begin
                //   FapostingGroupName
                if FapostingTable.get(FixedAsset."FA Posting Group") then begin
                    FapostingGroupName := FapostingTable.Description;
                end;
                if FaLocationCodeRec.Get(FixedAsset."FA Location Code") then begin
                    FaLocationName := FaLocationCodeRec.Name;
                end;

                Fadepbook.Reset();

                Fadepbook.SetRange("FA No.", FixedAsset."No.");
                if Fadepbook.FindFirst() then begin
                    if Fadepbook."Disposal Date" > 0D then
                        Fadepbook."Book Value" := 0
                    else
                        Fadepbook.CalcFields("Book Value");

                    bookValue := Fadepbook."Book Value";
                    FaLedger.Reset();
                    FaLedger.SetCurrentKey("FA No.", "Depreciation Book Code", "Part of Book Value", "FA Posting Date");
                    FaLedger.SetRange("FA No.", FixedAsset."No.");
                    FaLedger.SetRange("Depreciation Book Code", Fadepbook."Depreciation Book Code");
                    FaLedger2.Copy(FaLedger);
                    FaLeger1.Copy(FaLedger);

                    if FaLedger.FindSet() then begin

                        FaLedger.SetRange("FA Posting Type", FaLedger."FA Posting Type"::"Acquisition Cost");
                        FaLedger.SetFilter("Document Type", '%1|%2', FaLedger."Document Type"::Invoice, FaLedger."Document Type"::" ");
                        //Get the acquiciation amount
                        if FaLedger.FindFirst() then begin
                            PurchaseDate := FaLedger."Posting Date";
                            PurchasePrice := FaLedger.Amount;
                        end;

                        FaLedger2.SetFilter("FA Posting Type", '%1 | %2', FaLedger2."FA Posting Type"::Appreciation, FaLedger2."FA Posting Type"::"Write-Down");
                        FaLedger2.SetFilter("Document Type", '%1|%2', FaLedger2."Document Type"::" ", FaLedger2."Document Type"::Invoice);

                        if FaLedger2.FindLast() then begin
                            RevaluedAmount := FaLedger2.Amount;
                        end else begin
                            RevaluedAmount := PurchasePrice;
                        end;

                        FaLeger1.SetRange("FA Posting Category", FaLeger1."FA Posting Category"::" ");
                        FaLeger1.SetRange("Depreciation Book Code", Fadepbook."Depreciation Book Code");
                        FaLeger1.SetRange("FA Posting Type", FaLeger1."FA Posting Type"::Depreciation);
                        // FaLeger1.SetRange("FA Posting Date", FixedAsset."FA Posting Date Filter");

                        if FaLeger1.FindLast() then begin
                            // FaLeger1.CalcFields(Amount);
                            CurrentPeriodDepreciationAmount := FaLeger1.Amount;
                        end;

                        if FaLeger1.FindSet() then begin
                            // FaLeger1.CalcFields(Amount);
                            repeat
                                PriorYearDepAmount += FaLeger1.Amount;
                            until FaLeger1.Next() = 0;
                        end;

                        if FaLeger1.FindSet() then begin
                            repeat
                                // FaLeger1.CalcFields(Amount);
                                CurrentYearDeprAmount += FaLeger1.Amount;
                            until FaLeger1.Next() = 0;

                        end;

                        TotalCumDepreciation += CurrentYearDeprAmount + CurrentPeriodDepreciationAmount;

                        // FaLeger1.Reset();
                        // // FaLeger1.SetCurrentKey("FA No.", "Depreciation Book Code", "Part of Book Value", "FA Posting Date");
                        // FaLeger1.SetRange("FA No.", FixedAsset."No.");
                        // FaLeger1.SetRange("Depreciation Book Code", Fadepbook."Depreciation Book Code");
                        // FaLeger1.SetRange("Part of Book Value", true);
                        // if FaLeger1.FindSet() then begin
                        //     // FaLeger1.CalcFields(Amount);
                        //     repeat
                        //         bookValue += FaLeger1.Amount;
                        //     until FaLeger1.Next() = 0;
                        // end

                    end


                end


                // example




                //  PurchasePrice, RevaluedAmount, TotalCumDepreciation, bookValue, CurrentPeriodDepreciationAmount, CurrentYearDeprAmount, PriorYearDepAmount 

            end;
        }



    }


    rendering
    {
        layout(DepreciationRegister)
        {
            Type = RDLC;
            LayoutFile = './Report/FixedAssetDepreciationRegister.rdl';
        }
    }
    trigger OnInitReport()
    begin
        CompanyInfo.SetAutoCalcFields(Picture);
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture)
    end;

    protected var
        CompanyInfo: Record "Company Information";
        fixed: Page "Fixed Asset Card";

    var
        PurchasePrice, RevaluedAmount, TotalCumDepreciation, bookValue, CurrentPeriodDepreciationAmount, CurrentYearDeprAmount, PriorYearDepAmount : Decimal;
        PurchaseDate: Date;
        FapostingGroupName: Text;
        FapostingTable: Record "FA Posting Group";
        FaLocationName: Text;
        FaLocationCodeRec: Record "FA Location";


}