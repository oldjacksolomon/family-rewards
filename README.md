# Family Rewards Dashboard

A self-contained, single-page app for tracking kids' reward points and cash-outs.
No backend required — all data is stored in the browser's `localStorage`.

## Quick start

### Requirements
- **Python 3** (recommended) — ships with Windows/macOS/Linux
  _or_ **Node.js** (for `npx serve` fallback)

### Run locally

**Linux / macOS / Git Bash:**
```bash
bash serve.sh
```

**Windows (Command Prompt):**
```bat
serve.bat
```

**Manual (Python 3):**
```bash
python3 serve.py
# or
python serve.py
```

Then open **http://localhost:8080** in your browser.

The port can be overridden with the `PORT` environment variable:
```bash
PORT=3000 bash serve.sh
```

## File structure

```
family-rewards/
├── index.html   # The full dashboard (self-contained, no build step)
├── serve.py     # Python 3 static file server
├── serve.sh     # Bash launcher (tries Python, falls back to npx serve)
├── serve.bat    # Windows launcher
├── .gitignore
└── README.md
```

## OpenClaw usage

Tell your OpenClaw agent:

> "Clone `<repo-url>`, cd into `family-rewards`, and run `bash serve.sh`. Then open http://localhost:8080."

OpenClaw can also keep the server running in the background and relaunch it after a reboot if you set that up as a recurring skill.

## Features

- Add / remove children with custom avatars
- Award or deduct points with optional reasons
- Cash out points at **10 pts = $1.00**
- Full activity log and cash-out history
- Export all data to CSV
- Data persists across page reloads via `localStorage`
