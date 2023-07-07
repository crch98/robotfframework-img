FROM python:3.9.17-slim-bullseye 

RUN apt-get update && apt-get upgrade

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get install -y firefox-esr wget

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.33.0/geckodriver-v0.33.0-linux64.tar.gz
RUN tar -xzvf geckodriver-v0.33.0-linux64.tar.gz -C /usr/local/bin
RUN chmod +x /usr/local/bin/geckodriver
