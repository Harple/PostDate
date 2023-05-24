pageextension 80150 PostingDateUpdate extends "Sales Order"
{

    trigger OnOpenPage()
    var
        PaymentTerms: Record "Payment Terms";

    begin

        Rec."Posting Date" := Today;
        Rec."Document Date" := Today;
        Rec."Shipment Date" := Today;
        IF PaymentTerms.GET(rec."Payment Terms Code") then Begin
            Rec."Due Date" := CalcDate(PaymentTerms."Due Date Calculation", Today);
            Rec."Pmt. Discount Date" := CalcDate(PaymentTerms."Discount Date Calculation", Today);
        end;
        Update(true);
    end;
}
