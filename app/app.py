from flask import Flask

app = Flask(__name__)

@app.route('/hello-world')
def hello():
    return 'Hello World!', 200

@app.route('/healthcheck')
def healthcheck():
    return 'OK', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)