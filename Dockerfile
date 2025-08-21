FROM python:3.11

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN SECRET_KEY=$(openssl rand -hex 32) && echo "SECRET_KEY=${SECRET_KEY}" >> .env

EXPOSE 5000

CMD ["python", "app.py"]