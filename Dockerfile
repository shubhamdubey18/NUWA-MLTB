FROM arakurumi/mltb:latest

WORKDIR /app
RUN chmod 777 /app

RUN apk add --no-cache \
    gcc g++ python3-dev libxml2-dev libxslt-dev libffi-dev openssl-dev musl-dev

RUN python3 -m venv .venv
COPY requirements.txt .
RUN .venv/bin/pip install --no-cache-dir --upgrade pip && \
    .venv/bin/pip install --no-cache-dir -r requirements.txt

COPY . .

RUN sed -i 's/\r$//' *.sh

CMD ["bash", "start.sh"]
