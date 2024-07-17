reportextension 60600 "ÄR Ext" extends "Aged Accounts Receivable"
{
    dataset
    {
        // Add changes to dataitems and columns here

        modify("Cust. Ledger Entry")
        {


            trigger OnAfterAfterGetRecord()
            begin
                // "Cust. Ledger Entry".SetRange("Customer Posting Group");
            end;
        }
        add(Customer)
        {
            column(Customer_Posting_Group; "Customer Posting Group") { }


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
            LayoutFile = 'mylayout.rdl';
        }
    }
}