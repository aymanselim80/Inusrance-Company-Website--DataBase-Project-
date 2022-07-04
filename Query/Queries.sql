use insurance_comp;
 
-- adding

INSERT INTO customer 
values (SSN ,Name,Gender,Mobile_number,State,City,Street,Date_of_birth);

INSERT INTO dependant 
values (SSN ,Customer_ssn,Plan_id,Name,Date_of_birth,Gender);

INSERT INTO hospital 
values (ID ,Hospital_name,specialization,rating,state,city,street);

-- view customers
select * from customer

-- view claim and check if it right
select id,ClaimBeneficiary_SSN,Claim_date,customer_ssn from claim
where customer_ssn = ' entered ssn from user ' and resolved = 'yes or no from user'
/*a) check about claimbeneficiary ssn if it 
										- == customer ssn so go to customer table
                                        - else go to dependant table */
select name from customer
where ssn = ClaimBeneficiary_SSN

select name from dependent
where ssn = ClaimBeneficiary_SSN

select * from cliam 
where id = 'id of choosen claim'

/*a) check about claimbeneficiary ssn if it 
										- == customer ssn so go to customer table
                                        - else go to dependant table */
select name from customer
where ssn = ClaimBeneficiary_SSN

select name from dependent
where ssn = ClaimBeneficiary_SSN

-- mark as resolved 
update claim 
set resolved = 'yes'
where id = 'id of choosen claim';

-- purches of plan 

-- ask for ssn 
select * from customer
where ssn = 'entered ssn'

-- if yes 
select CBeneficiary from insurance_plan
where Purshuse_ssn = 'entered ssn'

-- check dependent
select ssn from dependant,insurance_plan 
where 'entered ssn' = insurance_plan.Purshuse_ssn and insurance_plan.id = dependant.plan_id

-- return all dependant
select ssn from dependant
where Customer_ssn = 'entered ssn'

-- getting to database
INSERT INTO insurance_plan (Start_date,Type_Of_Beneficiary,number_of_beneficiary,Purshuse_ssn,CBeneficiary,plan_type);
values (CURDATE(),Type_Of_Beneficiary,number_of_beneficiary,Purshuse_ssn,CBeneficiary,plan_type);
 
-- if no -- go to add cutomer page

-- view hospitals 
select * from customer
where ssn = 'entered ssn'

select * from insurance_plan
where Purshuse_ssn = 'entered ssn'

-- for each plan
-- return customer name if he is beneficary 
select name from customer
where SSN  = 'entered ssn'

-- return dependent name 
select name from dependent
where plan.id = 'entered plan'

-- view hospital 
select Hospital_id from enroll,insurance_plan
where insurance_plan.id = 'choosen from useer' and insurance_plan.plan_type = enroll.Plan_type

-- list of hospitals
select * from hospital
where id = 'returned hospitals id'

-- file claim 
select * from customer
where ssn = 'entered ssn'

select * from insurance_plan
where Purshuse_ssn = 'entered ssn'

-- for each plan
-- return customer name if he is beneficary 
select name from customer
where SSN  = 'entered ssn'

-- return dependent name 
select name from dependent
where plan.id = 'entered plan'

insert into claim (receipt_no,ClaimBeneficiary_SSN,Claim_date,resolved,expenses,claim_description,customer_ssn,plan_id,hospital_id )
values ('','',CURDATE(),'False','','','saved','saved','');
