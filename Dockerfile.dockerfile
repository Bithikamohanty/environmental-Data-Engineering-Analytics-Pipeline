# Dockerfile
FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir jupyter

COPY . /app

ENV MONGO_USERNAME=BithikaMohanty
ENV MONGO_PASSWORD=APDV@24223387
ENV MONGO_CLUSTER_HOST=apdv24223387.gunpsst.mongodb.net
ENV MONGO_DB=greenhousedata
ENV MONGO_COLLECTION=rawemissions
ENV POSTGRES_HOST=pg_emissions
ENV POSTGRES_PORT=5432
ENV POSTGRES_DB=greenhouse_data
ENV POSTGRES_USER=BithikaMohanty
ENV POSTGRES_PASSWORD=APDV@24223387

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token="]
