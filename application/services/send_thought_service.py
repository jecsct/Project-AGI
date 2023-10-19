from flask import Flask, request, jsonify
import pymysql

app = Flask(__name__)

# MySQL Configuration
database = pymysql.connect(host='localhost', user='root', password='root', database='notes')
cursor = database.cursor()

# In case that the Table does not exist, it creates it.
cursor.execute("CREATE TABLE IF NOT EXISTS thoughts (id INT AUTO_INCREMENT PRIMARY KEY, text VARCHAR(255))")

@app.route('/send_thought_service', methods=['POST'])
def send_thought_service():
    text = request.json
    cursor.execute("INSERT INTO thoughts (text) VALUES (%s)", (text['thought'],))
    database.commit()
    return jsonify(success=True)

if __name__ == '__main__':
    app.run(port=8003)