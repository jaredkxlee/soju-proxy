FROM alpine:latest

# 1. Install Tinyproxy
RUN apk add --no-cache tinyproxy

# 2. Configure it (Allow everyone, enable Auth)
RUN sed -i 's/^Allow /#Allow /' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#BasicAuth/BasicAuth/' /etc/tinyproxy/tinyproxy.conf && \
    echo "BasicAuth jaredlkx 12345678" >> /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#DisableViaHeader/DisableViaHeader/' /etc/tinyproxy/tinyproxy.conf

# 3. MAGIC COMMAND: Replace the default port 8888 with Render's $PORT at startup
CMD sh -c "sed -i 's/^Port 8888/Port $PORT/' /etc/tinyproxy/tinyproxy.conf && tinyproxy -d"
