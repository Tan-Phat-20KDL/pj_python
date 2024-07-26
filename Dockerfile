FROM python:3.9


WORKDIR /app


COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN pip install python-dotenv
RUN apt-get update && apt-get install -y \
    python3-venv \
    iputils-ping \
    curl

COPY . .
COPY main.py /app/main.py
COPY .env .env

ENTRYPOINT [ "python" ]
CMD ["main.py"]

EXPOSE 5000

