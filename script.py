import gspread
from datetime import date, datetime
from flask import Flask, render_template
from flask_mail import Mail, Message

import google.oauth2.credentials
import google_auth_oauthlib.flow

#name of each project supervisor
dict = {
  "name_1": "Eric",
  "name_2": "Ines",
  "name_3": "Patrick"
}

app = Flask(__name__)


#setting up the mail

mail_settings = {
    "MAIL_SERVER": 'smtp.gmail.com',
    "MAIL_PORT": 465,
    "MAIL_USE_TLS": False,
    "MAIL_USE_SSL": True,
    "MAIL_USERNAME": '', #datagram email adresse
    "MAIL_PASSWORD": '' #datagram email password
}

app.config.update(mail_settings)
mail = Mail(app)

# connecting the spreadsheet to our app using gspread

sa= gspread.service_account(filename="flask-project-336812-6ef3b68b4c17.json")

#opening the sheet
sh=sa.open("flask spreadsheet")

#setting the worksheet
wks = sh.worksheet("Sheet1")


@app.route('/')
def app():
        #row_count gives us the number of rows
        Rows=wks.row_count

        current_date=str(datetime.date(datetime.now()))
        
        for i in range(2, Rows):
                        
            candidate= wks.cell(i,2).value
            projectName= wks.cell(i,3).value
            status=wks.cell(i,4).value
            mail_Time= str(wks.cell(i,5).value)
            score= int(wks.cell(i,6).value)

            # time_diff holds the number of days between system date and the date when the email was sent
            d1 = datetime.strptime(current_date, "%Y-%m-%d")
            d2 = datetime.strptime(mail_Time, "%Y-%m-%d")

            time_diff=abs((d1-d2).days)
            
            # first condition: if the statu+s is applied

            if status=='Applied':
             #we change the applied status to online test sent
             wks.update_cell(i,4,'Online test sent')

             #we add today's date to the mail sent cell
             wks.update_cell(i,5, current_date)

             # we send an email for the candidate
             with app.app_context():
                    msg = Message(subject="Hello",
                            sender=app.config.get("MAIL_USERNAME"),
                            recipients=[candidate],
                            body="Thank you for applying to the project %s" % projectName)
                    mail.send(msg)
             

            elif (status=='Online test sent') and (time_diff>6) and (score==None):
            
                 wks.update_cell(i,4,'Reminder sent')
                 wks.update_cell(i,5, current_date)
                 with app.app_context():
                    msg = Message(subject="Hello",
                            sender=app.config.get("MAIL_USERNAME"),
                            recipients=[candidate],
                            body="You haven’t submitted your test. Everything okay?")
                    mail.send(msg)

        
            elif (status=='Submitted test') and  (score<25):
                 wks.update_cell(i,4,'Refusal mail sent')
                 wks.update_cell(i,5, current_date)

                 with app.app_context():
                    msg = Message(subject="Hello",
                            sender=app.config.get("MAIL_USERNAME"),
                            recipients=[candidate],
                            body="We are sorry to tell you that you did not pass the test")
                    mail.send(msg)

            elif (status=='Submitted test') and  (score>25):

                 encadrant=dict.get(projectName)
                 wks.update_cell(i,4,'Interview mail sent')
                 wks.update_cell(i,5, current_date)

                 with app.app_context():
                    msg = Message(subject="Hello",
                            sender=app.config.get("MAIL_USERNAME"),
                            recipients=[candidate],
                            body="Congratulations for passing the test. You’ll have an interview with %s" %encadrant)
                    mail.send(msg)

        return render_template('index.html')      

if __name__ == '__main__':
    app.run(debug=True)






