page 60605 "Leased Asset Composition Line"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Leased Asset Composition";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Project Site Code"; Rec."Fixed Asset Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project Site Code field.';
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Visible = false;
                }
                field("First Depreciation Date"; Rec."First Depreciation Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Depreciation Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Opening Cost"; Rec."Opening Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Opening Cost field.';
                }
                field("Additions Cost"; Rec."Additions Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Additions Cost field.';
                }
                field("Total cost"; Rec."Total cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total cost field.';
                }
                field("Tenor (Mths)"; Rec."Tenor (Mths)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tenor (Mths) field.';
                }
            }
            group(Control43)
            {
                ShowCaption = false;
                group(Control37)
                {
                    ShowCaption = false;
                    field(OpeningTotal; OpeningTotal)
                    {
                        ApplicationArea = all;
                        Caption = 'Opening Cost - Total';
                        Editable = false;
                        DrillDown = true;
                    }
                }
                group(Control38)
                {
                    ShowCaption = false;
                    field(AdditionsTotal; AdditionsTotal)
                    {
                        ApplicationArea = all;
                        Caption = 'Additions Cost - Total';
                        Editable = false;
                        DrillDown = true;
                    }
                }
                group(Control39)
                {
                    ShowCaption = false;
                    field(SumTotalCost; SumTotalCost)
                    {
                        ApplicationArea = all;
                        Caption = 'Total Cost - Sum';
                        Editable = false;
                        DrillDown = true;
                    }
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(EditInExcel)
            {
                Caption = 'Edit In Excel';
                ToolTip = 'This uses the Edit in Ecel codeunit';
                Image = Excel;
                ApplicationArea = All;


                trigger OnAction()
                var
                    EditInExcel: Codeunit "Edit in Excel";
                    EditInExcelFilters: Codeunit "Edit in Excel Filters";
                    FilterText: Text;
                begin
                    FilterText := StrSubstNo('Fixed_Asset_Code eq ''%1''', Rec."Fixed Asset Code");
                    EditInExcel.EditPageInExcel(CurrPage.ObjectId(true), CurrPage.ObjectId(false), FilterText);

                    // EditInExcelFilters.AddField('Fixed_Asset_Code',Enum::"Edit in Excel Filter Type"::Equal,
                    //         Rec."Fixed Asset Code",Enum::"Edit in Excel Edm Type"::"Edm.String");
                    // EditInExcel.EditPageInExcel(CurrPage.ObjectId(true), CurrPage.ObjectId(false),EditInExcelFilters);
                end;
            }
        }
    }
    var
        OpeningTotal, AdditionsTotal, SumTotalCost : Decimal;

    trigger OnOpenPage()
    begin
        GetTotals();
    end;

    trigger OnAfterGetRecord()
    begin
        GetTotals();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        GetTotals();
    end;

    local procedure GetTotals()
    var
        LeasedComp: Record "Leased Asset Composition";
    begin
        LeasedComp.Reset();
        LeasedComp.SetRange("Fixed Asset Code", Rec."Fixed Asset Code");
        If LeasedComp.FindSet() then begin
            LeasedComp.CalcSums("Opening Cost", "Additions Cost", "Total cost");
            OpeningTotal := LeasedComp."Opening Cost";
            AdditionsTotal := LeasedComp."Additions Cost";
            SumTotalCost := LeasedComp."Total cost";
        end;
    end;
}
