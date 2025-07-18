from flask import Flask
import threading
import time
import subprocess

app = Flask(__name__)

@app.route("/")
def index():
    return "PDF Cron corriendo"

@app.route("/ping")
def ping():
    return "pong"

def cron_loop():
    while True:
        print("Ejecutando petición...")
        subprocess.call(["/bin/bash", "/app/ping.sh"])
        time.sleep(600)  # 10 minutos

# Lanzar hilo del cron
threading.Thread(target=cron_loop, daemon=True).start()

if __name__ == "__main__":
    import os
    port = int(os.environ.get("PORT", 10000))
    app.run(host="0.0.0.0", port=port)
