pageextension 60624 "SimulatedProdLine" extends "Simulated Prod. Order Lines"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Order &Tracking")
        {
            action("Create Production Order")
            {
                ApplicationArea = Manufacturing;
                Caption = 'Create Production Order';
                Image = Create;
                trigger OnAction()
                var
                    component: Record "Prod. Order Component";
                    checkAvailability: Page "Check Component Availability";
                    storeNotAvailableItem: JsonObject;
                    fromLocation: code[20];
                    ToLocation: code[20];
                    specialCase: list of [text];
                    itemLedger, itemLedger2 : record "Item Ledger Entry";
                    RequiredQuantity, RemainingQuantity : Decimal;
                    listofitemToTransfer: JsonArray;
                    count: Integer;
                    JsonTokken, JsonTokken2 : JsonToken;
                    TransferOrder: Record "Transfer Header";
                    TransferLine: Record "Transfer Line";
                    lineNo: Integer;
                    itemcode: Code[20];
                    transferOrderQuantity: Decimal;
                    finishedInserting: Boolean;
                    inventorySetup: Record "Inventory Setup";
                    noSeriesMgt: Codeunit NoSeriesManagement;
                begin
                    if not confirm('Do you want to scan component for availability?', true) then exit;
                    inventorySetup.Get();
                    case checkAvailability.RunModal() of
                        Action::OK:
                            begin
                                fromLocation := checkAvailability.getFromLocation();
                                ToLocation := checkAvailability.getToLocation();
                                if ((fromLocation = '') or (ToLocation = '')) then Error('Location is mandatory for this process');
                                component.SetRange("Prod. Order No.", Rec."Prod. Order No.");
                                component.SetRange(Status, Rec.Status::Simulated);
                                if component.FindSet() then begin
                                    repeat
                                        RequiredQuantity := component."Remaining Quantity";
                                        itemLedger.Reset();
                                        itemLedger2.Reset();
                                        Clear(storeNotAvailableItem);
                                        itemLedger.SetRange("Item No.", component."Item No.");
                                        itemLedger.SetRange("Location Code", ToLocation);
                                        if itemLedger.FindFirst() then begin
                                            if RequiredQuantity > itemLedger.Quantity then begin
                                                storeNotAvailableItem.Add('item', component."Item No.");
                                                RemainingQuantity := (RequiredQuantity - itemLedger.Quantity);
                                                storeNotAvailableItem.Add('Remaining', RemainingQuantity);
                                                itemLedger2.SetRange("Item No.", component."Item No.");
                                                itemLedger2.SetRange("Location Code", fromLocation);
                                                if itemLedger2.FindFirst() then begin
                                                    if RemainingQuantity >= itemLedger2.Quantity then
                                                        storeNotAvailableItem.Add('isAvailable', true) else
                                                        storeNotAvailableItem.Add('isAvailable', false);
                                                end;
                                                listofitemToTransfer.Add(storeNotAvailableItem);
                                            end
                                        end;


                                    until component.Next() = 0;
                                end;
                                if listofitemToTransfer.Count > 0 then begin
                                    TransferOrder.Reset();
                                    lineNo := 1000;
                                    TransferOrder.Init();
                                    // TransferOrder.Insert();
                                    inventorySetup.TestField("Transfer Order Nos.");
                                    noSeriesMgt.InitSeries(inventorySetup."Transfer Order Nos.", inventorySetup."Transfer Order Nos.", 0D, TransferOrder."No.", TransferOrder."No. Series");
                                    TransferOrder.Validate("Transfer-from Code", fromLocation);
                                    TransferOrder.Validate("Transfer-to Code", ToLocation);
                                    // TransferOrder."In-Transit Code" := 'GIT';
                                    TransferOrder."Direct Transfer" := true;
                                    TransferOrder.insert();
                                    for count := 1 TO listofitemToTransfer.Count do begin
                                        if listofitemToTransfer.Get(count, JsonTokken) then begin
                                            if JsonTokken.AsObject().Get('isAvailable', JsonTokken2) then
                                                if not JsonTokken2.AsValue().AsBoolean() then begin
                                                    if JsonTokken.AsObject().Get('item', JsonTokken2) then
                                                        specialCase.Add(JsonTokken2.AsValue().AsCode());
                                                end else begin
                                                    if JsonTokken.AsObject().Get('item', JsonTokken2) then
                                                        itemcode := JsonTokken2.AsValue().AsCode();
                                                    if JsonTokken.AsObject().Get('Remaining', JsonTokken2) then
                                                        transferOrderQuantity := JsonTokken2.AsValue().AsDecimal();
                                                    TransferLine.Init();
                                                    TransferLine."Document No." := TransferOrder."No.";
                                                    TransferLine."Line No." := lineNo;
                                                    TransferLine.Validate("Item No.", itemcode);
                                                    TransferLine.Validate(Quantity, transferOrderQuantity);
                                                    if TransferLine.Insert() then finishedInserting := true;
                                                end;
                                        end
                                    end;
                                    if finishedInserting then begin
                                        if specialCase.Count > 0 then begin
                                        end else begin
                                            if Confirm('Do you want to open Transfer Order ?', true) then begin

                                            end
                                        end;
                                    end
                                end
                            end;
                        Action::Cancel:
                            begin
                                Message('Process Canceled...');
                                exit;
                            end;
                    end;




                end;
            }

        }
    }

    procedure SendApprovalRequestNotification()
    var
        hyperlinkText: Text;
        Link: Text;
        Recipients: List of [Text];
        SentBy, Recipient : Record "User Setup";
        Subject: Text[150];
        EmailMessage: Codeunit "Email Message";
        Text006: Label 'Dear ';
        Text008: Label '%1 canceled Retail Sales with document number %2 ';
        Text009: Label 'This is a system generated mail.';
        Email: Codeunit "Email";
    begin
        IF SentBy.GET(USERID) THEN;
        Recipient.SetFilter("User ID", '<>%1', '');
        Link := GETURL(CLIENTTYPE::Web, COMPANYNAME, OBJECTTYPE::Page,
                       PAGE::"REI-Document Approval Entries", Rec);

        hyperlinkText := STRSUBSTNO('<a href=' + Link + '>' +
                    'Click here to approve or reject record.</a>');
        Clear(Recipients);
        if Recipient.FindSet() then begin
            repeat
                Recipients.Add(Recipient."E-Mail");
            until Recipient.Next() = 0;
        end;
        Subject := STRSUBSTNO(' %1 has canceled Retail Sales with document no %2.', SentBy."Full Name", Rec."Prod. Order No.");
        EmailMessage.Create(Recipients, Subject, '', TRUE);
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(Text006 + Recipient."Full Name" + ',')));
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(Text008, SentBy."Full Name")));
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody('Regards');
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SentBy."Full Name")));
        EmailMessage.AppendToBody('<HR>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(Text009)));
        IF Email.Send(EmailMessage, Enum::"Email Scenario"::Default) THEN;
    end;

    var
        myInt: Integer;
}