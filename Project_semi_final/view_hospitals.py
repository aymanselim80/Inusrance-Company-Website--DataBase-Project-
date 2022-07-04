from __main__ import app,render_template,db,request,redirect


#VIEW HOSPITAL
@app.route('/hospitalview', methods=['GET','POST'])
def hospitalview():
    if request.method == "POST":
        # if the page was submitted by the submit button
        if 'submit_button' in request.form:
            SSN = request.form.get('SSN')
            name = db(f"select concat(fname,' ',lname) from customer where ssn = '{SSN}';")
            print(f"\n \n \n \n \n\n {SSN} \n {name} \n \n \n \n ")
            if not name :
                print(f"\n \n \n \n \n none conditon\n {SSN} \n {name} \n \n \n \n ")
                return render_template('hospitalview.html',wrong = "Wrong",data = "Error: Wrong Customer SSN",ourdata=None)
            records = db(f"select ID, CBeneficiary, plan_type  from insurance_plan where Purchase_ssn = '{SSN}';")
            if not records :
                return render_template('hospitalview.html',wrong = "Wrong",data = "Error: Customer didn't purchase any plans",ourdata=None)
            ben     = []
            ben_ssn = []
            for i in range(len(records)):
                bens = db(f"select name,ssn from dependent where plan_id = '{records[i][0]}';")
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
            return render_template("hospitalview.html", ourdata=[records, ben, ben_ssn, len(records)],hospitals=None)

            #########################################################################################################
            
        # show plan  
        if 'select_button' in request.form:
            hospitals = [] 
            user_answer= 0
            user_answer= request.form.get("activity")
            hid_list = db(f"select Hospital_id from Enroll where Plan_type = '{user_answer}'")
            for i in hid_list:
                if  i:
                    hospitals.append(db(f"select id , hospital_name, specialization, rating, concat(state,', ',city,', ',street) from Hospital where ID = {i[0]}"))

        return render_template("hospitalview.html", ourdata = None, hospitals = hospitals)
    else:
        return render_template("hospitalview.html")
