#!/bin/bash
python3 -m venv venv
. venv/bin/activate
pip3 install flask
pip3 install requests
python3 app.py