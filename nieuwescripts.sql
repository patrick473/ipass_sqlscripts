create table rubriek(
rubrieknummer int not null,
rubrieknaam varchar(40) not null,
inrubriek int ,
primary key (rubrieknummer),
foreign key (inrubriek) references rubriek(rubrieknummer)


);
