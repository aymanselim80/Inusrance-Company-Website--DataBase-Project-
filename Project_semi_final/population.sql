use insurance_comp;
-- Customers table data entry
INSERT INTO customer
VALUES ('20010011111111', 'Adel' ,'elwan', 'Male' , '01198756315', 'Gharbia Governorate', 'El Mahalla El Kubra',  'ElNahas', '1982-5-01');

INSERT INTO customer
VALUES ('20010063333333', 'Mohammed' ,'ahmed', 'Male' , '01173659555', 'Gharbia Governorate', 'Tanta',  'ElBahr', '1985-5-01');

INSERT INTO customer
VALUES ('20010092222222', 'Ayman' ,'mohamed', 'Male' , '01145987651', 'Gharbia Governorate', 'Tanta',  'AliMubark', '2000-5-01');

-- PlanType table data entry
INSERT INTO Plan_type
VALUES ('Basic', 200, 100, 5000, 10000);

INSERT INTO Plan_type
VALUES ('Golden', 50, 25, 2000, 23000);

INSERT INTO Plan_type
VALUES ('Premium', 150, 75, 2500, 15000);

-- Hospital table data entry
INSERT INTO Hospital (Hospital_name, specialization, rating, state, city, street)
VALUES ('IbnCena Hospital', 'Surgery', '3.5', 'Gharbia Governorate', 'Tanta', 'Elhelw');

INSERT INTO Hospital (Hospital_name, specialization, rating, state, city, street)
VALUES ('ElDelta Hospital', 'Physical therapy', '4.5', 'Gharbia Governorate', 'Tanta', 'Elnadi');

INSERT INTO Hospital (Hospital_name, specialization, rating, state, city, street)
VALUES ('Shrouk Hospital', 'Psychiatric treatment', '4.8', 'Gharbia Governorate', 'El Mahalla El Kubra', 'Elfateh');

-- Enroll table data entry
INSERT INTO Enroll
VALUES (1, 'Basic');

INSERT INTO Enroll
VALUES (2, 'Premium');

INSERT INTO Enroll
VALUES (3, 'Golden');

-- Insurance_plan table data entry
INSERT INTO Insurance_plan (Start_date, Type_Of_Beneficiary, number_of_beneficiary, Purchase_ssn, CBeneficiary, plan_type)
VALUES ('2021-10-02', 'both', '2', '20010011111111', '20010011111111', 'Basic');

INSERT INTO Insurance_plan (Start_date, Type_Of_Beneficiary, number_of_beneficiary, Purchase_ssn, CBeneficiary, plan_type)
VALUES ('2021-01-16', 'both', '2', '20010063333333', '20010063333333', 'Golden');

INSERT INTO Insurance_plan (Start_date, Type_Of_Beneficiary, number_of_beneficiary, Purchase_ssn, CBeneficiary, plan_type)
VALUES ('2015-9-02', 'Customer', '1', '20010092222222', '20010092222222', 'Premium');


-- Dependents table data entry
INSERT INTO Dependent
VALUES ('20010025', '20010011111111' , 1 , 'Layla','doughter', '2006-5-01', 'Female');

INSERT INTO Dependent
VALUES ('20010070', '20010063333333' , 2 , 'Mahmoud', 'son','2006-5-01', 'Male');

-- Claim table data entry
INSERT INTO Claim (receipt_no, ClaimBeneficiary_SSN, Claim_date, resolved, expenses, claim_description, customer_ssn, plan_id, hospital_id) 
VALUES ('654', '20010011111111', '2021-11-5', 0, 36, 'Broken leg', '20010011111111',  1, 1);

INSERT INTO Claim (receipt_no, ClaimBeneficiary_SSN, Claim_date, resolved, expenses, claim_description, customer_ssn, plan_id, hospital_id) 
VALUES ('165', '20010092222222', '2021-11-20', 1, 56, 'Treatment after accident', '20010092222222',  3, 2);

INSERT INTO `insurance_comp`.`customer` (`SSN`, `fName`, `lName` ,`Gender`, `Mobile_number`, `State`, `City`, `Street`, `Date_of_birth`) VALUES ('11111111111110', 'AAAA','AAAA', 'Male', '00000000000', 'AA', 'A', '0', '0000-00-00');
INSERT INTO `insurance_comp`.`customer` (`SSN`, `fName`, `lName` ,`Gender`, `Mobile_number`, `State`, `City`, `Street`, `Date_of_birth`) VALUES ('11111111111111', 'BBBB', 'AAAA','Male', '00000000001', 'BB', 'B', '1', '0000-00-01');
INSERT INTO `insurance_comp`.`customer` (`SSN`, `fName`, `lName` ,`Gender`, `Mobile_number`, `State`, `City`, `Street`, `Date_of_birth`) VALUES ('11111111111112', 'CCCC', 'AAAA','Male', '00000000002', 'CC', 'C', '2', '0000-00-02');
INSERT INTO `insurance_comp`.`customer` (`SSN`, `fName`, `lName` ,`Gender`, `Mobile_number`, `State`, `City`, `Street`, `Date_of_birth`) VALUES ('11111111111113', 'DDDD', 'AAAA','Male', '00000000003', 'DD', 'D', '3', '0000-00-03');
INSERT INTO `insurance_comp`.`customer` (`SSN`, `fName`, `lName` ,`Gender`, `Mobile_number`, `State`, `City`, `Street`, `Date_of_birth`) VALUES ('11111111111114', 'EEEE','AAAA', 'Male', '00000000004', 'EE', 'E', '4', '0000-00-04');
INSERT INTO `insurance_comp`.`customer` (`SSN`, `fName`, `lName` ,`Gender`, `Mobile_number`, `State`, `City`, `Street`, `Date_of_birth`) VALUES ('11111111111115', 'FFFF', 'AAAA','Male', '00000000005', 'FF', 'F', '5', '0000-00-05');
INSERT INTO `insurance_comp`.`customer` (`SSN`, `fName`, `lName` ,`Gender`, `Mobile_number`, `State`, `City`, `Street`, `Date_of_birth`) VALUES ('11111111111116', 'GGGG', 'AAAA','Male', '00000000006', 'GG', 'G', '6', '0000-00-06');
INSERT INTO `insurance_comp`.`customer` (`SSN`, `fName`, `lName` ,`Gender`, `Mobile_number`, `State`, `City`, `Street`, `Date_of_birth`) VALUES ('11111111111117', 'HHHH', 'AAAA','Male', '00000000007', 'HH', 'H', '7', '0000-00-07');
INSERT INTO `insurance_comp`.`customer` (`SSN`, `fName`, `lName` ,`Gender`, `Mobile_number`, `State`, `City`, `Street`, `Date_of_birth`) VALUES ('11111111111118', 'IIII', 'AAAA','Male', '00000000008', 'II', 'I', '8', '0000-00-08');
INSERT INTO `insurance_comp`.`customer` (`SSN`, `fName`, `lName` , `Gender`, `Mobile_number`, `State`, `City`, `Street`, `Date_of_birth`) VALUES ('11111111111119', 'JJJJ', 'HHHH', 'Male', '00000000009', 'JJ', 'J', '9', '0000-00-09');

INSERT INTO `insurance_comp`.`insurance_plan` ( `Start_date`, `Type_Of_Beneficiary`, `number_of_beneficiary`, `Purchase_ssn`, `CBeneficiary`, `plan_type`) VALUES ( '0000-00-00', 'Customer', '1', '11111111111110', '11111111111110', 'Basic');
INSERT INTO `insurance_comp`.`insurance_plan` ( `Start_date`, `Type_Of_Beneficiary`, `number_of_beneficiary`, `Purchase_ssn`, `CBeneficiary`, `plan_type`) VALUES ( '0000-00-01', 'Customer', '1', '11111111111111', '11111111111111', 'Basic');
INSERT INTO `insurance_comp`.`insurance_plan` ( `Start_date`, `Type_Of_Beneficiary`, `number_of_beneficiary`, `Purchase_ssn`, `CBeneficiary`, `plan_type`) VALUES ( '0000-00-02', 'Customer', '1', '11111111111112', '11111111111112', 'Basic');
INSERT INTO `insurance_comp`.`insurance_plan` ( `Start_date`, `Type_Of_Beneficiary`, `number_of_beneficiary`, `Purchase_ssn`, `CBeneficiary`, `plan_type`) VALUES ( '0000-00-03', 'Customer', '1', '11111111111113', '11111111111113', 'Premium');
INSERT INTO `insurance_comp`.`insurance_plan` ( `Start_date`, `Type_Of_Beneficiary`, `number_of_beneficiary`, `Purchase_ssn`, `CBeneficiary`, `plan_type`) VALUES ( '0000-00-04', 'Customer', '1', '11111111111114', '11111111111114', 'Premium');
INSERT INTO `insurance_comp`.`insurance_plan` ( `Start_date`, `Type_Of_Beneficiary`, `number_of_beneficiary`, `Purchase_ssn`, `CBeneficiary`, `plan_type`) VALUES ( '0000-00-05', 'Customer', '1', '11111111111115', '11111111111115', 'Premium');
INSERT INTO `insurance_comp`.`insurance_plan` ( `Start_date`, `Type_Of_Beneficiary`, `number_of_beneficiary`, `Purchase_ssn`, `CBeneficiary`, `plan_type`) VALUES ( '0000-00-06', 'Customer', '1', '11111111111116', '11111111111116', 'Premium');
INSERT INTO `insurance_comp`.`insurance_plan` ( `Start_date`, `Type_Of_Beneficiary`, `number_of_beneficiary`, `Purchase_ssn`, `CBeneficiary`, `plan_type`) VALUES ( '0000-00-07', 'Customer', '1', '11111111111117', '11111111111117', 'Golden');
INSERT INTO `insurance_comp`.`insurance_plan` ( `Start_date`, `Type_Of_Beneficiary`, `number_of_beneficiary`, `Purchase_ssn`, `CBeneficiary`, `plan_type`) VALUES ( '0000-00-08', 'Customer', '1', '11111111111118', '11111111111118', 'Golden');


INSERT INTO `insurance_comp`.`hospital` ( `Hospital_name`, `specialization`, `rating`, `state`, `city`, `street`) VALUES ( 'BBBBB', 'bbbbbb', '1', 'efg', 'sfgsf', 'asfddsf');
INSERT INTO `insurance_comp`.`hospital` ( `Hospital_name`, `specialization`, `rating`, `state`, `city`, `street`) VALUES ( 'CCCC', 'ccccccc', '2', 'hij', 'dfsdf', 'gtrt');
INSERT INTO `insurance_comp`.`hospital` (`Hospital_name`, `specialization`, `rating`, `state`, `city`, `street`) VALUES ( 'DDDDD', 'ddddd', '3', 'klm', 'llsdfg', 'adfgdaf');
INSERT INTO `insurance_comp`.`hospital` (`Hospital_name`, `specialization`, `rating`, `state`, `city`, `street`) VALUES ( 'EEEEEE', 'eeeeeeeeee', '4', 'nop', 'sfgs', 'argr');
INSERT INTO `insurance_comp`.`hospital` ( `Hospital_name`, `specialization`, `rating`, `state`, `city`, `street`) VALUES ( 'FFFFF', 'ffffff', '5', 'qrs', 'wgwr', 'efvea');
INSERT INTO `insurance_comp`.`hospital` ( `Hospital_name`, `specialization`, `rating`, `state`, `city`, `street`) VALUES ( 'GGGGGGGG', 'gggggg', '0', 'tuv', 'svda', 'erear');
INSERT INTO `insurance_comp`.`hospital` (`Hospital_name`, `specialization`, `rating`, `state`, `city`, `street`) VALUES ( 'HHHHHHH', 'hhhhhhh', '1', 'wxy', 'wRGF', 'earer');
INSERT INTO `insurance_comp`.`hospital` ( `Hospital_name`, `specialization`, `rating`, `state`, `city`, `street`) VALUES ( 'IIIIII', 'iiiiiiii', '2', 'zab', 'ASFV', 'eabadf');
INSERT INTO `insurance_comp`.`hospital` ( `Hospital_name`, `specialization`, `rating`, `state`, `city`, `street`) VALUES ( 'JJJJJ', 'jjjjj', '3', 'cde', 'sdfsd', 'radfrg');


INSERT INTO `insurance_comp`.`claim` (`ID`, `receipt_no`, `ClaimBeneficiary_SSN`, `Claim_date`, `resolved`, `expenses`, `claim_description`, `customer_ssn`, `plan_id`, `hospital_id`) VALUES ('3', '00000000000003', '11111111111113', '0000-00-03', '0', '113', 'DDDDDD', '11111111111113', '4', '3');
INSERT INTO `insurance_comp`.`claim` (`ID`, `receipt_no`, `ClaimBeneficiary_SSN`, `Claim_date`, `resolved`, `expenses`, `claim_description`, `customer_ssn`, `plan_id`, `hospital_id`) VALUES ('4', '00000000000004', '11111111111114', '0000-00-04', '0', '114', 'EEEEEE', '11111111111114', '5', '4');
INSERT INTO `insurance_comp`.`claim` (`ID`, `receipt_no`, `ClaimBeneficiary_SSN`, `Claim_date`, `resolved`, `expenses`, `claim_description`, `customer_ssn`, `plan_id`, `hospital_id`) VALUES ('5', '00000000000005', '11111111111115', '0000-00-05', '1', '115', 'FFFFFFFFF', '11111111111115', '6', '5');
INSERT INTO `insurance_comp`.`claim` (`ID`, `receipt_no`, `ClaimBeneficiary_SSN`, `Claim_date`, `resolved`, `expenses`, `claim_description`, `customer_ssn`, `plan_id`, `hospital_id`) VALUES ('6', '00000000000006', '11111111111116', '0000-00-06', '1', '116', 'GGGGGGGG', '11111111111116', '7', '6');
INSERT INTO `insurance_comp`.`claim` (`ID`, `receipt_no`, `ClaimBeneficiary_SSN`, `Claim_date`, `resolved`, `expenses`, `claim_description`, `customer_ssn`, `plan_id`, `hospital_id`) VALUES ('7', '00000000000007', '11111111111117', '0000-00-07', '1', '117', 'HHHHHHH', '11111111111117', '8', '7');
INSERT INTO `insurance_comp`.`claim` (`ID`, `receipt_no`, `ClaimBeneficiary_SSN`, `Claim_date`, `resolved`, `expenses`, `claim_description`, `customer_ssn`, `plan_id`, `hospital_id`) VALUES ('8', '00000000000008', '11111111111118', '0000-00-08', '1', '118', 'IIIIIIII', '11111111111118', '9', '8');
INSERT INTO `insurance_comp`.`claim` (`ID`, `receipt_no`, `ClaimBeneficiary_SSN`, `Claim_date`, `resolved`, `expenses`, `claim_description`, `customer_ssn`, `plan_id`, `hospital_id`) VALUES ('9', '00000000000009', '11111111111119', '0000-00-09', '1', '119', 'JJJJJJ', '11111111111119', '10', '9');


INSERT INTO `insurance_comp`.`enroll` (`Hospital_id`, `Plan_type`) VALUES ('4', 'Premium');
INSERT INTO `insurance_comp`.`enroll` (`Hospital_id`, `Plan_type`) VALUES ('5', 'Premium');
INSERT INTO `insurance_comp`.`enroll` (`Hospital_id`, `Plan_type`) VALUES ('6', 'Premium');
INSERT INTO `insurance_comp`.`enroll` (`Hospital_id`, `Plan_type`) VALUES ('7', 'Golden');
INSERT INTO `insurance_comp`.`enroll` (`Hospital_id`, `Plan_type`) VALUES ('8', 'Golden');
INSERT INTO `insurance_comp`.`enroll` (`Hospital_id`, `Plan_type`) VALUES ('9', 'Golden');
