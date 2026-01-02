# Weather Data ETL and Analysis

This project loads a CSV weather dataset into PostgreSQL, performs cleaning and transformations using SQLAlchemy and pandas, and generates visual analyses such as distributions, anomaly detection, and rolling variability metrics. [file:1]

## Features

- Load CSV data into PostgreSQL (`rawdataset` table). [file:1]  
- Clean and normalize data into `cleandataset`. [file:1]  
- Create processed tables: `weatherprocessed` and `weatheryearlysummary`. [file:1]  
- Perform descriptive statistics, anomaly detection, and plots with matplotlib and seaborn. [file:1]

## Project Structure

- `APDV_24207438_AJ.ipynb` – Main Jupyter notebook containing all ETL, cleaning, and analysis steps. [file:1]  
- `requirements.txt` – Python dependencies for running the notebook.  
- `Dockerfile` – Container image definition for running the notebook against PostgreSQL.  
- `docker-compose.yml` – Orchestration for app container + PostgreSQL.  
- `abhishek.env` – Environment variables (database connection).  

## Prerequisites

- Docker and Docker Compose installed.
- The CSV input file (e.g. `C06.20251202T161217.csv`) available in the working directory or mounted into the container. [file:1]

## Environment

The notebook connects to PostgreSQL using host, port, database, username, and password parameters that match the PostgreSQL container. [file:1]

Values used:

- `POSTGRES_USER=AbhishekJ`  
- `POSTGRES_PASSWORD=APDV#24207438`  
- `POSTGRES_DB=assignment_APDV`  
- `POSTGRES_HOST=postgres_assignment` (service name in `docker-compose.yml`)  
- `POSTGRES_PORT=5432`  

These are defined in `abhishek.env`.

## Running with Docker Compose

1. Build and start containers:

docker-compose up --build


2. Access the notebook server (default):

- URL: `http://localhost:8888`
- Open `APDV_24207438_AJ.ipynb` inside the container and run the cells.

3. PostgreSQL access:

- Host: `postgres_assignment` (from within app container)  
- Host: `localhost` (from your machine)  
- Port: `5432`  
- Database: `assignment_APDV`  
- User: `AbhishekJ`  
- Password: `APDV#24207438`  

## Direct PostgreSQL Run (Without Compose)

If you want only the database:

docker run --name postgres_assignment
-e POSTGRES_USER=AbhishekJ
-e POSTGRES_PASSWORD="APDV#24207438"
-e POSTGRES_DB=assignment_APDV
-p 5432:5432
-d postgres:15


Then run the notebook on your host, ensuring the connection uses `localhost:5432` with these credentials. [file:1]
