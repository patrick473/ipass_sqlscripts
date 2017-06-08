create table Gebruiker(
 --columns
	gebruikersId number(10,0) constraint G_ID_NN not null,
	gebruikersnaam varchar2(24) constraint G_gebruikersnaam_NN not null ,
	voornaam varchar2(24) constraint G_voornaam_NN not null,
	tussenvoegsel varchar2(11) constraint G_tussenVoegsel_NN not null,
	achternaam varchar2(30) constraint G_achternaam_NN not null,
	adres varchar2(40) constraint G_adres_NN not null,
	postcode char(6) constraint G_postcode_NN not null,
	plaatsnaam varchar2(40) constraint G_plaatsnaam_NN not null,
	land varchar2(30) constraint G_Land_NN not null,
	geboorteDag date constraint G_date_NN not null,
	email varchar2(60) constraint G_email_NN not null,
	telefoonNummer number(10,0) constraint G_telefoonNummer_NN not null,
	wachtwoord varchar2(50) constraint G_wachtwoord_NN not null,
	kanVerkopen number(1,0) constraint G_verkoop_NN not null,
	bankNummer char(18),


 -- constraints

 -- checks
	constraint G_kanVerkoopBool_CK check (kanVerkopen = 1 or kanVerkopen = 0),
 -- primary key
	constraint G_gebruikersnaam_PK primary key (gebruikersId)
 -- foreign key
);




create table Rubriek(

 --columns
 	rubriekNummer number(3,0) constraint R_rubriekNummer_NN not null,
	rubriekNaam varchar2(40) constraint R_rubriekNaam_NN not null,
	inRubriek number(3,0),

 -- constraints

 -- checks

 -- primary key
	constraint R_rubriekNummer_PK primary key (rubriekNummer),
 -- foreign key
 	constraint R_inRubriek_FK foreign key (inRubriek)
	references Rubriek (rubriekNummer)
);

create table Voorwerp(


 --columns
	voorwerpNummer number(10,0) constraint VW_voorwerpNummer_NN not null,
	titel varchar2(30) constraint VW_titel_NN not null,
	beschrijving varchar2(200) constraint VW_beschrijving_NN not null,
	startPrijs number(*,2) constraint VW_startPrijs_NN not null,
	BetalingsWijze varchar2(20) constraint VW_betalingsWijze_NN not null,
	beginTijd timestamp constraint VW_beginTijd_NN not null,
	eindtijd timestamp constraint VW_eindTijd_NN not null,
	verzendKosten number(*,0),
	verzendInstructie varchar2(40),
	verkoper number(10,0) constraint VW_verkoper_NN not null,
	koper number(10,0),
	veilingGesloten number(1,0) constraint VW_veilingGesloten_NN not null,
	verkoopPrijs number(*,0),
	rubriek number(3,0),


 -- constraints

 -- checks

	constraint VW_veilingGeslotenBool_CK check (veilingGesloten = 0 or veilingGesloten = 1),
 -- primary key
	constraint VW_voorwerpNummer_PK primary key (voorwerpNummer),

 -- foreign key
 	constraint VW_rubriek_FK foreign key (rubriek)
	references rubriek (rubriekNummer),
 	constraint VW_verkoper_FK foreign key (verkoper)
	references gebruiker (gebruikersId),
	constraint VW_koper_FK foreign key (koper)
	references gebruiker (gebruikersId)
);

create table Bod(
-- columns
	bodId number(10,0) constraint B_ID_NN not null,
    voorwerp number(10,0) constraint B_voorwerp_NN not null ,
    bodBedrag number(*,2) constraint B_bodBedrag_NN not null ,
    gebruiker number(10,0) constraint B_gebruiker_NN not null,
    bodTijd timestamp constraint B_bodTijd_NN not null,


    -- constraints

    --checks

    --primary key

    constraint M_voorwerp_bodBedrag_PK primary key(bodId),
    -- foreign keys

    constraint B_voorwerp_FK  foreign key (voorwerp)
    references voorwerp (voorwerpNummer),
    constraint B_gebruiker_FK foreign key (gebruiker)
    references gebruiker (gebruikersId)
);
create sequence Voorwerp_Sequence
	minvalue 1
	maxvalue 9999999999
	start with 1
	increment by 1;

create sequence Gebruiker_Sequence
minvalue 1
	maxvalue 9999999999
	start with 1
	increment by 1;

create sequence Bod_Sequence
	minvalue 1
	maxvalue 9999999999
	start with 1
	increment by 1;

create sequence Rubriek_Sequence
	minvalue 1
	maxvalue 999
	start with 1
	increment by 1;
