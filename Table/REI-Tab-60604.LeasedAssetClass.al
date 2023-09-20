table 60604 "Leased Asset Class"
{
    DataClassification = ToBeClassified;
    DataCaptionFields = Classes, "Useful Life (Yrs)";
    LookupPageID = "Leased Asset Classes";
    
    fields
    {
        field(1; Classes; Enum LeasedAssetClasses)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                case Classes of
                    Classes::"Solar Panel": Description := 'Solar Panel';
                    Classes::"Racks(battery & Solar)": Description := 'Racks(battery & Solar)';
                    Classes::"Inverter(Battery and Solar)": Description := 'Inverter(Battery and Solar)';
                    Classes::Cables: Description := 'Cables';
                    Classes::Generator: Description := 'Generator';
                    Classes::"Air Conditioner": Description := 'Air Conditioner';
                    Classes::Battery: Description := 'Battery';
                    Classes::"Ancillary Equipment": Description := 'Ancillary Equipment (Other Items Used during Installation)';
                    Classes::Others: Description := 'Others(Labour, Installation Cost, Transport, Logistics, Rental Cost, Repairs, Accommodation, Feeding, Payroll Capitalization, Staff Expense, Other Associated Cost not Listed)';
                    else
                        Description := '';
                end;
            end;
            
        }
        field(2; Description; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            
        }
        field(3; "Useful Life (Mth)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                If "Useful Life (Mth)" <> 0 then begin
                    "Useful Life (Yrs)" := "Useful Life (Mth)"/12;
                end;
            end;
        }
        field(4; "Useful Life (Yrs)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                If "Useful Life (Yrs)" <> 0 then begin
                    "Useful Life (Mth)" := "Useful Life (Yrs)" * 12;
                end;
            end;
        }
        // field(5; "Useful Life (Contract Durtn)"; Boolean)
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Contract Duration As Useful Life';

        //     trigger OnValidate()
        //     begin
        //         Clear("Useful Life (Mth)");
        //         Clear("Useful Life (Yrs)");
        //     end;
        // }
    }
    
    keys
    {
        key(Key1; Classes)
        {
            Clustered = true;
        }
    }
    
}

enum 60605 LeasedAssetClasses
{
    Extensible = true;

    value(0; " ") {}
    value(1; "Solar Panel") {}
    value(2; "Racks(battery & Solar)") {}
    value(3; "Inverter(Battery and Solar)") {}
    value(4; Cables) {}
    value(5; Generator) {}
    value(6; "Air Conditioner") {}
    value(7; Battery) {}
    value(8; "Ancillary Equipment") {}
    value(9; Others) {}
}