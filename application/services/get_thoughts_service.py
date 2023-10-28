from flask import Flask, jsonify
from config import database
import mysql.connector

app = Flask(__name__)


# MySQL Configuration
db_config = {
    'host': database,
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
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()
    cursor.execute("SELECT text FROM thoughts;")
    data = cursor.fetchall()
    thoughts = [row[0] for row in data]
    connection.close()
    return jsonify({'thoughts': thoughts})

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8002)
