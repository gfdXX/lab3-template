FROM python:3.11-slim

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all services
COPY services/ ./services/

# Copy pytest configuration
COPY pytest.ini ./

# Create startup script
COPY start.sh ./
RUN chmod +x start.sh

# Expose port
EXPOSE $PORT

# Use startup script
CMD ["./start.sh"]

