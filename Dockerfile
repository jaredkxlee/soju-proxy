FROM mhdzumair/mediaflow-proxy:latest

# Set your password
ENV API_PASSWORD=12345678

# MAGIC COMMAND: This tells the app to listen on whatever port Render assigns.
CMD ["sh", "-c", "uvicorn mediaflow_proxy.main:app --host 0.0.0.0 --port $PORT"]
