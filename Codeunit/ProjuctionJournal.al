codeunit 60613 "Transfer Projuction Journal"
{

    procedure TransferComponentToJournal()
    begin


    end;


    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Production Journal Mgt", OnBeforeInsertConsumptionJnlLine, '', false, false)]
    // local procedure OnBeforeInsertConsumptionJnlLine(ProdOrderComp: Record "Prod. Order Component"; ProdOrderLine: Record "Prod. Order Line"; var ItemJournalLine: Record "Item Journal Line")
    // begin
    //     ItemJournalLine."Planned Quantity" := ProdOrderComp."Expected Qty. (Base)";
    //     ItemJournalLine."Component Variance" := ProdOrderComp."Variance Qty";

    // end;
}