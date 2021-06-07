FROM python:3.8.6-buster

COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt --no-cache-dir
RUN apt-get update && apt-get install -y libsndfile1-dev
RUN apt-get update && apt-get install -y ffmpeg

COPY msd /msd
COPY pyannote-audio-master /pyannote-audio-master
COPY .env /.env
COPY api /api
COPY credentials.json /credentials.json

CMD uvicorn api.api:app --host 0.0.0.0 --port 8000
