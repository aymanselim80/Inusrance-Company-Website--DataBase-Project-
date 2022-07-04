from __main__ import app,render_template,db,request,redirect

@app.route("/addcustomer",methods=["GET","POST"])
def addcustomer():
    if request.method == "POST":
        ssn     = request.form.get('ssn')
        fname   = request.form.get('fname')
        lname   = request.form.get('lname')
        phone   = request.form.get('Number')
        state   = request.form.get('State')
        city    = request.form.get('City')
        street  = request.form.get('Street')
        dob     = request.form.get('dob')
        gender  = request.form.get('Gender')
        try:
            db(f"insert into customer(ssn,fname,lname,gender,mobile_number,state,city,street,date_of_birth) values ('{ssn}','{fname}','{lname}','{gender}','{phone}','{state}','{city}','{street}','{dob}');")
        except:
            return render_template('addcustomer.html',wrong = "Wrong",data = "Error: Customer already exists")
        return redirect("/#plans")
    else:
        return render_template('addcustomer.html')
