# Claude Code Docker

Run [Claude Code](https://claude.ai/claude-code) in an isolated Docker container with `--dangerously-skip-permissions` enabled.

## Prerequisites

- Docker installed and running
- Logged into Claude Code locally (`claude login`)

## Quick Install

Add `claude-docker` as a global command:

```bash
sudo ln -s "$(pwd)/claude-docker" /usr/local/bin/claude-docker
```

3. From any project folder:

```bash
# Interactive mode
claude-docker

# One-shot prompt
claude-docker "refactor the auth module"
```

The image is built automatically on first run.

## Manual Usage

### Build

```bash
docker build -t claude-code .
```

### Run

```bash
docker run -it \
  -v <project-path>:/workspace \
  -v ~/.claude:/home/claude/.claude \
  -v ~/.claude.json:/home/claude/.claude.json \
  claude-code --dangerously-skip-permissions
```

Replace `<project-path>` with the absolute path to the project you want to work on.

### One-shot prompt (non-interactive)

```bash
docker run -it \
  -v ~/git/fiplan:/workspace \
  -v ~/.claude:/home/claude/.claude \
  -v ~/.claude.json:/home/claude/.claude.json \
  claude-code -p --dangerously-skip-permissions "Your prompt here"
```

## Notes

- Auth is shared from your host via `~/.claude/` and `~/.claude.json` mounts. Run `claude login` on the host if your session expires.
- `--dangerously-skip-permissions` bypasses all permission prompts — only use on code you trust.
- The script mounts your current working directory as `/workspace`, so all files and subfolders are accessible.
