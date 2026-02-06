---
description: Show game-dev team status and recent activity
argument-hint: [verbose]
---

# Game Dev Team Status

**Actions**:

1. Read `team.json` from the plugin root to display team composition
2. Check for the team log file at `~/.claude/team-logs/game-dev.jsonl`
3. If the log exists, read the last 20 entries and summarize:
   - Recent tool usage by agent
   - Files touched
   - Time of last activity
4. Display team roster with roles, models, and workflow phases:

   | Agent | Role | Model | Phase |
   |-------|------|-------|-------|
   | code-explorer | Codebase Analyst | sonnet | discovery |
   | engine-dev | Engine & Systems Programmer | sonnet | execution |
   | gameplay-dev | Gameplay & Mechanics Programmer | sonnet | execution |
   | level-designer | Level/Scene/World Designer | sonnet | execution |
   | asset-pipeline | Asset Pipeline & Build Engineer | sonnet | execution |
   | qa-tester | QA & Playtesting Engineer | sonnet | review |

5. Display available workflows:

   | Workflow | Phases |
   |----------|--------|
   | feature | discovery > planning > execution > review > summary |
   | mechanic | discovery > planning > execution > review > summary |
   | bugfix | discovery > execution > review |
   | optimization | discovery > execution > review |

6. Display supported engines:

   | Engine | Language | Skill |
   |--------|----------|-------|
   | Unity | C# | unity |
   | Unreal Engine | C++/Blueprints | unreal |
   | Godot | GDScript/C# | godot |
   | Three.js/R3F | TypeScript | threejs |
   | Microsoft Orleans | C# | orleans |

7. If `$ARGUMENTS` contains "verbose", show full log entries

Present the information in a clean, formatted summary.
