from flask import Flask ,render_template,request,redirect
from database import db

app = Flask(__name__,template_folder='templates',static_folder='static')

import home
import purchase_a_plan
import file_claim
import add_customer
import add_dependent
import add_hospital
import view_claims
import view_customer
import view_hospitals


if __name__ == '__main__':
    app.run(debug=True)