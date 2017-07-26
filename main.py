from flask import Flask, render_template, flash, request, url_for, redirect, session
from forms import RegistrationForm, LoginForm, form1, form2, form3, form4, form5, form6, form7, form8, form9
from flask_mysqldb import MySQL
from MySQLdb import escape_string as thwart
import gc

app = Flask(__name__)
app.secret_key = 'bestintheworld'

app.config['MYSQL_HOST'] = '192.168.43.66' # Change this according to the ip of the computer on that network
app.config['MYSQL_USER'] = 'shahidikram0701'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'fifadb'

mysql = MySQL(app)

sess = {'logged_in':False, 'username':""}

@app.route('/')
def homepage():
	return render_template("index.html", name = "")


@app.route('/<name>/')
def homepage2(name):
	return render_template("after_login.html", name = name)


@app.route('/register/', methods=["GET","POST"])
def register_page():
    form = RegistrationForm(request.form)

    if request.method == "POST": #and form.validate():
    	name  = form.name.data
    	email = form.email.data
    	password = (str(form.password.data))
    	gender = form.Gender.data
    	age = form.Age.data
    	#data = ""
    	#data += "Name: "+str(name)+"<br/>" + "E-Mail: "+str(email)+"<br/>" + "Password: "+str(password)+"<br/>" + "Age: "+str(age)+"<br/>" + "Gender: "+str(gender)+"<br/>"
    	#return (data)
    	flash("Thanks for registering!")
    	#session['logged_in'] = True
    	#session['username'] = name

    	c = mysql.connection.cursor()
    	sql_command = 'INSERT into users values (%s, %s, %s, %s, %s)'
    	c.execute(sql_command, (name, email, password, gender, age))
    	mysql.connection.commit()
    	flash("Registered")
    	return redirect(url_for('homepage2', name = name))

    return render_template("Register.html", form=form)

@app.route('/login/', methods=["GET","POST"])
def login():
	login_form = LoginForm(request.form)

	if request.method == "POST": #and login_form.validate():
		name  = str(login_form.name.data)
		password = login_form.password.data

		if(sess['username'] != name and sess['logged_in'] != True):
			c = mysql.connection.cursor()
			x = c.execute("SELECT * FROM users WHERE users.Name LIKE %s", [name])
			temp = c.fetchall()
			if(str(temp) + "" != "()"):
				#return "" + str(temp[0])
				c.execute("SELECT Password FROM users WHERE Name Like %s",[name])
				x = c.fetchall()
				correct_pass = ""
				correct_pass += str(x[0][0])
				mysql.connection.commit()

				if password == correct_pass:
					sess['logged_in'] = True
					sess['username'] = name
				else:
					flash("Wrong password or username")
					sess['logged_in'] = False
					return redirect(url_for('login'))
			else:
				flash('Wrong username')
				return redirect(url_for('login'))
		else:
			flash("already Logged in")

		'''data = ""
		data += "Name: "+str(name)+"<br/>" + "Password: "+str(password)+"<br/>"
		return (data)'''
		#return str(sess)
		return redirect(url_for('homepage2', name = name))
	else:
		session['logged_in'] = False
		return render_template("Login.html", form = login_form)

	#c = mysql.connection.cursor()

@app.route('/logout/', methods=["GET","POST"])
def logout():
	session.logged_in = False
	session.username = ""
	return "You are Logged out <br/> <br/> <a href = 'http://localhost:5000/'>click here to go back to homepage</a>"

@app.route('/queries/', methods=["GET","POST"])
def queryPage():
	F1 = form1(request.form)
	F2 = form2(request.form)
	F3 = form3(request.form)
	F4 = form4(request.form)
	F5 = form5(request.form)
	F6 = form6(request.form)
	F7 = form7(request.form)
	F8 = form8(request.form)
	F9 = form9(request.form)

	if request.method == 'POST' and F1.playerName.data:
		c = mysql.connection.cursor()
		c.execute("SELECT players.Name, players.Position, players.Worth, players.Age, players.Rating, players.Career_goals, players.Jersey_no, club.Name, country.Name FROM (players JOIN club on players.Club_id = club.Id) JOIN country ON players.Country = country.Country_id WHERE players.Name LIKE %s", [F1.playerName.data] )
		temp = c.fetchall()
		mysql.connection.commit()
		#name = u' '.join(temp[0]).encode('utf-8').strip() + "<br/>"
		name = str(temp[0][0])
		position = str(temp[0][1])
		worth = str(temp[0][2])
		age = str(temp[0][3])
		rating = str(temp[0][4])
		career_goals = str(temp[0][5])
		jersey_no = str(temp[0][6])
		club = str(temp[0][7])
		country = str(temp[0][8])
		source = name + ".jpg"
		return render_template("player.html", name = name, position = position, worth = worth, age = age, rating = rating, career_goals = career_goals, jersey_no = jersey_no, club = club, country = country, source = source)
		#return str(temp)
		#return "FORM 1 clicked and player to search is " + F1.playerName.data
	elif request.method == 'POST' and F2.clubName.data:
		c = mysql.connection.cursor()
		c.execute("SELECT players.Name FROM players JOIN club on players.Club_id = club.Id WHERE club.Name LIKE %s", [F2.clubName.data] )
		x = c.fetchall()
		correct_pass = "<h1 align = 'center'>" + str(F2.clubName.data) + "</h1>"
		for i in x:
			correct_pass += "<h3 align = 'center'>" +  u' '.join(i[0]).encode('utf-8').strip() + "</h3>"
		mysql.connection.commit()
		correct_pass += "<br/> <a href = '/queries/'>QUERIES</a>"
		return correct_pass
		#return "FORM 2 clicked and teamsheet to be generated of club " + F2.clubName.data
	elif request.method == 'POST' and F3.club.data:
		#return "Form 3 clicked"
		c = mysql.connection.cursor()
		c.execute("SELECT manager.Name, manager.Age, manager.Country, manager.Contact,manager.Email, manager.Income from manager JOIN club on club.Manager_id = manager.Id WHERE club.Name LIKE %s", [F3.club.data] )
		temp = c.fetchall()
		mysql.connection.commit()
		name = str(temp[0][0])
		age = str(temp[0][1])
		country = str(temp[0][2])
		contact = str(temp[0][3])
		email = str(temp[0][4])
		income = str(temp[0][5])
		return render_template("manager.html", name = name, age = age, country = country, contact = contact, email = email, income = income)
	elif request.method == "POST" and F4.player.data:
		player = F4.player.data
		teamTo = F4.clubTo.data
		amount = int(F4.transferFee.data)
		c = mysql.connection.cursor()
		c.execute("SELECT players.Id, players.club_id, club.Name FROM players JOIN club ON players.club_id = club.Id where players.Name LIKE %s", [player] )
		temp = c.fetchall()
		playerID = str(temp[0][0])
		teamFromId = str(temp[0][1])
		teamFrom = str(temp[0][2])
		c.execute("SELECT club.Id FROM club WHERE club.Name LIKE %s", [teamTo])
		temp = c.fetchall()
		teamToId = str(temp[0][0])
		#return amount
		c.execute("INSERT into transfers values (%s, %s, %s, %s)", (playerID, teamFromId, teamToId, amount))
		mysql.connection.commit()
		return "<h1>" + player + "transfered from " + teamFrom + " to " + teamTo + "</h1>" + "<a href = '/queries/'> Queries </a>"
	elif request.method == "POST" and F5.potential.data:
		potential = int(F5.potential.data)
		#return potential
		c = mysql.connection.cursor()
		c.execute("SELECT youth_academy.Name, youth_academy.Potential, youth_academy.Position, youth_academy.Worth FROM youth_academy WHERE youth_academy.Potential >= %s", [potential])
		temp = c.fetchall()
		mysql.connection.commit()
		x = ""
		for i in temp:
			x += "Name : " + str(i[0]) + "<br/>"
			x += "Potential : " + str(i[1]) + "<br/>"
			x += "Position : " + str(i[2]) + "<br/>"
			x += "Worth : " + str(i[3]) + "<br/><br/>"

		x += "<a href = '/queries/'> Queries </a>"
		return x
	elif request.method == "POST" and F6.date.data:
		date = str(F6.date.data)
		c = mysql.connection.cursor()
		c.execute("SELECT schedule.Date, schedule.Time, schedule.Team1, schedule.Team2, league.Name FROM schedule JOIN league ON schedule.League_id = league.Id where schedule.Date LIKE %s", [date])
		temp = c.fetchall()
		x = ""
		for i in temp:
			x += "League : " + "<b><u>" + str(i[4]) + "</b></u>" + "<br/><br/>"
			x += "Date : " + str(i[0]) + "<br/>"
			x += "TIME : " + str(i[1]) + "<br/>"
			c.execute("SELECT club.Name from club where club.Id LIKE %s", [str(i[2])])
			x += "Team1 : " + str((c.fetchall())[0][0]) + "<br/>"
			c.execute("SELECT club.Name from club where club.Id LIKE %s", [str(i[3])])
			x += "Team2 : " + str((c.fetchall())[0][0]) + "<br/><br/>"
		x += "<a href = '/queries/'> Queries </a>"
		mysql.connection.commit()
		return x
	elif request.method == "POST" and F7.result.data:
		resultDate = F7.result.data
		#return resultDate
		c = mysql.connection.cursor()
		c.execute("SELECT * FROM (schedule JOIN result on schedule.Match_id = result.Result_id) JOIN league on schedule.League_id = league.Id where schedule.Date LIKE %s", [resultDate])
		temp = c.fetchall()
		x = ""
		for i in temp:
			x += "League : " + "<b><u>" + str(i[25]) + "</b></u>" + "<br/><br/>"
			x += "Date : " + str(i[1]) + "<br/>"
			x += "TIME : " + str(i[2]) + "<br/>"
			c.execute("SELECT club.Name from club where club.Id LIKE %s", [str(i[3])])
			T1 = str((c.fetchall())[0][0])
			x += "Team1 : " + T1 + "<br/>"
			c.execute("SELECT club.Name from club where club.Id LIKE %s", [str(i[4])])
			T2 = str((c.fetchall())[0][0])
			x += "Team2 : " + T2 + "<br/>"
			c.execute("SELECT players.Name from players where players.Id LIKE %s", [str(i[7])])
			x += "Man of the Match : " + str((c.fetchall())[0][0]) + "<br/>"
			x += "Goals " + T1 + " : " + str(i[8]) + "<br/>"
			x += "Goals " + T2 + " : " + str(i[9]) + "<br/>"
			x += "Corners " + T1 + " : " + str(i[10]) + "<br/>"
			x += "Corners " + T2 + " : " + str(i[11]) + "<br/>"
			x += "Possession " + T1 + " : " + str(i[12]) + "%" + "<br/>"
			x += "Possession " + T2 + " : " + str(i[13]) + "%" + "<br/>"
			x += "Free Kicks " + T1 + " : " + str(i[14]) + "<br/>"
			x += "Free Kicks " + T2 + " : " + str(i[15]) + "<br/>"
			x += "Yellow Cards " + T1 + " : " + str(i[16]) + "<br/>"
			x += "Yellow Cards " + T2 + " : " + str(i[17]) + "<br/>"
			x += "Red Cards " + T1 + " : " + str(i[18]) + "<br/>"
			x += "Red Cards " + T2 + " : " + str(i[19]) + "<br/>"
			x += "Shots on Target " + T1 + " : " + str(i[20]) + "<br/>"
			x += "Shots on Target " + T2 + " : " + str(i[21]) + "<br/>"
			x += "Saves " + T1 + " : " + str(i[22]) + "<br/>"
			x += "Saves " + T2 + " : " + str(i[23]) + "<br/><br/>"
		x += "<a href = '/queries/'> Queries </a>"
		return x
		mysql.connection.commit()
	elif request.method == "POST" and F8.league_participation.data:
	 	league_name = F8.league_participation.data
		#return league_name
		c = mysql.connection.cursor()
		c.execute("SELECT club.Name FROM (league_participation JOIN league ON league_participation.League_id = league.Id) JOIN club ON league_participation.Club_id = club.Id WHERE league.Name LIKE %s", [league_name])
		temp = c.fetchall()
		mysql.connection.commit()
		x = "<h1 align = 'center'> Teams Battling in " + league_name + " are </h1>"
		for i in temp:
			x += "<p align = 'center'>" + str(i[0]) + "</p><br/>"
		x += "<br/><a href = '/queries/'> Queries </a>"
		return x
	elif request.method == "POST" and F9.matchDel.data:
		match_delete = F9.matchDel.data
		c = mysql.connection.cursor()
		x = c.execute("DELETE FROM schedule WHERE schedule.Date LIKE %s", [match_delete])
		mysql.connection.commit()
		if(x):
			return "<h2>Match on " + match_delete + " deleted</h1><br/><a href = '/queries'>QUERIES</a>"
		else:
			return "<h2>No Match scheduled on " + match_delete +  "</h1><br/><a href = '/queries'>QUERIES</a>"
	return render_template("query.html", form1 = F1, form2 = F2, form3 = F3, form4 = F4, form5 = F5, form6 = F6, form7 = F7, form8 = F8, form9 = F9)


if __name__ == '__main__':
	app.run(debug = True)
