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
            RequestFilterFields = "No.", "FA Location Code", "FA Posting Group", "Global Dimension 1 Code", "Global Dimension 2 Code";
            column(Picture_CompanyInformation; CompanyInfo.Picture) { }
            column(conpanyName; CompanyInfo.Name) { }
            column(companyAddress; CompanyInfo.Address) { }
            column(Acquired_FixedAsset; Acquired) { }
            column(BudgetedAsset_FixedAsset; "Budgeted Asset") { }
            column(FapostingGroupName; FapostingGroupName) { }
            column(FaLocationName; FaLocationName) { }
            column(Description_FixedAsset; Description) { }
            column(FAClassCode_FixedAsset; "FA Class Code") { }
            column(FALocationCode_FixedAsset; "FA Location Code") { }
            column(FAPostingGroup_FixedAsset; "FA Posting Group") { }
            column(FASubclassCode_FixedAsset; "FA Subclass Code") { }
            column(GlobalDimension1Code_FixedAsset; "Global Dimension 1 Code") { }
            column(GlobalDimension2Code_FixedAsset; "Global Dimension 2 Code") { }
            column(No_FixedAsset; "No.") { }
            column(VendorNo_FixedAsset; "Vendor No.") { }
            column(PurchasePrice; PurchasePrice) { }
            column(RevaluedAmount; RevaluedAmount) { }
            column(TotalCumDepreciation; TotalCumDepreciation) { }
            column(CurrentPeriodDepreciationAmount; CurrentPeriodDepreciationAmount) { }
            column(CurrentYearDeprAmount; CurrentYearDeprAmount) { }
            column(PriorYearDepAmount; PriorYearDepAmount) { }
            column(bookValue; bookValue) { }
            column(PurchaseDate; PurchaseDate) { }
            column(DateFilter; DateFilter) { }
            dataitem(FADepreciationBook; "FA Depreciation Book")
            {
                DataItemLink = "FA No." = field("No.");
                DataItemLinkReference = FixedAsset;
                DataItemTableView = sorting("FA No.", "Depreciation Book Code");

                column(DepreciationStartingDate_FADepreciationBook; "Depreciation Starting Date") { }
                column(EndingBookValue_FADepreciationBook; "Ending Book Value") { }
                column(Acquisition_Cost; "Acquisition Cost") { }
                column(Acquisition_Date; "Acquisition Date") { }
                column(Depreciation; Depreciation) { }
                column(Last_Acquisition_Cost_Date; "Last Acquisition Cost Date") { }

                trigger OnPreDataItem()

                begin
                    FADepreciationBook.SetFilter("FA Posting Date Filter", '..%1', DateFilter);
                end;

                trigger OnAfterGetRecord()
                var
                    FaLedger2, FaLeger1, FaLedger, FaLedger3 : Record "FA Ledger Entry";
                begin


                    FaLedger2.Reset();
                    FaLedger2.SetCurrentKey("FA No.", "Depreciation Book Code", "Part of Book Value", "FA Posting Date");
                    FaLedger2.SetRange("FA No.", FixedAsset."No.");
                    FaLedger2.SetRange("Depreciation Book Code", FADepreciationBook."Depreciation Book Code");
                    FaLedger2.SetFilter("FA Posting Type", '%1 | %2', FaLedger2."FA Posting Type"::Appreciation, FaLedger2."FA Posting Type"::"Write-Down");
                    FaLedger2.SetFilter("FA Posting Date", '..%1', DateFilter);
                    RevaluedAmount := 0;
                    if FaLedger2.FindSet() then begin
                        repeat
                            RevaluedAmount += FaLedger2.Amount;
                        until FaLedger2.Next() = 0;

                        RevaluedAmount += FADepreciationBook."Acquisition Cost";
                    end else begin
                        RevaluedAmount := FADepreciationBook."Acquisition Cost";
                    end;



                    FaLeger1.Reset();
                    FaLeger1.SetCurrentKey("FA No.", "Depreciation Book Code", "Part of Book Value", "FA Posting Date");
                    FaLeger1.SetRange("FA No.", FixedAsset."No.");
                    FaLeger1.SetRange("Depreciation Book Code", FADepreciationBook."Depreciation Book Code");
                    FaLeger1.SetFilter("FA Posting Type", '%1', FaLeger1."FA Posting Type"::Depreciation);
                    FaLeger1.SetFilter("Posting Date", '..%1', getBeginingYearDate(DateFilter));
                    PriorYearDepAmount := 0;
                    if FaLeger1.FindSet() then begin
                        repeat
                            PriorYearDepAmount += FaLeger1.Amount;
                        until FaLeger1.Next() = 0;
                    end;

                    FaLedger.Reset();
                    FaLedger.SetCurrentKey("FA No.", "Depreciation Book Code", "Part of Book Value", "FA Posting Date");
                    FaLedger.SetRange("FA No.", FixedAsset."No.");
                    FaLedger.SetRange("Depreciation Book Code", FADepreciationBook."Depreciation Book Code");
                    FaLedger.SetFilter("Posting Date", '%1..%2', getBeginingYearDate(DateFilter), DateFilter);
                    FaLedger.SetFilter("FA Posting Type", '%1', FaLedger."FA Posting Type"::Depreciation);
                    CurrentYearDeprAmount := 0;
                    CurrentPeriodDepreciationAmount := 0;
                    if FaLedger.FindLast() then begin
                        CurrentPeriodDepreciationAmount := FaLedger.Amount;
                    end;
                    if FaLedger.FindSet() then begin
                        repeat
                            CurrentYearDeprAmount += FaLedger.Amount;
                        until FaLedger.Next() = 0;
                    end;


                    // FaLedger3


                end;
            }
            trigger OnPreDataItem()
            begin
                if showOnlyAcquired then begin
                    FixedAsset.SetRange(Acquired, true);
                end
            end;
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
                Day: Integer;
            begin

                FapostingGroupName := '';
                FaLocationName := '';
                bookValue := 0;
                //   FapostingGroupName
                if FapostingTable.get(FixedAsset."FA Posting Group") then begin
                    FapostingGroupName := FapostingTable.Description;
                end;
                if FaLocationCodeRec.Get(FixedAsset."FA Location Code") then begin
                    FaLocationName := FaLocationCodeRec.Name;
                end;

                Fadepbook.Reset();
                Fadepbook.SetRange("FA No.", FixedAsset."No.");
                // getting the book value here 
                if Fadepbook.FindFirst() then begin
                    Fadepbook.CalcFields("Book Value");
                    if Fadepbook."Disposal Date" > 0D then
                        bookValue := 0
                    else
                        bookValue := Fadepbook."Book Value";
                end;
            end;
        }



    }
    requestpage
    {
        AboutTitle = 'Date Filter';
        AboutText = 'Date Filter';
        layout
        {
            area(Content)
            {
                group("Date Filter")
                {
                    field(DateFilter; DateFilter)
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        Caption = 'Period';
                        NotBlank = true;
                    }
                    field(showOnlyAcquired; showOnlyAcquired)
                    {
                        Caption = 'Show Only Acquired Asset';
                        ApplicationArea = All;
                    }
                }
            }
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
        CompanyInfo.CalcFields(Picture);
        showOnlyAcquired := true;
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
        DateFilter: Date;
        showOnlyAcquired: Boolean;

    procedure getBeginingYearDate(datefilter: Date): Date
    var
        currentMonth, currentYear : Integer;
        FirstDayofTheMonth: date;
    // FicalYear: ;
    begin
        currentYear := Date2DMY(datefilter, 3);
        FirstDayofTheMonth := DMY2Date(1, 1, currentYear);
        exit(FirstDayofTheMonth);
    end;

    procedure getPrevMonth(datefilter: Date): Date
    var
        currentMonth, currentYear : Integer;
        FirstDayofTheMonth: date;
    // FicalYear: ;
    begin
        currentYear := Date2DMY(datefilter, 3);
        currentMonth := Date2DMY(datefilter, 2);
        // FirstDayofTheMonth := DMY2Date('<-CM>', , currentYear);
        exit(FirstDayofTheMonth);
    end;


}