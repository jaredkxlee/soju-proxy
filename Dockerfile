# Use the official FlareSolverr image
FROM flaresolverr/flaresolverr:latest

# Set the port to match Render's requirement
ENV PORT=8191
ENV LOG_LEVEL=info
ENV LOG_HTML=false
ENV CAPTCHA_SOLVER=none

# Expose the port
EXPOSE 8191
