// pageextension 60624 "SimulatedProdLine" extends "Simulated Prod. Order Lines"
// {
//     layout
//     {
//         // Add changes to page layout here
//     }

//     actions
//     {
//         // Add changes to page actions here
//         addafter("Order &Tracking")
//         {
//             action(CreateTransferOrder)
//             {
//                 ApplicationArea = Manufacturing;
//                 Caption = 'Scan & Transfer Component To Transfer Order';
//                 Image = Create;
//                 trigger OnAction()
//                 var
//                     component: Record "Prod. Order Component";
//                     checkAvailability: Page "Check Component Availability";
//                     storeNotAvailableItem: JsonObject;
//                     fromLocation: code[20];
//                     ToLocation: code[20];
//                     specialCase: list of [text];
//                     specialCaseQuantity: list of [Decimal];
//                     itemLedger, itemLedger2 : record "Item Ledger Entry";
//                     RequiredQuantity, RemainingQuantity : Decimal;
//                     listofitemToTransfer: JsonArray;
//                     count: Integer;
//                     JsonTokken, JsonTokken2 : JsonToken;
//                     TransferOrder: Record "Transfer Header";
//                     TransferLine: Record "Transfer Line";
//                     lineNo: Integer;
//                     itemcode: Code[20];
//                     transferOrderQuantity: Decimal;
//                     finishedInserting: Boolean;
//                     inventorySetup: Record "Inventory Setup";
//                     noSeriesMgt: codeunit "No. Series";
//                     Subject: Text;
//                     EmailBody: Text;
//                     Email: Codeunit Email;
//                     EmailMessage: Codeunit "Email Message";
//                     hyperlinkText: Text;
//                     Link: Text;
//                     GLSetup: Record "General Ledger Setup";
//                     CurrCode: Code[10];
//                     SenderEmail: Text;
//                     SenderName: Text;
//                     Recipient1: List of [Text];
//                     RecipientMail, TableData : Text;
//                     RecipientName: Text;
//                     usersetup: Record "User Setup";
//                     Custome: Record "Custom Setup";
//                     SimulatedHeader: Record "Production Order";
//                     SimulationNotification: Notification;
//                     SubjectTxt: Label 'Purchase Requisition needed for production Item %1';
//                     Text008: Label 'Production Supervisor Request that you get the  following Item for the production of %1. ';
//                     SystemGenerated: Label 'This is a system generated mail.';
//                 // PurchRequisitionHeader: Record "REI-Purch. Requisition";
//                 // PurchRequisitionLine: Record "REI-Purch. Requisition Line";


//                 begin
//                     if not confirm('Do you want to scan component for availability?', true) then exit;
//                     inventorySetup.Get();
//                     case checkAvailability.RunModal() of
//                         Action::OK:
//                             begin
//                                 fromLocation := checkAvailability.getFromLocation();
//                                 ToLocation := checkAvailability.getToLocation();
//                                 if ((fromLocation = '') or (ToLocation = '')) then Error('Location is mandatory for this process');
//                                 component.SetRange("Prod. Order No.", Rec."Prod. Order No.");
//                                 component.SetRange(Status, Rec.Status::Simulated);
//                                 SimulatedHeader.SetRange("No.", Rec."Prod. Order No.");
//                                 SimulatedHeader.SetRange(Status, Rec.Status::Simulated);
//                                 SimulatedHeader.FindFirst();
//                                 if component.FindSet() then begin
//                                     repeat
//                                         RequiredQuantity := component."Remaining Quantity";
//                                         Clear(storeNotAvailableItem);
//                                         itemLedger.Reset();
//                                         itemLedger.SetRange("Item No.", component."Item No.");
//                                         itemLedger.SetRange("Location Code", fromLocation);

//                                         if itemLedger.FindFirst() then begin


//                                             if RequiredQuantity > itemLedger.Quantity then begin

//                                                 storeNotAvailableItem.Add('item', component."Item No.");
//                                                 RemainingQuantity := (RequiredQuantity - itemLedger.Quantity);
//                                                 storeNotAvailableItem.Add('Remaining', RemainingQuantity);
//                                                 itemLedger2.SetRange("Item No.", component."Item No.");
//                                                 itemLedger2.SetRange("Location Code", fromLocation);
//                                                 if itemLedger2.FindFirst() then begin
//                                                     if RemainingQuantity >= itemLedger2.Quantity then
//                                                         storeNotAvailableItem.Add('isAvailable', true) else
//                                                         storeNotAvailableItem.Add('isAvailable', false);
//                                                 end;
//                                                 listofitemToTransfer.Add(storeNotAvailableItem);
//                                             end
//                                         end;


//                                     until component.Next() = 0;
//                                 end;

//                                 if listofitemToTransfer.Count > 0 then begin



//                                     for count := 1 TO listofitemToTransfer.Count do begin
//                                         if listofitemToTransfer.Get(count, JsonTokken) then begin
//                                             if JsonTokken.AsObject().Get('isAvailable', JsonTokken2) then
//                                                 if not JsonTokken2.AsValue().AsBoolean() then begin
//                                                     JsonTokken.AsObject().Get('Remaining', JsonTokken2);
//                                                     RemainingQuantity := JsonTokken2.AsValue().AsDecimal();
//                                                     if JsonTokken.AsObject().Get('item', JsonTokken2) then
//                                                         specialCase.Add(JsonTokken2.AsValue().AsCode());
//                                                     specialCaseQuantity.Add(RemainingQuantity);

//                                                     SimulationNotification.Message := 'Insufficient inventory on ' + JsonTokken2.AsValue().AsCode() + ' Additional quantity of ' + Format(RemainingQuantity);
//                                                     SimulationNotification.Scope := NotificationScope::LocalScope;
//                                                     SimulationNotification.Send();




//                                                     Custome.Get();
//                                                     Custome.TestField("Inventory Team E-mail");
//                                                     Custome.TestField("Warehouse Team E-mail");

//                                                     SenderEmail := Custome."Inventory Team E-mail";
//                                                     Recipient1.Add(Custome."Inventory Team E-mail");
//                                                     Recipient1.Add(Custome."Warehouse Team E-mail");
//                                                     Subject := STRSUBSTNO(SubjectTxt, SimulatedHeader.Description);
//                                                     TableData += '<table style =" border-collapse: collapse; width: 100%;">';

//                                                     TableData += '<tr style="background-color: #f2f2f2;"><th style="padding-top: 12px;padding-bottom: 12px;text-align: left;background-color: #04AA6D;color: white;">Product</th>';

//                                                     TableData += '<th style="padding-top: 12px;padding-bottom: 12px;text-align: left;background-color: #04AA6D;color: white;">Quantity Needed</th>';


//                                                     TableData += '<tr style="background-color: #f2f2f2;"><td style=" border: 1px solid #ddd;padding: 8px;"> ' + JsonTokken2.AsValue().AsCode() + '</td>';
//                                                     JsonTokken.AsObject().Get('Remaining', JsonTokken2);
//                                                     TableData += '<td style=" border: 1px solid #ddd;padding: 8px;"> ' + Format(JsonTokken2.AsValue().AsDecimal()) + '</td>';

//                                                     TableData += '</table>';
//                                                     EmailBody := STRSUBSTNO(Text008, SimulatedHeader.Description);

//                                                 end;

//                                         end
//                                     end;
//                                     if Recipient1.Count > 0 then begin
//                                         Message('ha ha ha i got here !!');

//                                         OnTransferOnAvailableItemToRequisition(specialCase, specialCaseQuantity, Link);
//                                         exit;

//                                         // Link := GETURL(CLIENTTYPE::Web, COMPANYNAME, OBJECTTYPE::Page,
//                                         // PAGE::"REI-Purch. Requisition Card", PurchRequisitionHeader);
//                                         EmailMessage.Create(Recipient1, Subject, '', TRUE);
//                                         EmailMessage.AppendToBody(FORMAT(STRSUBSTNO('Hello Team,')));
//                                         EmailMessage.AppendToBody('<br><br>');
//                                         EmailMessage.AppendToBody(FORMAT(EmailBody));
//                                         EmailMessage.AppendToBody('<br><br>');
//                                         EmailMessage.AppendToBody(TableData);
//                                         EmailMessage.AppendToBody('<br><br>');
//                                         EmailMessage.AppendToBody('Regards,');
//                                         EmailMessage.AppendToBody('<br><br>');
//                                         EmailMessage.AppendToBody(FORMAT(STRSUBSTNO('Production Supervisor.')));
//                                         EmailMessage.AppendToBody('<HR>');
//                                         EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SystemGenerated)));
//                                         Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
//                                     end

//                                 end;



//                                 // if component.FindSet() then begin
//                                 //     repeat
//                                 //         TransferOrder.Reset();
//                                 //         lineNo := 1000;
//                                 //         TransferOrder.Init();
//                                 //         // TransferOrder.Insert();
//                                 //         inventorySetup.TestField("Transfer Order Nos.");
//                                 //         noSeriesMgt.InitSeries(inventorySetup."Transfer Order Nos.", inventorySetup."Transfer Order Nos.", 0D, TransferOrder."No.", TransferOrder."No. Series");
//                                 //         TransferOrder.Validate("Transfer-from Code", fromLocation);
//                                 //         TransferOrder.Validate("Transfer-to Code", ToLocation);
//                                 //         TransferOrder.Validate("Posting Date", Today);
//                                 //         // TransferOrder."In-Transit Code" := 'GIT';
//                                 //         TransferOrder."Direct Transfer" := true;

//                                 //         if TransferOrder.insert() = true then begin
//                                 //             Rec.TestField("Shortcut Dimension 1 Code");
//                                 //             Rec.TestField("Shortcut Dimension 2 Code");
//                                 //             TransferOrder.Validate("Shortcut Dimension 1 Code", Rec."Shortcut Dimension 1 Code");
//                                 //             TransferOrder.Validate("Shortcut Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
//                                 //             if TransferOrder."Shipment Date" = 0D then
//                                 //                 TransferOrder.Validate("Shipment Date", Today);
//                                 //             TransferOrder.Modify();

//                                 //             TransferLine.Init();
//                                 //             TransferLine."Document No." := TransferOrder."No.";
//                                 //             TransferLine."Line No." := lineNo;
//                                 //             TransferLine.Validate("Item No.", component."Item No.");
//                                 //             TransferLine.Validate(Quantity, component.Quantity);
//                                 //             if TransferLine.Insert() then finishedInserting := true;
//                                 //         end;
//                                 //     until component.Next() = 0;

//                                 // end;
//                                 // if finishedInserting then begin
//                                 //     if Confirm('Do you want to open Transfer Order ?', true) then begin
//                                 //         Page.Run(Page::"Transfer Orders", TransferOrder);
//                                 //     end;
//                                 // end


//                             end;
//                         Action::Cancel:
//                             begin
//                                 Message('Process Canceled...');
//                                 exit;
//                             end;
//                     end;




//                 end;
//             }

//         }
//     }

//     procedure SendApprovalRequestNotification()
//     var
//         hyperlinkText: Text;
//         Link: Text;
//         Recipients: List of [Text];
//         SentBy, Recipient : Record "User Setup";
//         Subject: Text[150];
//         EmailMessage: Codeunit "Email Message";
//         Text006: Label 'Dear ';
//         Text008: Label '%1 canceled Retail Sales with document number %2 ';
//         Text009: Label 'This is a system generated mail.';
//         Email: Codeunit Email;
//     begin
//         IF SentBy.GET(USERID) THEN;
//         Recipient.SetFilter("User ID", '<>%1', '');
//         Link := GETURL(CLIENTTYPE::Web, COMPANYNAME, OBJECTTYPE::Page, PAGE::"REI-Document Approval Entries", Rec);

//         hyperlinkText := STRSUBSTNO('<a href=' + Link + '>' +
//                     'Click here to approve or reject record.</a>');
//         Clear(Recipients);
//         if Recipient.FindSet() then begin
//             repeat
//                 Recipients.Add(Recipient."E-Mail");
//             until Recipient.Next() = 0;
//         end;
//         Subject := STRSUBSTNO(' %1 has canceled Retail Sales with document no %2.', SentBy."Full Name", Rec."Prod. Order No.");
//         EmailMessage.Create(Recipients, Subject, '', TRUE);
//         EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(Text006 + Recipient."Full Name" + ',')));
//         EmailMessage.AppendToBody('<br><br>');
//         EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(Text008, SentBy."Full Name")));
//         EmailMessage.AppendToBody('<br><br>');
//         EmailMessage.AppendToBody('<br><br>');
//         EmailMessage.AppendToBody('Regards');
//         EmailMessage.AppendToBody('<br><br>');
//         EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SentBy."Full Name")));
//         EmailMessage.AppendToBody('<HR>');
//         EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(Text009)));
//         IF Email.Send(EmailMessage, Enum::"Email Scenario"::Default) THEN;
//     end;

//     var
//         myInt: Integer;

//     [IntegrationEvent(false, false)]
//     local procedure OnTransferOnAvailableItemToRequisition(itemNO: list of [text]; itemQuantity: List of [Decimal]; Var PageLink: Text)
//     begin
//     end;


// }