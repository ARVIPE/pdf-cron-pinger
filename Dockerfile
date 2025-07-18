FROM python:3.12-slim

WORKDIR /app
COPY . .

RUN pip install flask && chmod +x ping.sh

EXPOSE 10000
CMD ["python", "app.py"]
