tableextension 60611 TransferShipmentLineExt extends "Transfer Shipment Line"
{
    fields
    {
        field(60600; "Shortcut Dimension 3 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 3 Code';
        }
        field(60601; "Shortcut Dimension 4 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 4 Code';
        }
        field(60602; "Shortcut Dimension 5 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 5 Code';
        }
        field(60603; "Shortcut Dimension 6 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 6 Code';
        }
        field(60604; "Shortcut Dimension 7 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 7 Code';
        }
        field(60605; "Shortcut Dimension 8 Code"; Code[30])
        {
            Caption = 'Shortcut Dimension 8 Code';
        }
        field(60606; "Requested Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Requested Quantity" <> 0 then begin
                    Quantity := "Requested Quantity";
                end
            end;
        }
    }
}
