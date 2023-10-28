from flask import Flask, request, jsonify
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

# In case that the Table does not exist, it creates it.
cursor.execute("CREATE TABLE IF NOT EXISTS thoughts (id INT AUTO_INCREMENT PRIMARY KEY, text VARCHAR(255))")

@app.route('/send_thought_service', methods=['POST'])
def send_thought_service():
    text = request.json
    insert_query = "INSERT INTO thoughts (text) VALUES (%s);"
    cursor.execute(insert_query, (text['thought'],))
    connection.commit()
    return jsonify(success=True)

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8003)