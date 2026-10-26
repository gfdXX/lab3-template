FROM python:3.11-slim

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all services
COPY services/ ./services/

# Copy pytest configuration
COPY pytest.ini ./

# Copy start script
COPY start.sh ./
RUN chmod +x start.sh

# Expose all ports (will be overridden in docker-compose)
EXPOSE 8050 8060 8070 8080

# Use start script to determine which service to start
ENTRYPOINT ["./start.sh"]

