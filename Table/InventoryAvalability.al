report 60612 "Inventory Avalability"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = InventoryReport;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Item No.", "Location Code";
            column(ItemNo_ItemLedgerEntry; "Item No.")
            {
            }
            column(LocationCode_ItemLedgerEntry; "Location Code")
            {
            }
            column(Quantity_ItemLedgerEntry; Quantity)
            {
            }
            column(RemainingQuantity_ItemLedgerEntry; "Remaining Quantity")
            {
            }
            column(ReservedQuantity_ItemLedgerEntry; "Reserved Quantity")
            {
            }
            column(InvoicedQuantity_ItemLedgerEntry; "Invoiced Quantity")
            {
            }
            column(Description_ItemLedgerEntry; Description)
            {
            }


        }
    }


    rendering
    {
        layout(InventoryReport)
        {
            Type = RDLC;
            LayoutFile = 'InventoryAvalability.rdl';
        }
    }

    var
        myInt: Integer;
}