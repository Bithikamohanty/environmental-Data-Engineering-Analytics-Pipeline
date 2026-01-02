\# Precipitation Data ETL and Analysis



This project loads an Irish monthly precipitation CSV dataset into PostgreSQL, cleans and engineers features, and performs exploratory and advanced visual analysis for 1960–2023 with a focus on 2009–2023. \[file:2]



\## Features



\- Prompt for PostgreSQL connection details and CSV path, then load the CSV to a table (e.g. `precipitation`). \[file:2]  

\- Read the table back into pandas and inspect data types, nulls, and basic info. \[file:2]  

\- Explicitly parse year–month strings to a datetime column (`Monthdt`) and derive `Year`, `MonthNum`, `MonthName`. \[file:2]  

\- Add `Season` (Winter, Spring, Summer, Autumn) based on month number and classify stations as `Coastal` or `Inland`. \[file:2]  

\- Filter the dataset to 2009–2023 for focused analysis. \[file:2]  

\- Visualize missing data with `missingno`, distributions, seasonal patterns, station‑wise averages, and extreme precipitation events using matplotlib, seaborn, and plotly. \[file:2]



\## Project Structure



\- `APDV\_24330710\_VB.ipynb` – Main notebook with ETL, feature engineering, and analysis. \[file:2]  

\- `requirements.txt` – Python dependencies.  

\- `Dockerfile` – Image definition to run the notebook against PostgreSQL.  

\- `docker-compose.yml` – Multi‑container setup for PostgreSQL + notebook.  

\- `varsha.env` – Environment variables for DB connection.



\## Database Configuration



The notebook currently uses interactive inputs:



\- Host (default `localhost`)  

\- Port (default `5432`)  

\- Database name (e.g. `precipitation`)  

\- Username: `VarshaBalip`  

\- Password: `APDV24331710`  

\- Table name: `precipitation`  



and builds a SQLAlchemy URL `postgresql+psycopg2://DBUSER:DBPASSWORD@DBHOST:DBPORT/DBNAME`. \[file:2]



In Docker/Compose, these values are provided via `varsha.env` and the host becomes the service name `postgres\_precip`.  



\## Running with Docker Compose



1\. Build and start:



docker-compose up --build





2\. Notebook:



\- Visit `http://localhost:8888`

\- Open `APDV\_24330710\_VB.ipynb`.

\- Either:

&nbsp; - Change the connection cell to read `os.getenv(...)`, or

&nbsp; - When prompted, use:

&nbsp;   - Host: `postgres\_precip`

&nbsp;   - Port: `5432`

&nbsp;   - DB name: `precipitation`

&nbsp;   - User: `VarshaBalip`

&nbsp;   - Password: `APDV24331710`

&nbsp;   - CSV path: path inside the container (e.g. `/app/Cprecepitation05.20251202T161205.csv`). \[file:2]



3\. PostgreSQL access from host:



\- Host: `localhost`  

\- Port: `5432`  

\- DB: `precipitation`  

\- User: `VarshaBalip`  

\- Password: `APDV24331710`  



\## Direct PostgreSQL Run



Without Compose, you can run only the database:



docker run --name postgres\_precip

-e POSTGRES\_USER=VarshaBalip

-e POSTGRES\_PASSWORD="APDV24331710"

-e POSTGRES\_DB=precipitation

-p 5432:5432

-d postgres:15



Then run the notebook on your host with these connection details. \[file:2]



