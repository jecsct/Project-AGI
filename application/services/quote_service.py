from flask import Flask, jsonify
import requests

app = Flask(__name__)

@app.route("/quote_service", methods=['GET'])
def get_inspiring_quote():
    response = requests.get("https://zenquotes.io/api/random")
    data = response.json()
    return jsonify({"author": data[0]['a'], "quote": data[0]['q']})

if __name__ == "__main__":
    app.run(port=8001)