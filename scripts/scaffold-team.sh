#!/bin/sh
# scaffold-team.sh - Create a new agent team from the template
#
# Usage:
#   bash scripts/scaffold-team.sh <team-name> "<description>" "<agent1 agent2 agent3>"
#
# Example:
#   bash scripts/scaffold-team.sh data-pipeline "Data pipeline team" "ingester transformer validator"
#
# POSIX-compatible (works in Git Bash on Windows, macOS, Linux)

set -e

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <team-name> \"<description>\" \"<agent1 agent2 ...>\""
    echo ""
    echo "Example:"
    echo "  $0 data-pipeline \"Data pipeline development team\" \"ingester transformer validator\""
    exit 1
fi

TEAM_NAME="$1"
DESCRIPTION="$2"
AGENTS="$3"

# Resolve paths relative to script location
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE_DIR="$ROOT_DIR/teams/_template"
TEAM_DIR="$ROOT_DIR/teams/$TEAM_NAME"

if [ -d "$TEAM_DIR" ]; then
    echo "Error: Team directory already exists: $TEAM_DIR"
    exit 1
fi

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "Error: Template directory not found: $TEMPLATE_DIR"
    exit 1
fi

echo "Creating team: $TEAM_NAME"
echo "Description: $DESCRIPTION"
echo "Agents: $AGENTS"
echo ""

# Copy template
cp -r "$TEMPLATE_DIR" "$TEAM_DIR"

# Remove the agent template file (it's just for reference)
rm -f "$TEAM_DIR/agents/_agent-template.md"

# Rename the main command file
mv "$TEAM_DIR/commands/team.md" "$TEAM_DIR/commands/$TEAM_NAME.md"

# Rename skills directory
if [ -d "$TEAM_DIR/skills/team-conventions" ]; then
    mv "$TEAM_DIR/skills/team-conventions" "$TEAM_DIR/skills/${TEAM_NAME}-conventions"
fi

# Substitute placeholders in all files
# Using a portable approach that works on macOS and Linux
find "$TEAM_DIR" -type f | while read -r file; do
    # Create temp file, substitute, replace original
    tmp_file="${file}.tmp"

    sed "s/__TEAM__/$TEAM_NAME/g" "$file" > "$tmp_file"
    mv "$tmp_file" "$file"

    tmp_file="${file}.tmp"
    sed "s/__DESCRIPTION__/$DESCRIPTION/g" "$file" > "$tmp_file"
    mv "$tmp_file" "$file"
done

# Build members array for team.json
MEMBERS_JSON=""
MEMBER_COUNT=0
for agent in $AGENTS; do
    if [ "$MEMBER_COUNT" -gt 0 ]; then
        MEMBERS_JSON="$MEMBERS_JSON,"
    fi
    # Convert agent name to title case for role
    ROLE="$(echo "$agent" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')"
    MEMBERS_JSON="$MEMBERS_JSON
    {
      \"agent\": \"$agent\",
      \"role\": \"$ROLE\",
      \"model\": \"sonnet\",
      \"phase\": \"execution\"
    }"
    MEMBER_COUNT=$((MEMBER_COUNT + 1))
done

# Create team.json with actual members
cat > "$TEAM_DIR/team.json" << TEAMEOF
{
  "team": "$TEAM_NAME",
  "version": "1.0.0",
  "description": "$DESCRIPTION",
  "members": [
    {
      "agent": "code-explorer",
      "role": "Codebase Analyst",
      "model": "sonnet",
      "phase": "discovery"
    },$MEMBERS_JSON
  ],
  "workflows": {
    "feature": {
      "phases": ["discovery", "planning", "execution", "review", "summary"]
    },
    "bugfix": {
      "phases": ["discovery", "execution", "review"]
    }
  }
}
TEAMEOF

# Create agent files for each specified agent
for agent in $AGENTS; do
    AGENT_FILE="$TEAM_DIR/agents/$agent.md"
    ROLE="$(echo "$agent" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')"

    cat > "$AGENT_FILE" << AGENTEOF
---
name: ${TEAM_NAME}-${agent}
description: ${ROLE} specialist for the ${TEAM_NAME} team
tools: Glob, Grep, Read, Write, Edit, Bash
model: sonnet
color: cyan
---

You are a ${ROLE} specialist on the ${TEAM_NAME} team.

## Core Mission

[Define what this agent specializes in]

## Approach

**1. Analysis**
- Understand the task requirements within your domain
- Review existing code patterns and conventions

**2. Execution**
- Implement changes following project conventions
- Write clean, well-tested code

**3. Verification**
- Validate your changes work correctly
- Check for regressions

## Output Guidance

Provide:
- Files changed with specific paths and line references
- Rationale for decisions made
- Any issues or risks identified
- Suggested follow-up tasks
AGENTEOF

    echo "  Created agent: $agent"
done

echo ""
echo "Team '$TEAM_NAME' created at: $TEAM_DIR"
echo ""
echo "Next steps:"
echo "  1. Customize agent files in $TEAM_DIR/agents/"
echo "  2. Update the orchestrator command in $TEAM_DIR/commands/$TEAM_NAME.md"
echo "  3. Add team to .claude-plugin/marketplace.json"
echo "  4. Update skills in $TEAM_DIR/skills/"
