

drop table if exists billing_information;
drop table if exists customer;
drop table if exists product;
drop table if exists zip_code;


create table customer
(
	Customer_ID 	integer(10) primary key,
	First_Name		varchar(25) not null,
	Last_Name		varchar(25) not null,
    Street_Address 	varchar(50),
	Zip				integer(11),
    Product_ID		integer(10)
);

create table zip_code
(
	Zip				integer(11) primary key,
    City			varchar(25) not null,
    State			varchar(25) not null
);

create table product
(
	Product_ID		integer(10) primary key,
	Serial_Number	varchar(10) not null,
	Product_Name	varchar(25)
);

create table billing_information
(
	Customer_ID		integer(10) primary key,
	Street_Address	varchar(50) not null,
	Zip				integer(11) not null

);

alter table customer
add foreign key (Zip) references zip_code(Zip),
add foreign key (Product_ID) references product(Product_ID);

alter table billing_information
add foreign key (Customer_ID) references customer(Customer_ID),
add foreign key (Zip) references zip_code(Zip);

set foreign_key_checks=0;

insert into customer (Customer_ID, First_Name, Last_Name, Street_Address, Zip, Product_ID)
values	(1,'Tristin','Damon','779 Homestead Drive Hendersonville', 28792, 1),
		(2,'Whitney','Davis','885 Route 10 Wyandotte',48192, 2),
        (3,'Dyson','Harvie','121 Creekside Drive Waynesboro',17268, 3),
        (4,'Ward','Horatio','902 5th Street South North Bergen',07047, 4),
        (5,'Jem','Stanford','534 Broadway Pawtucket',02860, 5);
        
insert into zip_code(Zip,City,State)
values	(28792, 'Hendersonville', 'NC'),
		(48192, 'Wyandotte', 'MI'),
        (17268, 'Waynesboro', 'PA'),
        (07047, 'North Bergen', 'NJ'),
        (02860, 'Pawtucket', 'RI');
        
insert into product (Product_ID,Serial_Number,Product_Name)
values	(1, 'N9TT-9G0A', 'C&C Red Alert'),
		(2, 'QK6A-JI6S', "C&C Yuri's revenge"),
        (3, 'XNSS-HSJW', 'C&C Red Alert 3'),
        (4, 'NHLE-L6MI', 'C&C Tiberium Sun'),
        (5, '6ETI-UIL2', 'C&C 4');
-- dont ever buy this game, it's terrible also EA is a terrible company

insert into billing_information (Customer_ID, Street_Address, Zip)
values 	(1,'779 Homestead Drive Hendersonville', 28792),
		(2,'885 Route 10 Wyandotte',48192),
        (3,'121 Creekside Drive Waynesboro',17268),
        (4,'902 5th Street South North Bergen',07047),
        (5,'534 Broadway Pawtucket',02860);

set foreign_key_checks=1;		

select * from customer;

select * from zip_code;

select * from product;

select * from billing_information;