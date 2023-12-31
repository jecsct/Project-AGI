from flask import Flask, render_template, jsonify
import requests

app = Flask(__name__)

@app.route("/quote", methods=['GET'])
def get_inspiring_quote():
    response = requests.get("https://zenquotes.io/api/random")
    data = response.json()
    return jsonify({"author": data[0]['a'], "quote": data[0]['q']})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8001)