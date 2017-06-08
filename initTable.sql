create table Gebruiker(
 --columns
	gebruikersId int not null,
	gebruikersnaam varchar(35) not null ,
	voornaam varchar(30) not null,
	achternaam varchar(60) not null,
	adres varchar(60)  not null,
	postcode char(6) not null,
	plaatsnaam varchar(60) not null,
	land varchar(40) not null,
	geboorteDag date not null,
	email varchar(80) not null,
	telefoonNummer numeric(10,0)  not null,
	wachtwoord varchar(50) not null,
	kanVerkopen boolean not null,
	bankNummer char(18),

    primary key (gebruikersId)
 
);




create table rubriek(
rubrieknummer int not null,
rubrieknaam varchar(40) not null,
inrubriek int ,
primary key (rubrieknummer),
foreign key (inrubriek) references rubriek(rubrieknummer)


);


create table Voorwerp(


 --columns
	voorwerpNummer int not null,
	titel varchar(30) not null,
	beschrijving varchar(500)  not null,
	startPrijs money not null,
	BetalingsWijze varchar(40) not null,
	beginTijd timestamp  not null,
	eindtijd timestamp ,
	verzendKosten money,
	verzendInstructie varchar(60),
	verkoper int not null,
	koper int,
	veilingGesloten boolean not null,
	verkoopPrijs money,
	rubriek int not null,
    primary key (voorwerpNummer),

 	foreign key (rubriek) references rubriek (rubriekNummer),
 	foreign key (verkoper) references gebruiker (gebruikersId),
    foreign key (koper) references gebruiker (gebruikersId)
);

create table Bod(
-- columns
	bodId int not null,
    voorwerp int  not null ,
    bodBedrag money  not null ,
    gebruiker int  not null,
    bodTijd timestamp not null,

    primary key(bodId),
   
    foreign key (voorwerp) references voorwerp (voorwerpNummer),
    foreign key (gebruiker) references gebruiker (gebruikersId)
);


create sequence rubriek_sequence;
create sequence voorwerp_sequence;
create sequence bod_sequence;
create sequence gebruiker_sequence;
