report 123456701 "CSD SeminarRegParticipantList" 
{
    UsageCategory=ReportsAndAnalysis;
    Caption='Seminar Reg.-Participant List';
    DefaultLayout=RDLC;
    RDLCLayout='./Layouts/SeminarRegParticipantList.rdl';
  

    dataset
    {
        
        dataitem("CSD Seminar Reg. Header"; "CSD Seminar Reg. Header")
        {
            DataItemTableView=sorting("No.");
            RequestFilterFields="No.","Seminar No.";

            column(No_;"No.")
            {
                includecaption=true;
            }
            column(Seminar_No;"Seminar No.")
            {
                includecaption=true;
            }
            column(Seminar_Name;"Seminar Name")
            {
                includecaption=true;
            } 
            column(Starting_Date;"Starting Date")
            {
                includecaption=true;
            } 
            column(Duration;"Duration")
            {
                includecaption=true;
            } 
            column(Instructor_Name;"Instructor Name")
            {
                includecaption=true;
            } 
            column(Room_Name;"Room Name")
            {
                includecaption=true;
            }
            dataitem(SeminarRegistrationLine; 
                "CSD Seminar Registration Line")
            {
                DataItemTableView=sorting("Document No.","Line No.");
                DataItemLink="Document No."=field("No.");

                column(BillTo_Customer_No;"Bill-to Customer No.")
                {
                    includecaption=true;
                }
                column(Participant_Contact_No_;"Participant Contact No.")
                {

                }
            }      
        }
    }
    
    
    labels
    {
        SeminarRegistrationHeaderCap = 'Seminar Registration List';
    }
    var
        myInt : Integer;
}
