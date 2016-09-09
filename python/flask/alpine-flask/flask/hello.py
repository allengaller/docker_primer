from flask import Flask
app = Flask(__name__)

@app.route('/hello', methods=['GET'])
def healthy():
    return "hello world",200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000 )
