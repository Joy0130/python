#!/bin/bash
. venv/bin/activate
pip freeze > requirements.txt
pip uninstall -r requirements.txt -y
deactivate
rm -r venv/
sudo docker build -t "nas-tvm.futsu.com.tw:9999/python-test-container:latest" .
#sudo docker run -d -p 5000:5002 --name python-test-container ghcr.io/joy0130/python:latest