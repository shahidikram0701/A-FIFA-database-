from flask_wtf import FlaskForm
from wtforms import TextField, IntegerField, TextAreaField, SubmitField, RadioField, SelectField, PasswordField

from wtforms import validators, ValidationError

class RegistrationForm(FlaskForm):
   name = TextField("Name Of User",[validators.Required("Please enter your name.")])
   Gender = RadioField('Gender', choices = [('M','Male'),('F','Female')])
   #Address = TextAreaField("Address")

   email = TextField('Email Address', [validators.Length(min=6, max=50)])

   Age = IntegerField("age")
   #user_manager = SelectField('What are you??', choices = [('usr', 'User'), ('py', 'Python')])


   password = PasswordField('New Password', [validators.Required()])
   #confirm = PasswordField('Repeat Password')
   #accept_tos = BooleanField('I accept the Terms of Service and Privacy Notice', [validators.Required()])
   submit = SubmitField("Register")

class LoginForm(FlaskForm):
    name = TextField("Name Of User",[validators.Required("Please enter your name.")])
    password = PasswordField('Password', [validators.Required()])
    submit = SubmitField("Log in")

class form1(FlaskForm):
    playerName = TextField("Enter the name of the player")
    submit = SubmitField("Search")

class form2(FlaskForm):
    clubName = TextField("Club")
    submit = SubmitField("Generate team Sheet")

class form3(FlaskForm):
    club = TextField("Club")
    submit = SubmitField("Get Manager Details")

class form4(FlaskForm):
    player = TextField("Transfer whom")
    clubTo = TextField("Transfer to  which club")
    transferFee = IntegerField("Transfer Fees")
    submit = SubmitField("Transfer")

class form5(FlaskForm):
    potential = IntegerField("Search for a youth player having potential >= ")
    submit = SubmitField("Search")

class form6(FlaskForm):
    date = TextField("Enter a date (yyyy-mm-dd) : ")
    submit = SubmitField("CHECK")

class form7(FlaskForm):
    result = TextField("Enter a date (yyyy-mm-dd) : ")
    submit = SubmitField("GENERATE")

class form8(FlaskForm):
    league_participation = TextField("Enter a league name : ")
    submit = SubmitField("Get Teams")

class form9(FlaskForm):
    matchDel = TextField("Enter a date (yyyy-mm-dd) : ")
    submit = SubmitField("Delete the match")
