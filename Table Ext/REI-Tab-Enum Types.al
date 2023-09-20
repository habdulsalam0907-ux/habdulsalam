enum 60600 CustTypeEnum
{
    Extensible = true;

    value(0; " ") {}
    value(1; Local) {}
    value(2; Foreign) {}
}

enum 60606 CustStatusEnum
{
    Extensible = true;

    value(0; " ") {}
    value(1; Active) {}
    value(2; Inactive) {}
}

enum 60602 BillingCycleEnum
{
    Extensible = true;

    value(0; " ") {}
    value(1; Annually) {}
    value(2; Quarterly) {}
    value(3; Monthly) {}
    value(4; "Monthly/Anually") {}
    value(5; "N/A") {}
}


//System Type Enum

enum 60603 SystemTypeEnum
{
    Extensible = true;

    value(0; " ") {}
    value(1; Lease) {}
    value(2; "Outright sale with Maintenance") {}
    value(3; "Lease/outright sale") {}
    value(4; "PAAS") {}
    value(5; "SAAS") {}
    value(6; "Outright sale") {}
    value(7; "Lease to Own") {}
    value(8; "Lease/outright sale with maintenance") {}
}

enum 60601 VendorStatusEnum
{
    Extensible = true;

    value(0; " ") {}
    value(1; Active) {}
    value(2; Inactive) {}
}

enum 60604 VendorTypeEnum
{
    Extensible = true;

    value(0; " ") {}
    value(1; Local) {}
    value(2; Foreign) {}
}