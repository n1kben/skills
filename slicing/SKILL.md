---
name: slicing
description: Break a plan into independently shippable vertical slices, each with a release strategy. Use when the user wants to split work into pieces before building, or uses any 'slice' trigger phrases.
---

# Slicing

Actively break the work into vertical slices and sharpen them as you go — challenging boundaries, forcing each slice to stand on its own, and settling how it ships. This is the active discipline of producing a breakdown, not a reference on what a slice is. The breakdown lives in the conversation: present it and refine it there, don't write it to a file.

A slice is not finished when its code works — it is finished when it is live without breaking what was already there. Slicing the work and planning its release are the same job.

## What a slice is

Each slice is a **tracer bullet**: a narrow but complete path through every layer it touches — schema, API, UI, tests — that is demoable or verifiable on its own. The opposite is a **horizontal slice** that finishes one layer at a time and leaves nothing usable until the last one lands.

A tracer bullet is real code you keep and build on. Hold it apart from a **prototype**: throwaway code whose output is a decision, not shippable behaviour. When an unknown could invalidate the breakdown — an unproven API, an unclear data shape — resolve it with a prototype first; keep the knowledge, discard the code.

## Building the breakdown

Walk these moves, and challenge the breakdown as you go rather than accepting the first cut.

- **Resolve uncertainty first.** Name what you do not know yet. If an unknown could invalidate the slicing, prototype it before drafting slices.
- **Prefactor.** Make the change easy, then make the easy change. Pull any behaviour-preserving refactor that clears the way into its own first slice, separate from the slices that change behaviour.
- **Draft and order.** The first slice is the thinnest end-to-end path that proves the pieces connect — real code, not a mock. Each later slice widens that path and stays independently shippable. Order them so every slice builds only on slices already shipped.
- **Challenge each slice.** If a slice touches one layer only, or nothing is demoable when it lands, it is horizontal — push back and re-cut it. If a slice has no release mechanism, it is not sliced yet.

Present each slice with a title, what it ships, what it is blocked by, and its release mechanism.

## Release strategy

Every slice must reach production without breaking the live system. Choose per slice:

- **Feature flag** — gate behaviour that is incomplete or risky so the slice can merge and deploy dark, then turn on progressively. This is what lets a half-built feature ship in slices without exposing it.
- **Expand/contract migrations** — never change schema and code in one irreversible step. Expand (add the new column, table, or field and tolerate both shapes), deploy and backfill, switch reads and writes to the new shape, then contract (remove the old) in a later slice. Each step deploys and reverts on its own.
- **Backwards compatibility** — prefer additive changes to breaking ones. During rollout the system must accept both the old and new shapes — data, API payloads, flag states — so deploys need not happen in lockstep. Version or deprecate consumers rather than breaking them.
