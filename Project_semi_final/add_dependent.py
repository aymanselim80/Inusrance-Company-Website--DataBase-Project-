from __main__ import app,render_template,db,request,redirect


@app.route("/adddependent", methods = ['GET', 'POST'])
def newdependent():
    if request.method =="POST":
        CustomerSSN     = request.form.get('CustomerSSN')
        exists = db(f"select SSN from customer where SSN = '{CustomerSSN}'; ")
        if not exists:
            return render_template('adddependent.html', wrong = "Wrong", data="Wrong Customer SSN")
        dependentSSN    = request.form.get('dependentSSN')
        dependentName   = request.form.get('dependentName')
        relation        = request.form.get('Relationship')
        dob             = request.form.get('dob')
        Gender          = request.form.get('Gender')

        try:
            db(f"insert into dependent(Customer_ssn, SSN, Name ,relationship , Date_of_birth, Gender) values ('{CustomerSSN}', '{dependentSSN}' , '{dependentName}' ,'{relation}', '{dob}' , '{Gender}');")
        except:
            return render_template('adddependent.html',wrong = "Wrong",data = "Dependent already exists")
        
        return render_template('adddependent.html',wrong = "success",data = "Dependent was added Successfully")
    else:
        return render_template('adddependent.html')

