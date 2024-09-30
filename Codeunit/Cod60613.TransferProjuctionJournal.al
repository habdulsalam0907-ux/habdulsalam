codeunit 60613 "Transfer Projuction Journal"
{



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnAfterInitItemLedgEntry, '', true, true)]
    local procedure OnAfterInitItemLedgEntry(var ItemLedgEntryNo: Integer; var ItemJournalLine: Record "Item Journal Line"; var NewItemLedgEntry: Record "Item Ledger Entry")
    begin
        NewItemLedgEntry."Actual Output" := ItemJournalLine."Output Quantity";
        NewItemLedgEntry."Component Variance" := ItemJournalLine."Component Variance";
        NewItemLedgEntry."Planned Output" := ItemJournalLine."Planned Output";
        NewItemLedgEntry."Planned Quantity" := ItemJournalLine."Planned Quantity";
        NewItemLedgEntry."Excess  Qty" := ItemJournalLine."Excess  Qty";
        NewItemLedgEntry."Loss  Qty" := ItemJournalLine."Loss  Qty";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Production Journal Mgt", OnBeforeInsertConsumptionJnlLine, '', false, false)]
    local procedure OnBeforeInsertConsumptionJnlLine(ProdOrderComp: Record "Prod. Order Component"; ProdOrderLine: Record "Prod. Order Line"; var ItemJournalLine: Record "Item Journal Line")
    var
        Totals: Decimal;
    begin

        ItemJournalLine."Planned Quantity" := ProdOrderComp."Expected Qty. (Base)";
        ItemJournalLine."Component Variance" := ProdOrderComp."Variance Qty";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Production Journal Mgt", OnBeforeInsertOutputJnlLine, '', false, false)]
    local procedure OnBeforeInsertOutputJnlLine(ProdOrderLine: Record "Prod. Order Line"; var ItemJournalLine: Record "Item Journal Line")
    var
        Totals: Decimal;
    begin

        if ((ProdOrderLine."Quantity (Base)" <> 0)) then
            ItemJournalLine."Planned Output" := ProdOrderLine."Quantity (Base)";
    end;


}