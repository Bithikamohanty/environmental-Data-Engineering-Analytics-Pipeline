# Greenhouse Gas Emissions ETL and Analytics

This project ingests JSON-stat greenhouse gas emissions data, stores the raw JSON in MongoDB Atlas, flattens it into a structured table with statistic, year, sector, and value columns, and persists the cleaned emissions data into PostgreSQL for further analysis and visualization. [file:3]

## Data Flow

- Load JSON file (e.g. `C17.20251202T161248.json`) into Python and flatten dimensions and values into a pandas DataFrame. [file:3]  
- Upload the original JSON document(s) into MongoDB Atlas collection `rawemissions` in database `greenhousedata`. [file:3]  
- Optionally re-extract and save a cleaned JSON snapshot to `extractedrawdata.json`. [file:3]  
- Build a full emissions table with combinations of statistics, years, and sectors plus the numeric `value`. [file:3]  
- Save the emissions DataFrame into a PostgreSQL database (table such as `emissions_clean`) via psycopg2/SQLAlchemy. [file:3]  
- Produce descriptive statistics and interactive visualizations of emissions over time using matplotlib, seaborn, and plotly. [file:3]

## Files

- `APDV_24223387_BM.ipynb` – notebook containing JSON processing, MongoDB load, DataFrame construction, and Postgres load. [file:3]  
- `C17.20251202T161248.json` – source JSON-stat dataset (expected alongside the notebook). [file:3]  
- `extractedrawdata.json` – extracted raw JSON array saved back from MongoDB. [file:3]  
- `requirements.txt` – Python dependencies.  
- `bithika.env` – environment configuration for MongoDB and PostgreSQL connections.  
- `Dockerfile` – container image for running the notebook and ETL.  
- `docker-compose.yaml` – multi-service setup for PostgreSQL and the app.

## Environment and Connections

MongoDB Atlas:

- Username: `BithikaMohanty`  
- Password: `APDV@24223387`  
- Cluster host: `apdv24223387.gunpsst.mongodb.net`  
- Database: `greenhousedata`  
- Collection: `rawemissions`  
- URI pattern: `mongodb+srv://BithikaMohanty:<password>@apdv24223387.gunpsst.mongodb.net/greenhousedata?retryWrites=true&w=majority&appName=APDV24223387` [file:3]

PostgreSQL (Docker):

- Service/container: `pg_emissions`  
- User: `BithikaMohanty`  
- Password: `APDV@24223387`  
- Database: `greenhouse_data`  
- Port: `5432`  
- Run command equivalent:

docker run --name pg_emissions
-e POSTGRES_USER=BithikaMohanty
-e POSTGRES_PASSWORD="APDV@24223387"
-e POSTGRES_DB=greenhouse_data
-p 5432:5432
-d postgres:15


The notebook connects to these services using `pymongo.MongoClient` for MongoDB and psycopg2/SQLAlchemy URL `postgresql+psycopg2://user:password@host:port/dbname`. [file:3]

## Running with Docker Compose

1. Place the JSON source file and notebook in the project directory.  
2. Build and start:

docker-compose up --build


3. Open the notebook at `http://localhost:8888`, adjust connection cells to read environment variables if desired, and run the ETL:  
- Pull raw data from `C17.20251202T161248.json`.  
- Load and confirm data in MongoDB (`rawemissions`).  
- Flatten and write to PostgreSQL `greenhouse_data`. [file:3]