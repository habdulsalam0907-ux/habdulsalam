pageextension 60631 ProductionJournal extends "Production Journal"
{
    layout
    {

        modify("Output Quantity")
        {
            trigger OnAfterValidate()
            begin
                if Rec."Output Quantity" > Rec."Planned Output" then begin
                    Rec."Component Variance" := Rec."Output Quantity" - Rec."Planned Output";
                    TextColorOutput := 'Favorable';
                end else if Rec."Output Quantity" < Rec."Planned Output" then begin
                    Rec."Component Variance" := -(Rec."Planned Output" - Rec."Output Quantity");
                    TextColorOutput := 'UnFavorable';
                end;
            end;
        }
        modify(Quantity)
        {
            Caption = 'Actual Consumption';
            trigger OnAfterValidate()
            begin
                if Rec.Quantity > Rec."Planned Quantity" then begin
                    Rec.Validate("Excess  Qty", -(Rec.Quantity - Rec."Planned Quantity"));
                    TextColor := 'UnFavorable';
                end else if Rec.Quantity <= Rec."Planned Quantity" then begin
                    Rec.Validate("Loss  Qty", (Rec."Planned Quantity" - Rec.Quantity));
                    TextColor := 'Favorable';
                end;
            end;
        }

        // Add changes to page layout here
        addbefore("Setup Time")
        {

            field("Planned Quantity"; Rec."Planned Quantity")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Planned Quantity field.';
                HideValue = notHideValue;

            }
            field("Excess  Qty"; Rec."Excess  Qty")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Excess  Qty field.';
                HideValue = notHideValue;
                StyleExpr = TextColor;
            }

            field("Loss  Qty"; Rec."Loss  Qty")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Loss  Qty field.';
                Caption = 'Un-used Qty ';
                HideValue = notHideValue;
                StyleExpr = TextColor;
            }
        }
        addbefore("Scrap Quantity")
        {
            field("Planned Output"; Rec."Planned Output")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Planned Output field.', Comment = '%';
                HideValue = HideValue;
            }
            field("Component Variance"; Rec."Component Variance")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Component Variance field.';
                HideValue = HideValue;
                StyleExpr = TextColorOutput;
            }


        }
    }










    trigger OnAfterGetRecord()
    begin
        notHideValue := false;
        HideValue := false;
        if Rec."Entry Type" = Rec."Entry Type"::Output then begin
            notHideValue := true;
        end else if Rec."Entry Type" = Rec."Entry Type"::Consumption then HideValue := true;
    end;


    var
        notHideValue, HideValue : Boolean;
        TextColor, TextColorOutput : code[20];

}