from flask import Flask, send_from_directory, render_template

app = Flask(__name__, template_folder="./static")

@app.errorhandler(404)
def error_404(error):
    return render_template("404.html"), 404

@app.route("/", methods=["GET"])
def dashboard():
    return render_template("main.html")
