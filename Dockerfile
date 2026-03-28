FROM node:20-slim

RUN apt-get update && apt-get install -y \
    curl git zsh fzf build-essential \
    python3 python3-pip python3-venv \
    sqlite3 libsqlite3-dev \
    ripgrep jq wget \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @anthropic-ai/claude-code pnpm

RUN useradd -m -s /bin/zsh -u 501 claude
USER claude

WORKDIR /workspace

ENTRYPOINT ["claude"]
