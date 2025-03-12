import logging
from flask import Flask

app = Flask(__name__)

# Configure logging
logging.basicConfig(level=logging.INFO)  # Set logging level to INFO
logger = logging.getLogger()

@app.route('/')
def hello():
    logger.info("Processing request for '/' endpoint")
    return "Hello, Kubernetes!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)