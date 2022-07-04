from __main__ import app,request,render_template,db

@app.route('/purchaseplan', methods=['GET','POST'])
def purchaseplan():
    return render_template('purchaseplan.html')

@app.route('/purchaseplanform', methods=['GET','post'])
def purchaseplanform():
    data = request.form
    SSN = data['SSN']
    # check if the customer exists or not 
    customer = db(f"Select SSN,concat(fname,' ',lname) from customer where SSN = '{SSN}';")
    if not customer :
        return render_template('purchaseplan.html', data='Wrong SSN Enter SSN again')
    else:
        # check if customer is beneficiary
        CBEN = db(f"select CBeneficiary from insurance_plan where purchase_ssn = '{SSN}'; ")
        ben_name = []   # names of beneficiaries
        ben_ssn = []    # ssn of beneficiaries
        cus_have = 0    # check for the customer

        # check for all the possible beneficairies for new plans including the customer
        for i in range(len(CBEN)):
            if CBEN[i][0] == SSN:
                cus_have = 1
                break
        if cus_have == 0 :
            ben_name.append(customer[0][1])
            ben_ssn.append(customer[0][0])

        # Select all dependet without plan
        all_dep = db(f"select T.ssn , T.name from dependent as T where Customer_ssn = '{SSN}' and T.ssn not in (select Y.ssn from dependent as Y,insurance_plan where '{SSN}' = insurance_plan.purchase_ssn and insurance_plan.id = Y.plan_id);")
        if all_dep:
            for dep in all_dep:
                ben_name.append(dep[1])
                ben_ssn.append(dep[0])

        # dep_w_p = db(f"select ssn,name from dependent,insurance_plan where '{SSN}' = insurance_plan.purchase_ssn and insurance_plan.id = dependent.plan_id ;")
        # all_dep = db(f"select ssn,name from dependent where Customer_ssn = '{SSN}';")
        # if all_dep:
        #     for dep in all_dep:
        #         if dep not in dep_w_p:
        #             ben_name.append(dep[1])
        #             ben_ssn.append(dep[0])


        if len(ben_name) == 0 :
            return render_template('purchaseplan.html', data='NO more plans for you')
        plans = db(f"select * from plan_type;")
        return render_template('purchaseplanform.html',  ben_name = ben_name ,ben_ssn = ben_ssn , customer_ssn = SSN,plans=plans)


# Used for saving the data and make the tabel to view
@app.route('/thanksforpurchasing', methods=['GET','POST'])
def thanks():
    ben_name = request.form.getlist('ben_name')
    ben_ssn = request.form.getlist('ben_ssn')
    customer_ssn = request.form.get('customer_ssn')
    type = request.form.get('type')
    beneficiary = request.form.getlist('beneficiary')
    if not beneficiary :
        return render_template('purchaseplanform.html',  ben_name = ben_name ,ben_ssn = ben_ssn , wrong='wrong' , data = 'you must choose a beneficiary')
    number_ben = len(beneficiary)
    customer_in = 0
    type_ben = 'Both'
    for ben in beneficiary :
        if ben == customer_ssn :
            customer_in = 1
    if customer_in == 0:
        type_ben = 'Dependent'
    if number_ben == 1 & customer_in == 1:
        type_ben = 'Customer'
    print(type_ben,number_ben,customer_ssn,type)
    if customer_in == 1 :
        db(f"INSERT INTO insurance_plan(Start_date, Type_Of_Beneficiary, number_of_beneficiary, purchase_ssn, CBeneficiary, plan_type) values(CURDATE(), '{type_ben}', '{number_ben}', '{customer_ssn}','{customer_ssn}', '{type}');")
    else :
        db(f"INSERT INTO insurance_plan(Start_date, Type_Of_Beneficiary, number_of_beneficiary, purchase_ssn, plan_type) values(CURDATE(), '{type_ben}', '{number_ben}', '{customer_ssn}', '{type}');")

    # Getting the plan id to store them in related dependents
        # plan_id returns the last purchased plan by this customer
    plan_ID = db(f"select max(ID) from Insurance_plan where purchase_ssn = '{customer_ssn}';")
    for ben in beneficiary :
        if ben != customer_ssn :
            # update dependent table by adding the plan_id 
            db(f"UPDATE dependent SET plan_id = {plan_ID[0][0]} where SSN = '{ben}';")
    plan_info = db(f"Select * from Insurance_plan where ID ={plan_ID[0][0]};")
    ben_info = db(f"Select SSN,name from Dependent where plan_id ={plan_ID[0][0]};")
    if plan_info[0][5] == plan_info[0][4]:
        cus_info = db(f"Select SSN,concat(fname,' ',lname) from customer where SSN ={plan_info[0][4]};")
        ben_info.append(cus_info[0])
    leng = len(ben_info)
    return render_template('thanks_for_purchasing.html', plan=plan_info, ben_info=ben_info, len=leng)
