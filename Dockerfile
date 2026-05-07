FROM 5hojib/aeon:latest

WORKDIR /app
RUN chmod 777 /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc g++ python3-dev libxml2-dev libxslt-dev libffi-dev libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN uv venv
COPY requirements.txt .
RUN uv pip install --no-cache-dir -r requirements.txt

COPY . .

RUN sed -i 's/\r$//' *.sh

CMD ["bash", "start.sh"]
