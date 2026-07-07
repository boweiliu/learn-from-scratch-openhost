FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        bash ca-certificates caddy curl git jq nodejs npm python3 tini ttyd \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @anthropic-ai/claude-code

ENV IS_SANDBOX=1
ENV HOME=/workspace/home
ENV PAYLOAD_REPO=https://github.com/NayanaBannur/learn-from-scratch.git
ENV PAYLOAD_REF=main
ENV APP_PORT=8080
ENV VITE_PORT=5173
ENV TTYD_PORT=7681

WORKDIR /app
COPY Caddyfile /app/Caddyfile
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/usr/bin/tini", "--", "/app/entrypoint.sh"]
