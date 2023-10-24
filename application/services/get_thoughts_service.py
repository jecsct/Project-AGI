from flask import Flask
from config import db
import mysql.connector

app = Flask(__name__)


# MySQL Configuration
db_config = {
    'host': db,
    'user': 'admin',
    'password': 'admin',
    'database': 'notes',
    'auth_plugin':'mysql_native_password',
}

connection = mysql.connector.connect(**db_config)
cursor = connection.cursor()


# # In case that the Table does not exist, it creates it.
query = "CREATE TABLE IF NOT EXISTS thoughts (id INT AUTO_INCREMENT PRIMARY KEY, text VARCHAR(255));"
cursor.execute(query)



@app.route('/get_thoughts_service', methods=['GET'])
def hub():
    query = "SELECT text FROM thoughts;"
    cursor.execute(query)
    results = cursor.fetchall()
    
    return {'thoughts': [row[0] for row in results]}

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8002)
