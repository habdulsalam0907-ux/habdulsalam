reportextension 60600 "AR Ext" extends "Aged Accounts Receivable"
{
    dataset
    {
        // Add changes to dataitems and columns here

        modify(OpenCustLedgEntry)
        {

            trigger OnAfterAfterGetRecord()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
            begin
                // "Cust. Ledger Entry".SetRange("Customer Posting Group");
                CustLedgerEntry.SetRange("Customer No.", "Cust. Ledger Entry"."Customer No.");
                CustLedgerEntry.SetRange("Posting Date", OpenCustLedgEntry."Date Filter");
                if CustLedgerEntry.FindSet() then begin
                    repeat
                        current += CustLedgerEntry.Amount;
                    until CustLedgerEntry.Next() = 0;
                end

            end;
        }
        add(OpenCustLedgEntry)
        {
            column(current; current)
            {

            }
            column(TotalCurrent; TotalCurrent)
            {

            }

        }

        add(Customer)
        {
            column(Customer_Business_Group; "Customer Business Group")
            {

            }

        }
        modify(Customer)
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
            LayoutFile = './Report/AccountReceivable.rdl';
        }
    }

    var
        current, TotalCurrent : Decimal;

}