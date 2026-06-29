---
name: slicing
description: Break a plan into independently shippable vertical slices, each with a release strategy. Use when the user wants to split work into pieces before building, or uses any 'slice' trigger phrases.
---

# Slicing

Actively cut the work into vertical slices and settle how each one ships. This is the discipline of building a breakdown, not a reference on what a slice is. Present the slices in the conversation and sharpen them there.

A **slice** is a tracer bullet: a thin but complete path through every layer it touches, demoable on its own. Cutting one layer at a time is the mistake; it leaves nothing usable until the last piece lands.

## A good slice

- Goes end to end. The first slice is the thinnest path that proves the pieces connect, built from real code you keep.
- Stands alone. It is demoable or verifiable the moment it lands; if nothing is, it is not a slice yet.
- Builds only on slices already shipped, so order them that way.
- Ships safely, naming how it reaches production without breaking what is live.

Do any behaviour-preserving refactoring first, as its own slice: make the change easy, then make the easy change.

## Shipping a slice

A slice is done when it is live, not when the code works. Choose how each one gets there:

- **Feature flag** — merge and deploy it dark, then turn it on progressively, so a half-built feature ships in slices without being exposed.
- **Expand then contract** — for schema changes, add the new shape alongside the old and tolerate both, backfill, move reads and writes across, then drop the old shape in a later slice. Each step deploys and reverts on its own.
- **Backwards compatibility** — prefer additive change. While both versions are live, accept the old and new shapes alike instead of forcing a lockstep deploy.
