FROM golang:1.14.3-buster

RUN apt update \
    && apt install -y ffmpeg \
    && rm -rf /var/lib/apt/lists/*



