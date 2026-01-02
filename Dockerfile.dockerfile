# Base image with Python
FROM python:3.11-slim

# System dependencies for psycopg2 and plotting libs
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Workdir
WORKDIR /app

# Copy dependency file and install
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Jupyter
RUN pip install --no-cache-dir jupyter

# Copy project files
COPY . /app

# Expose Jupyter port
EXPOSE 8888

# Use environment variables for DB connection
ENV POSTGRES_HOST=postgres_assignment
ENV POSTGRES_PORT=5432
ENV POSTGRES_DB=assignment_APDV
ENV POSTGRES_USER=AbhishekJ
ENV POSTGRES_PASSWORD=APDV#24207438

# Default command: start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token="]
