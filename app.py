import psutil
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
    
    mem_metric = psutil.virtual_memory().percent
    cpu_metric = psutil.cpu_percent(interval=1)
    Message = None
    if cpu_metric > 80 or mem_metric > 70:
        Message = "High CPU or Memory Detected, scale up!!!"
    return render_template("index.html", cpu_metric=cpu_metric, mem_metric=mem_metric, message=Message)

if __name__=='__main__':
    app.run(debug=True, host = '0.0.0.0')

    #output is cpu and memory utlization of system