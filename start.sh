#!/bin/bash

# Get service name from environment variable
SERVICE_NAME=${SERVICE_NAME:-gateway}

# Set default port if not provided
PORT=${PORT:-8080}

case $SERVICE_NAME in
  "gateway")
    echo "Starting Gateway Service on port $PORT"
    uvicorn services.gateway_service.main:app --host 0.0.0.0 --port $PORT
    ;;
  "cars")
    echo "Starting Cars Service on port $PORT"
    uvicorn services.cars_service.main:app --host 0.0.0.0 --port $PORT
    ;;
  "rental")
    echo "Starting Rental Service on port $PORT"
    uvicorn services.rental_service.main:app --host 0.0.0.0 --port $PORT
    ;;
  "payment")
    echo "Starting Payment Service on port $PORT"
    uvicorn services.payment_service.main:app --host 0.0.0.0 --port $PORT
    ;;
  *)
    echo "Unknown service: $SERVICE_NAME"
    echo "Available services: gateway, cars, rental, payment"
    exit 1
    ;;
esac
