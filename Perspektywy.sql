-- PERSPEKTYWA 1-- zarobek w danym miesiacu

with Podsumowanie(wartosci)as
(select sum(poz.ilosc_kupionego_produktu * p.cena_produktu) as "Koszt calego rachunku"
from pozycjarachunku poz, produkty p, rachunek r
where 
poz.rachunek_id_rachunku = r.id_rachunku and poz.produkty_kod_produktu = p.kod_produktu
and
EXTRACT(year from r.data_rachunku) = &Rok
and
extract(month from r.data_rachunku) = &Miesiac -- YY/MM/DD -- 
group by r.id_rachunku, r.data_rachunku
order by "Koszt calego rachunku" desc)

select sum(ps.wartosci) as "Przychod" -- 2001/01
from Podsumowanie ps;


-- PERSPEKTYWA 2-- top 5 klientow

select rownum "Lp","Top 5 Klientów","Wydane Pienieniadze W Jednym Roku"
from
(select imiê_klienta || ' ' || nazwisko_klienta as "Top 5 Klientów", sum(ilosc_kupionego_produktu * cena_produktu) as "Wydane Pienieniadze W Jednym Roku"
from klienci k, produkty p, pozycjarachunku poz, rachunek r
where k.id_klienta = r.klienci_id_klienta and r.id_rachunku = poz.rachunek_id_rachunku and poz.produkty_kod_produktu = p.kod_produktu
and 
extract(year from r.data_rachunku) = &Rok
group by k.imiê_klienta, k.nazwisko_klienta
order by "Wydane Pienieniadze W Jednym Roku" desc)
where rownum <= 5;

-- PERSPEKTYWA 3 -- KATEGORIA, Œredni Wydatek 1 Osoby Z Danej Grupy
with ile_osob(grupa, ile_osob) as 
(select nazwa_grupy as "Kategoria Wiekowa", count(id_klienta) as "Ilosc Osob" -- ile osob liczy kazda grupa wiekowa
from grupa g, klienci k
where 
g.id_grupy = k.grupa_id_grupy
group by g.nazwa_grupy),

wydana_kasa(grupa, wydana_kasa) as 
(select nazwa_grupy, sum(ilosc_kupionego_produktu * cena_produktu) as "Wynik" --grupa/laczna wydana kasa
from grupa g, klienci k, produkty p, pozycjarachunku poz, rachunek r
where g.id_grupy = k.grupa_id_grupy and k.id_klienta = r.klienci_id_klienta and r.id_rachunku = poz.rachunek_id_rachunku and poz.produkty_kod_produktu = p.kod_produktu
group by g.nazwa_grupy)

select i.grupa as "Nazwa Grupy", w.wydana_kasa / i.ile_osob as "Œredni Wydatek 1 Osoby Z Danej Grupy"
from ile_osob i, wydana_kasa w
where i.grupa = w.grupa
order by "Œredni Wydatek 1 Osoby Z Danej Grupy" desc;

-- PERSPEKTYWA 4 --  Jak produkt sprzedawal sie najlepiej w danym roku top 3

select rownum "Lp", "Produkt", "Wynik"
from
(select nazwa_produktu as "Produkt", sum(ilosc_kupionego_produktu * cena_produktu) as "Wynik"
from produkty p, pozycjarachunku poz, rachunek r
where p.kod_produktu = poz.produkty_kod_produktu and poz.rachunek_id_rachunku = r.id_rachunku
and 
extract(year from data_rachunku) = &Rok
group by extract(year from data_rachunku), p.nazwa_produktu
order by "Wynik" desc)
where rownum <=3



 


    
