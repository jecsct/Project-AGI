from flask import Flask, render_template, request, redirect
import requests
import pymysql

app = Flask(__name__)

# MySQL Configuration
db = pymysql.connect(host='localhost',
                     user='root',
                     password='root',
                     database='notes')

cursor = db.cursor()

# Needs to have Database configuration prior to this.
cursor.execute("CREATE TABLE IF NOT EXISTS thoughts (id INT AUTO_INCREMENT PRIMARY KEY, text VARCHAR(255))")

# MySQL Functions.
@app.route('/store_thought', methods=['POST'])
def store_thought():
    if request.method == 'POST':
        text = request.form['text']
        cursor.execute("INSERT INTO thoughts (text) VALUES (%s)", (text,))
        db.commit()
        return redirect('/hub')

# HTML Routing.
def get_inspiring_quote():
    response = requests.get("https://zenquotes.io/api/random")
    data = response.json()
    return data[0]['q']

@app.route('/')
def index():
    return render_template('home.html')

@app.route('/home')
def home():
    return render_template('home.html')

@app.route('/hub')
def hub():
    cursor.execute("SELECT text FROM thoughts")
    data = cursor.fetchall()
    texts = [row[0] for row in data]
    return render_template('hub.html', texts=texts)

@app.route('/quote')
def quote():
    quote = get_inspiring_quote()
    return render_template('daily.html', quote=quote)

if __name__ == '__main__':
    app.run(debug=True)
