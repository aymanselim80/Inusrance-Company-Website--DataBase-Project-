from __main__ import app,render_template,db,request,redirect

@app.route('/')
def page():
    data = db(f"select * from plan_type;")
    return render_template('home.html',data = data)




    


