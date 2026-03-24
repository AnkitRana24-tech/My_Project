FROM python:3.12.6-slim

WORKDIR /app

RUN apt-get update && apt-get upgrade -y && apt-get clean

COPY . /app

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir wheel==0.46.2 \
    && pip install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD ["python", "serve_model.py"]