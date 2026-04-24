---
icon: sparkles
description: A library of accessible, consistent React components for Celigo product experiences.
---

# Introduction

The **Celigo FX Design System** is the single source of truth for the components, tokens, and patterns used across Celigo's product surface. It is designed to help teams build fast, accessible, and visually consistent experiences without reinventing primitives for every new feature.

{% hint style="info" %}
This site is the **documentation** — the components themselves live in the [`@celigo/fuse-ui`](https://github.com/celigo/fuse-ui) package and are showcased in [Storybook](https://celigo.github.io/fuse-ui-feature/).
{% endhint %}

## What's inside

* **Components** — Buttons, inputs, selects, dialogs, and more. Each comes with API reference, usage guidelines, and accessibility notes.
* **Design tokens** — The shared color, typography, spacing, radius, and shadow values that all components consume.
* **Patterns** — Opinionated guidance for common UI scenarios: empty states, confirmations, destructive actions, disabled controls.

## How to use this site

If you're…

* **Starting a new screen** — jump to [Installation](installation.md), then browse [Components](components/) to find the primitives you need.
* **Implementing a Figma design** — each component page shows the matching Figma node and the exact props to reach for.
* **Deciding between two components** — the "Related components" section at the bottom of each page is usually the fastest way to resolve it.

## Principles

1. **Accessible by default.** Every interactive component ships with focus rings, keyboard support, and proper semantics. You should not have to think about ARIA roles for standard use.
2. **One canonical way.** For each UI need, there is one component and one recommended pattern. Variants exist for emphasis, not for taste.
3. **Tokens over values.** Colors, spacing, and radii always come from design tokens — never raw hex or pixel values.
4. **Progressive disclosure.** Components have sensible defaults. You only reach for props when you genuinely need to deviate.

## Contributing

The design system is maintained by the FX team. File issues, propose changes, and track roadmap work in the [`celigo/fuse-ui`](https://github.com/celigo/fuse-ui) repository.
