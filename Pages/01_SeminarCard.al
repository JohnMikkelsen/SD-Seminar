page 123456701 "CSD Seminar Card"
{
    PageType = Card;
    SourceTable = "CSD Seminar";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                    trigger OnAssistEdit();
                    begin
                      if AssistEdit then currpage.update;    
                    end;
                }
                field(Name;Name)
                {

                }
                field("Search Name";"Search Name")
                {

                }
                field("Seminar Duration";"Seminar Duration")
                {

                }
                field("Minimum Participants";"Minimum Participants")
                {

                } 
                field("Maximum Participants";"Maximum Participants")
                {

                }
                field(Blocked;Blocked)
                {

                }
                field("Last Date Modified";"Last Date Modified")
                {

                }

            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {

                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {

                }
                field("Seminar Price";"Seminar Price")
                {

                }
            }
        }
        area(FactBoxes)
        {
            systempart("Links"; Links)
            {

            }
            systempart("Notes"; Notes)
            {

            }
        }   
    }

    actions
    {
        area(Navigation)
        {
            group("S&eminar")
            {
                action("Co&mments")
                {
                    //RunObject=page CSD
                }
            }
        }
    }

    var
        myInt : Integer;
}