from __main__ import app,render_template,db,request,redirect

# choose how the customer want to file the claim
@app.route("/howclaim")
def howclaim():
    return render_template("howclaim.html")

# if the customer chooses ssn
@app.route("/filewithssn" , methods=['post','get'])
def file_with_SSN():
    return render_template("filewithssn.html")

# choose one of the purchased plans by this customer 
@app.route("/chooseplan", methods=['post','get'])
def choose_plan():
    SSN = request.form.get('ssn')
    name = db(f"select concat(fname,' ',lname) from customer where ssn = '{SSN}';")
    # check customer exists or not
    if not name:
        return render_template("filewithssn.html", wrong="Wrong", data="Customer SSN not found")

    # check if the Customer didn't purchased any plans 
    records = db(f"select ID, CBeneficiary, plan_type  from insurance_plan where Purchase_ssn = '{SSN}';")
    if not records:
        return render_template("filewithssn.html", wrong="Wrong", data="Customer didn't purchase any plans")

    # iterate on the plans and get the beneficiries of each plan    
    ben = []
    ben_ssn = []
    for i in range(len(records)):
        bens = db(f"select name,ssn from dependent where plan_id = '{records[i][0]}';")

        # make every beneficiary have the same index as its plan
        array = []
        array_ssn = []
        if records[i][1] == SSN:
            array.append(name[0][0])
            array_ssn.append(SSN)
        for b in bens:
            array.append(b[0])
            array_ssn.append(b[1])
        ben.append(array)
        ben_ssn.append(array_ssn)
    return render_template("chooseplan.html",ourdata = [records,ben,ben_ssn,len(records)])

# if the customer chooses plan_id
@app.route("/filewithplanid" , methods=['post','get'])
def file_with_plan_id():
    return render_template("filewithplanid.html")

# the form 
@app.route("/fileclaimform" , methods=['post','get'])
def file_claim_form():
    plan_id = request.form.get('plan_id')
    records = db(f"select id , type_of_beneficiary , CBeneficiary , plan_type , purchase_ssn from insurance_plan where ID = '{plan_id}';")
    # check if the plan exists with the plan_id entered
    if not records :
        return render_template("filewithplanid.html", wrong="Wrong", data="Wrong plan ID")
    
    ben = []
    if records[0][2]: # CBeneficiary
        customer_name = db(f"select ssn,concat(fname,' ',lname) from customer where SSN = '{records[0][2]}';")
        ben.append([customer_name[0][0],customer_name[0][1]])

    if records[0][1] != "Customer" : # type_of_beneficiary
        dep = db(f"select ssn,name from dependent where plan_id = '{records[0][0]}'")
        for d in dep :
            ben.append([d[0],d[1]])
    # return the avilable hospitals for the customer's plan       
    hospitals = db(f"select ID ,hospital_name from hospital,enroll where enroll.plan_type = '{records[0][3]}' and hospital_id = ID ")
    needed = [records[0][0] , records[0][4]] # [id ,purchase_ssn]
    print(f"\n \n \n \n\n \n \n \n\n \n file_claim_form \n needed: {needed} \n hospitals: {hospitals}\n ben: {ben}\n \n \n \n ")
    return render_template("fileclaimform.html",ben = ben,hospitals=hospitals,needed = needed,wrong=None)

# description 
@app.route("/claimfiled",methods=["GET","POST"])
def fileclaim1():
    beneficiary_ssn = request.form.get("beneficiary")
    receipt_no      = request.form.get("receipt")
    hospital_id     = request.form.get("hospital")
    expenses        = request.form.get("expenses")
    des             = request.form.get("des")
    ben_ssn         = request.form.getlist("ben_ssn")
    ben_name        = request.form.getlist("ben_name")
    needed          = request.form.getlist("needed")
    hospitals_id    = request.form.getlist("hospitals_id")
    hospitals_name  = request.form.getlist("hospitals_name")
    hospitals       = []
    print(f"\n \n \n \n\n \n \n \n\n \n \n  {hospitals_id} \n  {hospitals_name}\n {ben_ssn,ben_name}\n \n \n \n ")
    for i in range(len(hospitals_id)):
        hospitals.append([hospitals_id[i],hospitals_name[i]])
    ben = []
    for i in range(len(ben_name)):
        ben.append([ben_ssn[i],ben_name[i]])
        
    print(f"\n \n \n \n\n \n \n \n\n \n \n needed: {needed} \n hospitals: {hospitals}\n ben: {ben}\n \n \n \n ")
    plan_id = needed[0]
    customer_ssn = needed[1]

    # check if the Receipt Number already exits for this hospital and return us to the same page
    try:
        db(f"insert into claim(receipt_no,claimbeneficiary_ssn,claim_date,expenses,claim_description,customer_ssn,plan_id,hospital_id,resolved) values ('{receipt_no}','{beneficiary_ssn}',CURDATE(),'{expenses}','{des}','{customer_ssn}','{plan_id}','{hospital_id}',0);")
    except:
        return render_template("fileclaimform.html",ben = ben,hospitals=hospitals,needed = needed,wrong='wrong')

    claimid = db(f"select max(ID) from claim where customer_ssn='{customer_ssn}';") # return the latest claim made 
    details = db(f"select * from claim,hospital where claim.id = '{claimid[0][0]}' and claim.hospital_id = hospital.id;")
    
    # get the names of beneficiries whether customer or dependent
    if details[0][2] == details[0][7]: # [claimbeneficiary_ssn,customer_ssn]
        name = db(f"select concat(fname,' ',lname) from customer where ssn='{details[0][2]}';")
    else:
        name = db(f"select name from dependent where ssn='{details[0][2]}';")
    if details[0][4] == 0: # resolved
        resolved = 'No'
    else:
        resolved = 'Yes'
    return render_template("claimfiled.html", details=details[0], name=name, resolved=resolved)
