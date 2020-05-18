FROM golang:1.14.3-stretch

RUN apt update \
    && apt install -y ffmpeg \
    && rm -rf /var/lib/apt/lists/*



