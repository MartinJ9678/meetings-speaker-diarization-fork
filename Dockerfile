FROM python:3.8.6-buster

COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y libsndfile1-dev
RUN sudo apt install ffmpeg

COPY msd /msd
COPY api /api

CMD uvicorn api.api:app --host 0.0.0.0 --port $PORT