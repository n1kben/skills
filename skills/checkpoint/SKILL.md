---
name: checkpoint
description: Preserve continuity for a future session resuming unfinished work.
argument-hint: "What should the next session focus on?"
disable-model-invocation: true
---

Create a checkpoint for the next session resuming this work. It can read the project's artifacts but not this conversation, so reference those by path or URL rather than repeating them, and capture what the conversation arrived at, not how it got there. Be explicit about what's still unknown, unresolved, or low-confidence — that's what it should probe first.

Treat any arguments as the focus. Write it to a file in the OS temp directory (not the workspace), then print it inline.
