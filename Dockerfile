FROM python:3.11-slim

COPY quantis/bin/EasyQuantis /bin/
COPY quantis/lib64/ /lib64/
COPY quantis/lib64/ /lib/x86_64-linux-gnu/

COPY main.py /app/
WORKDIR /app

CMD python3 main.py