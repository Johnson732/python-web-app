from flask import Flask, render_template
from app.config import APP_MESSAGE

app = Flask(__name__)

@app.get("/")
def index():
    return render_template("index.html", message=APP_MESSAGE)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(__import__("os").environ.get("PORT", 8080)))
