tableextension 60613 PostCodeTabExt extends "Post Code"
{
    fields
    {
        modify(County)
        {
            TableRelation = "Address States/County";
        }
    }
}
