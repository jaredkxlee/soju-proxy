FROM mhdzumair/mediaflow-proxy:latest

# Set your password
ENV API_PASSWORD=12345678

# MAGIC FIX: We use 'python -m uvicorn' instead of just 'uvicorn'.
# This tells Python to find the tool itself, so we don't get "Command not found".
CMD ["sh", "-c", "python -m uvicorn mediaflow_proxy.main:app --host 0.0.0.0 --port $PORT"]
