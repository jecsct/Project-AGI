from flask import Flask
from config import database
import pymysql

app = Flask(__name__)

# MySQL Configuration
database = pymysql.connect(host=database, user='root', password='root', database='notes')
cursor = database.cursor()

@app.route('/get_thoughts_service')
def hub():
    cursor.execute("SELECT text FROM thoughts")
    data = cursor.fetchall()
    return [row[0] for row in data]

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8002)