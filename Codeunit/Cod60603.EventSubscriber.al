codeunit 60603 "Emp Consolidation Events"
{

    procedure ImportEmployeeRec(): Boolean
    var
        consolidatedCompanies: Record "Company Setup";
        EmployeeReC: Record Employee;
        consolidatedEmpRec, consolidatedEmpRec1 : Record "Consolidated Employee";
        Complited: Boolean;
    begin
        if not consolidatedCompanies.IsEmpty then begin
            consolidatedCompanies.SetRange("Is Active?", true);
            consolidatedCompanies.FindSet();
            repeat
                if EmployeeReC.ChangeCompany(consolidatedCompanies.Name) then begin
                    if EmployeeReC.FindSet() then begin
                        repeat
                            if not consolidatedEmpRec.Get(EmployeeReC."No.", consolidatedCompanies.Name) then begin
                                if insertConsolidatedEmployee(EmployeeReC, consolidatedCompanies.Name) then Complited := true;
                            end else begin
                                if ModifyConsolidatedEmployee(consolidatedEmpRec, EmployeeReC, consolidatedCompanies.name) then Complited := true;
                            end;
                        until EmployeeReC.Next() = 0;
                    end
                end
            until consolidatedCompanies.Next() = 0;
            exit(Complited);
        end
    end;

    procedure insertConsolidatedEmployee(var EmployeeReC: Record Employee; companyname: Text[50]): Boolean
    var
        ConsolidatedEmp: Record "Consolidated Employee";
        ConsolidatedCompines: Record "Company Setup";
    begin
        ConsolidatedCompines.SetRange(Name, getCompanyDisplayName(companyname));
        ConsolidatedCompines.SetRange("Is Active?", true);
        if ConsolidatedCompines.FindFirst() then begin
            ConsolidatedEmp.Reset();
            ConsolidatedEmp.Init();
            ConsolidatedEmp."No." := EmployeeReC."No.";
            ConsolidatedEmp."First Name" := EmployeeReC."First Name";
            ConsolidatedEmp."Last Name" := EmployeeReC."Last Name";
            ConsolidatedEmp."Job Title" := EmployeeReC."Job Title";
            ConsolidatedEmp."Middle Name" := EmployeeReC."Middle Name";
            ConsolidatedEmp."Search Name" := EmployeeReC."Search Name";
            ConsolidatedEmp."Company Display Name" := getCompanyDisplayName(companyname);
            ConsolidatedEmp."Company Name." := companyname;
            ConsolidatedEmp.Email := EmployeeReC."E-Mail";
            ConsolidatedEmp.Status := EmployeeReC.Status;

            if ConsolidatedEmp.Insert() = true then exit(true);
        end;
    end;

    procedure getCompanyDisplayName(Var CompanyName: text[50]): Text[1000]
    var
        company: Record company;
    begin
        if company.Get(CompanyName) then exit(company."Display Name");
    end;

    procedure ModifyConsolidatedEmployee(var ConsolidatedEmp: Record "Consolidated Employee"; Var EmployeeReC: Record Employee; companyName: Text[50]): Boolean
    var
        ConsolidatedCompines: Record "Company Setup";
    begin
        ConsolidatedCompines.SetRange(Name, getCompanyDisplayName(companyname));
        ConsolidatedCompines.SetRange("Is Active?", true);
        if ConsolidatedCompines.FindFirst() then begin
            ConsolidatedEmp."First Name" := EmployeeReC."First Name";
            ConsolidatedEmp."Last Name" := EmployeeReC."Last Name";
            ConsolidatedEmp."Job Title" := EmployeeReC."Job Title";
            ConsolidatedEmp."Middle Name" := EmployeeReC."Middle Name";
            ConsolidatedEmp."Search Name" := EmployeeReC."Search Name";
            ConsolidatedEmp."Company Display Name" := getCompanyDisplayName(companyName);
            ConsolidatedEmp.Email := EmployeeReC."E-Mail";
            ConsolidatedEmp."Company Name." := getCompanyDisplayName(companyName);
            ConsolidatedEmp.Status := EmployeeReC.Status;
            if ConsolidatedEmp.Modify() = true then exit(true);
        end;
    end;

    procedure deleteConsolidatedEmp(var Employee: Record Employee; CompanyName: Text)
    var
        ConsolidatedEmp: Record "Consolidated Employee";
        ConsolidatedCompines: Record "Company Setup";
    begin
        ConsolidatedCompines.SetRange(Name, getCompanyDisplayName(companyname));
        ConsolidatedCompines.SetRange("Is Active?", true);
        if ConsolidatedCompines.FindFirst() then begin
            if ConsolidatedEmp.Get(Employee."No.", CompanyName) then
                ConsolidatedEmp.Delete();
        end;
    end;

    procedure renameConsolidatedEmp(var xemp: Record Employee; employee: Record Employee; CompanyName: text[50])
    var
        ConsolidatedEmp: Record "Consolidated Employee";
        ConsolidatedCompines: Record "Company Setup";
    begin
        ConsolidatedCompines.SetRange(Name, getCompanyDisplayName(companyname));
        ConsolidatedCompines.SetRange("Is Active?", true);
        if ConsolidatedCompines.FindFirst() then begin
            if ConsolidatedEmp.Get(xemp."No.", CompanyName) then begin
                deleteConsolidatedEmp(xemp, CompanyName);
                insertConsolidatedEmployee(employee, CompanyName);
            end else
                insertConsolidatedEmployee(employee, CompanyName);
        end;
    end;



    [EventSubscriber(ObjectType::Table, Database::Employee, 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertEventEmployeeRecord(var Rec: Record Employee)
    begin
        insertConsolidatedEmployee(Rec, CompanyName);
    end;

    [EventSubscriber(ObjectType::Table, Database::Employee, 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyEventEmployeeRecord(var Rec: Record Employee; var xRec: Record Employee; RunTrigger: Boolean)
    var
        consolidatedEmp: Record "Consolidated Employee";
    begin
        if consolidatedEmp.Get(Rec."No.", CompanyName) then
            ModifyConsolidatedEmployee(consolidatedEmp, Rec, CompanyName)
    end;

    [EventSubscriber(ObjectType::Table, Database::Employee, 'OnAfterRenameEvent', '', false, false)]
    local procedure OnAfterRenameEventEmployeeRecord(var Rec: Record Employee; var xRec: Record Employee; RunTrigger: Boolean)
    begin
        renameConsolidatedEmp(xRec, Rec, CompanyName)
    end;

    [EventSubscriber(ObjectType::Table, Database::Employee, 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterDeleteEventEmployeeRecord(var Rec: Record Employee)
    begin
        deleteConsolidatedEmp(Rec, CompanyName);
    end;

    procedure updateCarClassification(var FixedAsset: Record "Fixed Asset")
    begin
        if FixedAsset."Classify As Vehicle" = false then begin
            FixedAsset."Classify As Vehicle" := true;
            FixedAsset.Modify();
        end
    end;


    // update the fixed asset record classification when Fa subclass changes to vehicle

    [EventSubscriber(ObjectType::Table, Database::"Fixed Asset", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyEventFixedAssetRecord(var Rec: Record "Fixed Asset"; var xRec: Record "Fixed Asset")
    var
        FaClasses: Record "FA Class";
    begin
        FaClasses.SetRange("Use As Vehicle", true);
        FaClasses.FindFirst();
        if xRec."FA Subclass Code" <> Rec."FA Subclass Code" then begin
            if (Rec."FA Subclass Code" = FaClasses.Code) then begin
                updateCarClassification(Rec)
            end
        end else if (Rec."FA Subclass Code" = FaClasses.Code) then begin
            updateCarClassification(Rec)
        end

    end;
}

