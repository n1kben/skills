---
name: checkpoint
description: Preserve continuity for a future session resuming unfinished work.
argument-hint: "What should the next session focus on?"
disable-model-invocation: true
---

Create a checkpoint for a future session that will resume this work.

That session can read the project's artifacts but not this conversation. So capture what lives only in the conversation and would otherwise be lost. Record why things matter, not just what happened — and the state of the work, not the history of the conversation.

Treat artifacts as the source of truth; surround them with the context they can't carry on their own. Include the set of relevant files when that selection is itself state worth preserving.

Use whichever of these sections earn their place:

## Context

Framing, goals, constraints, and assumptions that shape the work.

## Decisions

What was decided and why, alternatives rejected, and reasoning that would be hard to reconstruct later. Mark unsettled decisions tentative.

## Open Questions

Unresolved decisions, risks, low-confidence areas, investigations in progress.

## Next Steps

The most likely next actions or decision points.

If arguments were provided, treat them as the next session's focus.

Write the checkpoint to `"$(mktemp -d)/checkpoint-<slug>.md"` (`<slug>` is a short kebab-case name fitting the subject), then print it inline.
