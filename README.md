# Learn From Scratch OpenHost Wrapper

OpenHost wrapper for `https://github.com/NayanaBannur/learn-from-scratch`.

This app runs one container with two owner-authenticated surfaces:

- `/` — the Learn From Scratch Vite frontend served from a live writable checkout.
- `/terminal/` — a `ttyd` shell in that checkout for running Claude Code and the bundled `.claude/skills/learn-from-scratch` workflow.

The payload repo is cloned into `OPENHOST_APP_DATA_DIR/workspace/learn-from-scratch`, so generated topics and local content survive restarts/redeploys. The app requests `ANTHROPIC_API_KEY` from the OpenHost secrets service and exports it to the terminal/Vite process environment at startup.
