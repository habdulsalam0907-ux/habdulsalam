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
        page "Vendor Product/Service List"=X;
}