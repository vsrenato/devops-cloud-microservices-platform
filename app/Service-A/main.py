from flask import Flask
import psycopg2
import os

app = Flask(__name__)

@app.route("/")
def index():
    try:
        conn = psycopg2.connect(
            host=os.getenv("db_host"),
            dbname=os.getenv("db_name"),
            user=os.getenv("username"),
            password=os.getenv("password"),
            port=os.getenv("db_port")
        )
        cur = conn.cursor()
        cur.execute("SELECT version();")
        db_version = cur.fetchone()
        cur.close()
        conn.close()
        return f"Service A - DB Version: {db_version}"
    except Exception as e:
        return f"Service A - Failed to connect to DB: {e}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)