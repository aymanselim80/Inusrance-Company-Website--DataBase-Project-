from mysql.connector import  connect ,Error


def db(sqlquery):
    myhost      = 'localhost'
    mydatabase  = 'insurance_comp'
    myuser      = 'root'
    mypass      = 'adeligione1'

    con = connect(host = myhost,
                  database = mydatabase,
                  user = myuser,
                  password = mypass)
    cur = con.cursor()
    try:
        cur.execute(sqlquery)
    except Error as e:
        print(f"\n \n \n \n \n Exception There was an ERROR on the SQL command \n{e} \n \n \n \n")
    records = cur.fetchall()
    con.commit()
    con.close()
    return records                   

