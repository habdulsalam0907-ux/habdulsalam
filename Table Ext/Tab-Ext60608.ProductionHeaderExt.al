tableextension 60608 "Production Header Ext" extends "Production Order"
{
    fields
    {
        field(60600; "Reference Batch No."; Code[50])
        {
            Caption = 'Reference Batch No.';
            DataClassification = ToBeClassified;
            TableRelation = "Production Order"."No.";

            trigger OnLookup()
            var
                ProdOrder: Record "Production Order";
            begin
                //    ProdOrder.SETFILTER(Status, '%1', ProdOrder.Status::Approved);
                IF PAGE.RUNMODAL(Page::"Finished Production Orders", ProdOrder) = ACTION::LookupOK THEN BEGIN
                    "Reference Batch No." := ProdOrder."No.";
                end;
            end;
        }
    }
}
