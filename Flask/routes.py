from flask import Flask, request, render_template, session, url_for, flash, send_from_directory, request, redirect, render_template
from forms import ContactForm
app = Flask(__name__)
app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'

'''
@app.route('/')
def index():
    return 'Hello, World!'
'''
@app.route('/login', methods=['POST'])
def login():
    if 'name' in session:
        name = session['name']
        return 'You are logged in as ' + name + '<br>' + \
         "<b><a href = '/logout'>click here to log out</a></b>"
    return "You are not logged in <br><a href = '/login'></b>" + \
      "click here to log in</b></a>"

@app.route('/logout')
def logout():
   # remove the name from the session if it is there
   session.pop('name', None)
   return redirect(url_for('index'))

@app.route('/new', methods = ['GET', 'POST'])
def new():
    if (request.method == 'POST'):
        if (not request.form['name'] or not request.form['surname'] \
                or not request.form['email'] or not request.form['password']):
            flash('Please fill all the fields.', 'error')
        else:
            session['name'] = request.form['name']
            return login()
    return render_template('new.html')

@app.route('/')
def index():
   return render_template('index.html') # returns a simple .html page




if __name__ == '__main__':
   app.run(debug = True)
