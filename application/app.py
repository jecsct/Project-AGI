from cgitb import text
from flask import Flask, render_template, request, redirect
from config import send1, get1, balancer
import requests
import re

app = Flask(__name__)

@app.route('/send_thought', methods=['POST'])
def send_thought():
    if request.method == 'POST':
        response = requests.post('http://' + send1 + ':8003/send_thought_service', json={'thought': request.form['text']})
        if response.status_code == 200:
            return redirect('/hub')
    return redirect('/')

@app.route('/')
def index():
    return render_template('home.html')

@app.route('/home')
def home():
    return render_template('home.html')

@app.route('/hub')
def hub():
    response = requests.get("http://" + get1 + ":8002/get_thoughts_service")
    return render_template('hub.html', texts=response.json().get('thoughts', []))

@app.route('/quote_page')
def quote():
    response = requests.get("http://"+ balancer +"/quote")
    text = response.json()['quote'] + " - " + response.json()['author']
    return render_template('daily.html', quote=text)

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8000, debug=True)
