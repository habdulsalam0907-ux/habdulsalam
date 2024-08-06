reportextension 60607 "AP Ext" extends "Aged Accounts Payable"
{
    dataset
    {
        // Add changes to dataitems and columns here

        modify("Vendor Ledger Entry")
        {

            trigger OnAfterAfterGetRecord()
            var
                VendLedgerEntry: Record "Vendor Ledger Entry";
            begin
                // "Cust. Ledger Entry".SetRange("Customer Posting Group");
                VendLedgerEntry.SetRange("Vendor No.", "Vendor Ledger Entry"."Vendor No.");
                VendLedgerEntry.SetRange("Date Filter", "Vendor Ledger Entry"."Date Filter");
                if VendLedgerEntry.FindSet() then begin
                    repeat
                        current += VendLedgerEntry.Amount;
                    until VendLedgerEntry.Next() = 0;
                end

            end;
        }
        add(OpenVendorLedgEntry)
        {
            column(current; current)
            {

            }
            column(TotalCurrent; TotalCurrent)
            {

            }

        }

        add(vendor)
        {
            column(Vendor_Posting_Group; "Vendor Posting Group")
            {

            }

        }
        modify(vendor)
        {

            trigger OnAfterAfterGetRecord()
            begin
                // Customer.SetRange("Customer Posting Group", cus);
            end;
        }
    }

    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Report/AccountPayable.rdl';
        }
    }

    var
        current, TotalCurrent : Decimal;

}