FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Jupyter for notebook execution
RUN pip install --no-cache-dir jupyter

COPY . /app

EXPOSE 8888

# Default DB env; override via env_file in docker-compose
ENV POSTGRES_HOST=postgres_precip
ENV POSTGRES_PORT=5432
ENV POSTGRES_DB=precipitation
ENV POSTGRES_USER=VarshaBalip
ENV POSTGRES_PASSWORD=APDV24331710

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token="]
