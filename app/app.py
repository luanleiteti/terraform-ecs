import logging
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URL
db = SQLAlchemy(app)

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@app.before_first_request
def log_database_connection():
    engine = db.engine
    logger.info(f"Connected to database: {engine.url}")

@app.route('/hello-world')
def hello():
    return 'Hello World!', 200

@app.route('/healthcheck')
def healthcheck():
    return 'OK', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)