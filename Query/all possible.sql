use insurance_comp;


/*
1- Add Cutomer 
-this will be variable data added from user
*/
-- INSERT INTO customer(SSN ,Name,Gender,Mobile_number,State,City,Street,Date_of_birth) values (SSN ,Name,Gender,Mobile_number,State,City,Street,Date_of_birth)

/*
2- Add DEPENDANT 
-this will be variable data added from user
-- A) WE WELL CHECK THE SSN OF CUSTOMER IF EXIST
-- B) ADD THE DEPENDANT   
*/
-- INSERT INTO dependant(SSN ,Customer_ssn,Plan_id,Name,Date_of_birth,Gender) values (SSN ,Customer_ssn,Plan_id,Name,Date_of_birth,Gender)

/*
3- Add Hospital 
-this will be variable data added from user
*/
-- INSERT INTO hospital(ID ,Hospital_name,specialization,rating,state,city,street) values (ID ,Hospital_name,specialization,rating,state,city,street)


/*
4- View Cutomers 
*/
-- select * from Customer

/*
5- View claims 
a) need customer ssn-- variable from user 
b) View its claims 
*/
-- select * from claim
-- where Customer.ssn1 = customer_ssn

/*
6- purchase plan
*/
-- chcek if there is ssn in customer
-- select Purshuse_ssn from insurance_plan
-- where Purshuse_ssn exists  (
-- select ssn as a1 from Customer
-- where ssn = a1)
-- if not can purche a plan
-- INSERT INTO insurance_plan(ID ,Start_date,Type_Of_Beneficiary,number_of_beneficiary,Purshuse_ssn,CBeneficiary,plan_type) values (ID ,Start_date,Type_Of_Beneficiary,number_of_beneficiary,Purshuse_ssn,CBeneficiary,plan_type)
-- -------------------------------------------------------------------------------------------------------------------------
-- adding 
INSERT INTO claim 
values (ID ,receipt_no,ClaimBeneficiary_SSN,Claim_date,resolved,expenses,claim_description,customer_ssn,plan_id,hospital_id );
INSERT INTO customer 
values (SSN ,Name,Gender,Mobile_number,State,City,Street,Date_of_birth);
INSERT INTO dependant 
values (SSN ,Customer_ssn,Plan_id,Name,Date_of_birth,Gender);
INSERT INTO enroll 
values (Hospital_id ,Plan_type);
INSERT INTO hospital 
values (ID ,Hospital_name,specialization,rating,state,city,street);
INSERT INTO insurance_plan 
values (ID ,Start_date,Type_Of_Beneficiary,number_of_beneficiary,Purshuse_ssn,CBeneficiary,plan_type);
INSERT INTO plan_type 
values (type ,Deductible,Co_payment,OutOfPocketMoney,AnnualCoverageLimit);

-- editing 
update claim 
set resolved = ''
where customer id;

update plan_type 
set Deductible = '',Co_payment= ,OutOfPocketMoney= '',AnnualCoverageLimit=''
where type;

-- view
select * from claim
select * from customer
select * from dependant
select * from enroll
select * from hospital
select * from insurance_plan
select * from plan_type

-- joins

-- customer - dependant

select ssn from customer
left join dependant 
on customer.SSN = dependant.Customer_ssn
-- customer - insurance_plan

select ssn from customer
left join
select  insurance_plan from Customer_ssn 

-- hospital - plan type

select ID from hospital
left join
select  Hospital_id from enroll 

-- claim - customer 
select customer_ssn from claim
left join
select SSN from customer 

-- 