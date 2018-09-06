table 123456701 "CSD Seminar"
{
    Caption='Seminar';
    
    fields
    {
        field(10;"No.";Code[20])
        {
            Caption='No.';
            trigger OnValidate();
            begin
                if "No." <> xrec."No." then begin
                    SeminarSetup.Get;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;        
            end;
        }
        field(20;Name;Text[50])
        {
            Caption='Name';
            trigger OnValidate();
            begin
                if ("Search Name"=UpperCase(xRec.Name)) or
                    ("Search Name"='') then
                    "Search Name":=Name;        
            end;
        }
        field(30;"Seminar Duration";Decimal)
        {
            Caption='Seminar Duration';
            DecimalPlaces=0:1;
        }
        field(40;"Minimum Participants";Integer)
        {
            Caption='Minimum Participants';
        }
        field(50;"Maximum Participants";Integer)
        {
            Caption='Maximum Participants';
        }
        field(60;"Search Name";Text[50])
        {
            Caption='Search Name';
        }
        field(70;Blocked;Boolean)
        {
            Caption='Blocked';
        }
        field(80;"Last Date Modified";Date)
        {
            Caption='Last Date Modified';
            Editable=false;
        }
        field(90;Comment;Boolean)
        {
            Caption='Comment';
            Editable=False;
            //fieldclass=FlowField;
            //CalcFormulaExist("Seminar Comment Line " 
            //where("Table Name"=const("Seminar"),
            //"No."=Field("No.")));
        }
        field(100;"Seminar Price";Decimal)
        {
            Caption='Seminar Price';
            AutoFormatType=1;
        }
        field(110;"Gen. Prod. Posting Group";code[10])
        {
            Caption='Gen. Prod. Posting Group';
            TableRelation="Gen. Product Posting Group";
            trigger OnValidate();
            begin
                if xrec."Gen. Prod. Posting Group"<>"Gen. Prod. Posting Group" then begin
                    if GenProdPostngGroup.ValidateVatProdPostingGroup
                    (GenProdPostngGroup,"Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group",
                        GenProdPostngGroup."Def. VAT Prod. Posting Group"); 
                end;
            end;
        }
        field(120;"VAT Prod. Posting Group";Code[10])
        {
            Caption='VAT Prod. Posting Group';
            TableRelation="VAT Product Posting Group";
        }
        field(130;"No. Series";Code[10])
        {
            Editable=false;
            Caption='No. Series';
            TableRelation="No. Series";
        }
    }

    keys
    {
        key(PK;"No.")
        {
            Clustered = true;
        }
        key(Key1;"Search Name")
        {

        }
    }
    
    var
        SeminarSetup:Record "CSD Seminar Setup";
        //CommentLine : Record "CSD Seminar Comment Line";
        Seminar:Record "CSD Seminar";
        GenProdPostngGroup:Record"Gen. Product Posting Group";
        NoSeriesMgt:Codeunit NoSeriesManagement;
     
    trigger OnInsert();
    begin
        if "No."='' then begin
          SeminarSetup.GET;
          SeminarSetup.TestField("Seminar Nos.");
          NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.",
            xrec."No. Series",0D,"No.","No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified":=Today;
    end;

    trigger OnDelete();
    begin
        //CommentLine.reset
        //commentline.Setrange("Table Name", CommentLine."TableName"::Seminar);
        //CommentLine.Setrange("No.", "No.");
        //CommentLine.Deleteall;
    end;

    trigger OnRename();
    begin
        "Last Date Modified":=Today;
    end;
procedure AssistEdit():Boolean;
begin
    with Seminar do begin
      Seminar := Rec;
      SeminarSetup.Get;
      SeminarSetup.TestField("Seminar Nos.");
      if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.",
        xRec."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            Rec:=Seminar;
            exit(true);
        end;
    end;  
    
end;
}