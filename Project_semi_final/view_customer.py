from __main__ import app,render_template,db,request,redirect

@app.route("/customerview")
def customerview():
    records = db("select ssn,concat(fname,' ',lname),gender,mobile_number,YEAR(curdate()) - YEAR(Date_of_birth) - (RIGHT(curdate(), 5) < RIGHT(Date_of_birth, 5)) as age ,concat(state,', ',city,', ',street,'.')from customer order by age;")
    return render_template("customerview.html",data = records)