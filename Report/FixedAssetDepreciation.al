report 60603 "Fixed Asset Reg"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = DepreciationRegister;
    Caption = 'Fixed Asset Depreciation Register';

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
            column(Location_FixedAsset; Location)
            {
            }
            column(LocationCode_FixedAsset; "Location Code")
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
                FaLedger, FaLeger1 : Record "FA Ledger Entry";

                FadepStartDate, FadepEndDate : Date;
                NumOfYears: Integer;
            begin
             
                Fadepbook.Reset();
                Fadepbook.SetRange("FA No.", FixedAsset."No.");
                if Fadepbook.FindFirst() then begin
                    FaLedger.SetRange("FA No.", FixedAsset."No.");
                    FaLedger.SetRange("Depreciation Book Code", Fadepbook."Depreciation Book Code");
                    // FadepStartDate := Fadepbook."Depreciation Starting Date";
                    // FadepEndDate := Fadepbook."Depreciation Ending Date";
                    // NumOfYears := Fadepbook."No. of Depreciation Years";



                    if FaLedger.FindSet() then begin

                        FaLedger.SetRange("FA Posting Type", FaLedger."FA Posting Type"::"Acquisition Cost");
                        FaLedger.SetRange("Document Type", FaLedger."Document Type"::Invoice);

                        if FaLedger.FindFirst() then begin
                            FaLedger.CalcFields(Amount);
                            PurchaseDate := FaLedger."Posting Date";
                            PurchasePrice := FaLedger.Amount;
                        end;
                        FaLedger.SetFilter("FA Posting Type", '%1 | %2', FaLedger."FA Posting Type"::Appreciation, FaLedger."FA Posting Type"::"Write-Down");
                        FaLedger.SetRange("Document Type", FaLedger."Document Type"::" ");
                        if FaLedger.FindLast() then begin
                            FaLedger.CalcFields(Amount);
                            RevaluedAmount := FaLedger.Amount;
                        end;

                        FaLeger1.SetRange("FA Posting Category", FaLedger."FA Posting Category"::" ");
                        FaLeger1.SetRange("Depreciation Book Code", Fadepbook."Depreciation Book Code");
                        FaLeger1.SetRange("FA Posting Type", FaLeger1."FA Posting Type"::Depreciation);
                        if FaLeger1.FindLast() then begin
                            FaLeger1.CalcFields(Amount);
                            CurrentPeriodDepreciationAmount := FaLeger1.Amount;
                        end;

                        if FaLeger1.FindSet() then begin
                            FaLeger1.CalcFields(Amount);
                            PriorYearDepAmount := FaLeger1.Amount;
                        end;
                        FaLeger1.SetRange("FA Posting Date", FixedAsset."FA Posting Date Filter");
                        if FaLeger1.FindSet() then begin
                            FaLeger1.CalcFields(Amount);
                            CurrentYearDeprAmount := FaLeger1.Amount;

                        end;

                        TotalCumDepreciation += CurrentYearDeprAmount + CurrentPeriodDepreciationAmount;

                        FaLeger1.Reset();
                        FaLeger1.SetCurrentKey("FA No.", "Depreciation Book Code", "Part of Book Value", "FA Posting Date");
                        FaLeger1.SetRange("FA No.", FixedAsset."No.");
                        FaLeger1.SetRange("Depreciation Book Code", Fadepbook."Depreciation Book Code");
                        FaLeger1.SetRange("Part of Book Value", true);
                        if FaLeger1.FindSet() then begin
                            FaLeger1.CalcFields(Amount);
                            bookValue := FaLeger1.Amount;
                        end

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


}