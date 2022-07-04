from __main__ import app,render_template,db,request,redirect


@app.route("/addhospital", methods=['GET', 'POST'])
def AddHospital():
    if request.method == "POST":
        # getting data
        # hospital name
        Hospital_Name   = request.form.get('Hospital_Name')

        # hospital specialization
        specialization  = request.form.get('Hospital_specialization')

        # hospital rating
        Hospital_rating = request.form.get('Hospital_rating')

        # hospital state
        Hospital_state  = request.form.get('Hospital_state')

        # hospital city
        Hospital_city   = request.form.get('Hospital_city')

        # hospital street
        Hospital_street = request.form.get('Hospital_street')

        PlanType    = [None, None, None]
        PlanType[0] = request.form.get('Basic')
        PlanType[1] = request.form.get('Golden')
        PlanType[2] = request.form.get('Premium')

        # insert the hospital into the database
        try:
            db(f"INSERT INTO hospital(Hospital_name,specialization,rating,state,city,street) values ('{Hospital_Name}','{specialization}',{Hospital_rating},'{Hospital_state}','{Hospital_city}','{Hospital_street}');")
        except:
            return render_template("addhospital.html", wrong="Wrong", data="Error: Hospital already exists")

        # get the id of hospital
        records = db(f"SELECT ID FROM hospital WHERE Hospital_name = '{Hospital_Name}';")

        # check the paln type choosen
        if (not PlanType[0]) and (not PlanType[1]) and (not PlanType[2]):
            return render_template("addhospital.html", wrong="Wrong", data="Error: Plan Type NOT Found")

        # loop to enter the enroll attributes
        for i in range(3):
            if PlanType[i] != None:
                db(f"INSERT INTO enroll(Hospital_id ,Plan_type) values ({records[0][0]} ,'{PlanType[i]}');")

        return render_template("addhospital.html", wrong="success", data="Hospital was added successfully")
    else:
        return render_template("addhospital.html")