drop database if exists insurance_comp;
create database Insurance_comp;
use Insurance_comp;
create table customer (
SSN char(14),
fname varchar(15) not null,
lname varchar(15) not null,
Gender varchar(6)
	check (gender in ('Male','Female')),
Mobile_number char(11),
State varchar(20),
City varchar(20),
Street varchar(20),
Date_of_birth date,
primary key (SSN)
);
create table Dependent(
SSN char(14),
Customer_ssn char(14) not null,
Plan_id int,
Name varchar(20) not null,
relationship varchar(25),
Date_of_birth date,
Gender varchar(6)
	check (gender in ('Male','Female')),
primary key (SSN),
foreign key (Customer_ssn) references Customer(SSN) on delete cascade
);
create table Plan_type(
type varchar(15)
	check (type in ('Basic','Premium','Golden')),
Deductible decimal,
Co_payment decimal,
OutOfPocketMoney decimal,
AnnualCoverageLimit decimal,
primary key (type)
);
create table Hospital(
ID int auto_increment,
Hospital_name varchar(40) not null,
specialization varchar(40),
rating float(1) check (rating < 6), -- rating between 0 to 5 
state varchar(20) not null,
city varchar(20) not null,
street varchar(20) not null,
primary key (Id),
constraint unique (Hospital_name,state,city,street)
);
-- wanted to make (Hospital_name,state,city,street)‏ unique but we failed
create table Enroll(
Hospital_id int not null,
Plan_type varchar(15)
	check (Plan_type in ('Basic','Premium','Golden')) not null,
primary key (hospital_id, plan_type),
foreign key (hospital_id) references Hospital(Id) on delete cascade,
foreign key (plan_type) references plan_type(type) on delete cascade
);
create table Insurance_plan(
ID int auto_increment,
Start_date date,
Type_Of_Beneficiary varchar(20)
	check (Type_Of_Beneficiary in ('Customer','Dependent','Both')),
number_of_beneficiary char(1),		#we dont allow more than 9 beneficaiary in one plan
Purchase_ssn char(14) not null,
CBeneficiary char(14) unique,
plan_type varchar(15)
	check (Plan_type in ('Basic','Premium','Golden')) not null,
primary key (Id),
foreign key (Purchase_ssn) references customer(SSN) on delete cascade,
foreign key (cbeneficiary) references customer(SSN),
foreign key (plan_type) references plan_type(type) on delete cascade
);
create table Claim(
ID int auto_increment,
receipt_no varchar(14) not null,
ClaimBeneficiary_SSN varchar(14) not null,
Claim_date date,
resolved bool,
expenses decimal not null,
claim_description text,
customer_ssn char(14),
plan_id int,
hospital_id int not null,
primary key (Id),
foreign key (customer_ssn) references customer(ssn) on delete set null,
foreign key (plan_id) references Insurance_plan(id) on delete set null,
foreign key (hospital_id) references hospital(id)
);

alter table dependent add foreign key (plan_id) references Insurance_plan(id) on delete set null;