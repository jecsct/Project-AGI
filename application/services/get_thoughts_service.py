from flask import Flask
from config import database
import pymysql

app = Flask(__name__)

# MySQL Configuration
database = pymysql.connect(host=database, user='root', password='root', database='notes')
cursor = database.cursor()

# In case that the Table does not exist, it creates it.
cursor.execute("CREATE TABLE IF NOT EXISTS thoughts (id INT AUTO_INCREMENT PRIMARY KEY, text VARCHAR(255))")

@app.route('/get_thoughts_service', methods=['GET'])
def hub():
    cursor.execute("SELECT text FROM thoughts;")
    data = cursor.fetchall()
    return [row[0] for row in data]

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8002)