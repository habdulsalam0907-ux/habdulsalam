permissionset 60600 MasterDataCust
{
    Caption = 'Master Data Customization';
    Assignable = true;
    Permissions = tabledata "Product/Services"=RIMD,
        tabledata "Project Site Code Tracker"=RIMD,
        tabledata "State of Project Location"=RIMD,
        tabledata "Vendor Prod/Services Category"=RIMD,
        table "Product/Services"=X,
        table "Project Site Code Tracker"=X,
        table "State of Project Location"=X,
        table "Vendor Prod/Services Category"=X,
        page "Product/Service List"=X,
        page "Project Site Code Tracker"=X,
        page "State of Project Location"=X,
        page "Vendor Product/Service List"=X,
        tabledata "Employee Referees/Guarantor"=RIMD,
        tabledata "Employee Role History"=RIMD,
        tabledata "Leased Asset Class"=RIMD,
        tabledata "Leased Asset Composition"=RIMD,
        table "Employee Referees/Guarantor"=X,
        table "Employee Role History"=X,
        table "Leased Asset Class"=X,
        table "Leased Asset Composition"=X,
        page "Employee Referees/Guarantors"=X,
        page "Employee Role History"=X,
        page "Employee Role History FactBox"=X,
        page "Leased Asset Classes"=X,
        page "Leased Asset Composition Line"=X,
        page "MainAsset Components"=X;
}