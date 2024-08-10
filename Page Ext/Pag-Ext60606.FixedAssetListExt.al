pageextension 60606 FixedAssetListExt extends "Fixed Asset List"
{
    layout
    {
        addafter(Acquired)
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addfirst("Fixed &Asset")
        {
            // action("Update Vehicle")
            // {
            //     ApplicationArea = all;
            //     Promoted = true;
            //     Visible = NotClassified;
            //     trigger OnAction()
            //     var
            //         FixedAsset: Record "Fixed Asset";
            //     begin
            //         if not FixedAsset.IsEmpty then begin
            //             FixedAsset.SetRange("Classify As Vehicle", false);
            //             FixedAsset.SetRange("FA Subclass Code", 'MOTOR_VEH');
            //             if FixedAsset.FindSet() then begin
            //                 repeat
            //                     FixedAsset."Classify As Vehicle" := true;
            //                     FixedAsset.Modify();
            //                 until FixedAsset.Next() = 0;
            //             end
            //         end
            //     end;
            // }
        }
    }

    var
        NotClassified: Boolean;

    trigger OnOpenPage()
    var
        FixedAsset: Record "Fixed Asset";
        FASubClasses: Record "FA SubClass";
    begin
        FASubClasses.Reset();
        FASubClasses.SetRange("For Vehicles", true);
        If FASubClasses.FindFirst() then begin
            FixedAsset.Reset();
            FixedAsset.SetRange("FA Subclass Code", FASubClasses.Code);
            FixedAsset.SetRange("Classify As Vehicle", false);
            if FixedAsset.FindSet() then begin
                FixedAsset.ModifyAll("Classify As Vehicle",true);
            end;
        end;
    end;
}
