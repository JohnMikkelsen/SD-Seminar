page 123456740 "CSD Seminar Manager Activities"
{
    PageType = CardPart;
    SourceTable = "CSD Seminar Cue";
    Caption='Seminar Manager Activities';
    Editable=false;
    

    layout
    {
        area(content)
        {
            group(GroupName)
            {
                field(Name;NameSource)
                {
                    
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
    
    var
        myInt : Integer;
}