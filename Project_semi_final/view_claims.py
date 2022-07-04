from __main__ import app,render_template,db,request,redirect


@app.route("/viewClaims", methods=['POST', 'GET'])
def viewClaims():
    if request.method == "POST":
        customer_SSN = request.form.get('ssn')
        resolved = request.form.get("Resolved?")
        ssn = db(f"select ssn from customer where ssn = '{customer_SSN}';")
        if not ssn:
            return render_template("viewClaims.html",wrong="Wrong",data="Customer SSN Not Found")
        data = db(f"select ID from Claim where customer_ssn = '{customer_SSN}';")
        if not data:
            return render_template("viewClaims.html",wrong="Wrong",data="Customer didn't file any claims")
        else:
            if resolved == "All":
                claims = db(f"select ID,plan_id, ClaimBeneficiary_SSN, Claim_date, resolved from Claim where customer_ssn = '{customer_SSN}';")
            else:
                claims = db(f"select ID,plan_id, ClaimBeneficiary_SSN, Claim_date, resolved from Claim where customer_ssn = '{customer_SSN}' AND (resolved = 0 or resolved is null );")
                if not claims :
                    return render_template("viewClaims.html", wrong="Wrong", data="Customer doesn't have any unresolved claims")

        return render_template('claimsResults.html', claims = claims)
    else:
        return render_template("viewClaims.html")


@app.route("/claimDetails", methods=["POST", "GET"])
def claimDetails():
    try:
        claimid = request.form.get('resolved')
        db(f"UPDATE claim SET resolved = 1 where ID = '{claimid}';")
    except:
        claimid = request.form.get('id')

    details = db(f"select * from claim,hospital where claim.id = '{claimid}' and claim.hospital_id = hospital.id;")
    if details[0][2] == details[0][7]:
        name = db(f"select concat('fname',' ','lname') from customer where ssn='{details[0][2]}';")
    else:
        name = db(f"select name from dependent where ssn='{details[0][2]}';")
    if details[0][4] != 1 :
        resolved = 'No'
    else :
        resolved = 'Yes'
    return render_template('claimDetails.html',details=details[0],name = name,resolved=resolved)
