#!/usr/bin/env python3
"""Game-dev team telemetry logger - appends tool usage events to JSONL.

Reads PostToolUse hook data from stdin, writes structured events to:
  ~/.claude/team-logs/game-dev.jsonl

Each line is a JSON object:
  {"ts": "ISO8601", "tool": "Write", "file": "src/Player.cs", "team": "game-dev", "status": "ok"}
"""

import json
import sys
from datetime import datetime, timezone
from pathlib import Path

TEAM = "game-dev"
LOG_DIR = Path.home() / ".claude" / "team-logs"
LOG_FILE = LOG_DIR / f"{TEAM}.jsonl"


def main():
    try:
        raw = sys.stdin.read()
        if not raw.strip():
            return

        data = json.loads(raw)

        tool_name = data.get("tool_name", "unknown")
        tool_input = data.get("tool_input", {})

        # Extract file path from common tool inputs
        file_path = (
            tool_input.get("file_path")
            or tool_input.get("path")
            or tool_input.get("pattern")
            or ""
        )

        event = {
            "ts": datetime.now(timezone.utc).isoformat(),
            "team": TEAM,
            "tool": tool_name,
            "file": file_path,
            "status": "ok",
        }

        LOG_DIR.mkdir(parents=True, exist_ok=True)

        with open(LOG_FILE, "a", encoding="utf-8") as f:
            f.write(json.dumps(event) + "\n")

    except Exception:
        # Telemetry should never break the workflow
        pass


if __name__ == "__main__":
    main()
