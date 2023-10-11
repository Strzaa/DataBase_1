select imiê_klienta, nazwisko_klienta, grupa_id_grupy, limitkredytowy_klienta
from klienci, grupa
where grupa.id_grupy = klienci.grupa_id_grupy
and 
klienci.limitkredytowy_klienta >= 1500
order by grupa.id_grupy;

select imiê_klienta, nazwisko_klienta, id_rachunku, poz.ilosc_kupionego_produktu, p.cena_produktu, ilosc_kupionego_produktu * cena_produktu as Wydane_Pieniadze
from klienci k, pozycjarachunku poz, produkty p, rachunek r
where k.id_klienta = r.klienci_id_klienta 
and poz.produkty_kod_produktu = p.kod_produktu 
and poz.rachunek_id_rachunku = r.id_rachunku
order by k.imiê_klienta;

