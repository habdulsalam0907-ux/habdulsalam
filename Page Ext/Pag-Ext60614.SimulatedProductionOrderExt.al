pageextension 60614 "Simulated Production Order Ext" extends "Simulated Production Order"
{
    layout
    {
        addafter("No.")
        {
            field("Batch No."; Rec."Reference Batch No.")
            {
                ApplicationArea = All;
            }
        }
        modify("No.")
        {
            Caption = 'Batch No.';
        }
    }
    actions
    {
        addafter("&Update Unit Cost")
        {
            action(UpdateBatchNo)
            {
                Caption = 'Generate Batch No.';
                Image = UpdateUnitCost;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    GenProdOrderBatchNo();
                end;
            }
        }
    }
    var
        ProdOrder: Record "Production Order";
        Text004: Label 'This order does not have a production order number.';
        Text008: Label 'Location code is empty!';
        Text011: Label 'Quantity to produce is empty!';
        CustomSetup: Record "Custom Setup";
        BatchNo: Code[100];
        NoSeriesMgt: codeunit "No. Series";
        ProdOrderBatch: Record "Production Bach Order Archive";

    local procedure GenProdOrderBatchNo()
    var
        EntryNo: Integer;
    begin
        ProdOrder.GET(Rec.Status, Rec."No.");
        IF ProdOrder."No." = '' THEN
            ERROR(Text004);

        IF Rec."Location Code" = '' THEN
            ERROR(Text008);

        IF Rec.Quantity = 0 THEN
            ERROR(Text011);

        IF Rec."Reference Batch No." <> '' THEN
            ERROR('This order has a Batch No. already.');

        CustomSetup.GET;
        CustomSetup.TESTFIELD("Batch Nos.");
        BatchNo := NoSeriesMgt.GetNextNo(CustomSetup."Batch Nos.", 0D, TRUE);
        Rec."Reference Batch No." := BatchNo;
        Rec.MODIFY;

        //use as control to know Batch No. generated
        ProdOrderBatch."Batch No." := BatchNo;
        ProdOrderBatch."Source Document No." := Rec."No.";
        ProdOrderBatch."Line No." += 1;
        ProdOrderBatch."Production Date" := TODAY;
        ProdOrderBatch.INSERT;
    end;
}
