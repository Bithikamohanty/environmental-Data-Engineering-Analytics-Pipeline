# environmental-Data-Engineering-Analytics-Pipeline
# Overview

This repository showcases a comprehensive Environmental Data Engineering and Analytics pipeline built using Python, SQL, Docker, and cloud-ready databases.
The project demonstrates end-to-end ETL workflows across multiple data formats (CSV, JSON) and multiple databases (PostgreSQL, MongoDB), followed by advanced exploratory and statistical analysis with rich visualizations.
The work is organised into three real-world environmental data domains:
Weather observations
Irish precipitation trends
Greenhouse gas emissions
Each pipeline is containerised with Docker and reproducible using Docker Compose.

# Key Technologies

Python: pandas, numpy, SQLAlchemy, psycopg2, pymongo
Databases: PostgreSQL, MongoDB Atlas
Data Formats: CSV, JSON-stat
Visualisation: matplotlib, seaborn, plotly, missingno
DevOps: Docker, Docker Compose
Environment Management: .env files

# Project Components
1. Weather Data ETL & Analysis
Objective:
Load raw weather CSV data into PostgreSQL, clean and normalise it, and perform statistical and anomaly analysis.
Key Steps:
Load raw CSV into PostgreSQL (rawdataset)
Clean and normalise data into cleandataset
Create analytical tables:
weatherprocessed
weatheryearlysummary
Perform:
Descriptive statistics
Anomaly detection
Rolling variability analysis
Generate visualisations using matplotlib and seaborn

Notebook:
APDV_24207438_AJ.ipynb

2. Irish Precipitation ETL & Exploratory Analysis

Objective:
Analyse long-term Irish monthly precipitation trends with seasonal and station-level insights.

Key Steps:
Load precipitation CSV into PostgreSQL
Parse year-month strings into datetime

Engineer features:
Year, month, month name
Season (Winter, Spring, Summer, Autumn)
Station type (Coastal / Inland)
Focused analysis for 2009–2023

Visualise:
Missing data patterns
Distributions and seasonal trends
Extreme precipitation events

Notebook:
APDV_24330710_VB.ipynb

3. Greenhouse Gas Emissions ETL & Analytics

Objective:
Ingest complex JSON-stat greenhouse gas data and transform it into a relational analytics-ready structure.

Key Steps:
Load JSON-stat emissions data
Store raw JSON in MongoDB Atlas
Flatten multidimensional JSON into a structured DataFrame
Persist cleaned data into PostgreSQL

Perform:
Time-series analysis
Sector-wise emission comparisons
Create interactive visualisations

Notebook:
APDV_24223387_BM.ipynb
