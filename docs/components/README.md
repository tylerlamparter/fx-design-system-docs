---
icon: shapes
description: The component catalog — every primitive in the FX Design System.
---

# Components

Every component in the FX Design System is built for real Celigo product work. They combine consistent tokens, accessible defaults, and a focused API so you can build a screen in minutes without second-guessing the details.

## Browse

<table data-view="cards">
  <thead>
    <tr>
      <th></th>
      <th></th>
      <th data-hidden data-card-target data-type="content-ref"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Button</strong></td>
      <td>Labelled action trigger — four hierarchy levels, optional icons, destructive variant.</td>
      <td><a href="button.md">button.md</a></td>
    </tr>
  </tbody>
</table>

## Anatomy of a component page

Each component page follows the same structure so you always know where to look:

1. **Overview** — what the component does and when to reach for it
2. **Visual reference** — a screenshot from Figma (or live preview where available)
3. **Variants & states** — the full matrix of types, sizes, and interactive states
4. **Props / API** — every prop, its type, default, and purpose
5. **Usage example** — copy-pasteable TSX snippets for the most common cases
6. **Design tokens** — the exact tokens the component consumes, so you can theme consistently
7. **Usage guidelines** — `Do` / `Don't` lists for real product decisions
8. **Accessibility** — keyboard, screen reader, and contrast notes
9. **Related components** — pointers to siblings and alternatives

If a page is missing a section, it's because the component doesn't need it — not because it was forgotten.

## Naming conventions

| Term | Meaning |
| - | - |
| **Type** | The visual hierarchy of a component (e.g. `Primary`, `Secondary`, `Outline`, `Ghost`) |
| **Size** | The physical scale of a component (e.g. `xs`, `sm`, `md`, `lg`) |
| **State** | The interactive state (e.g. `Default`, `Hover`, `Focused`, `Disabled`) |
| **Destructive** | Applied to any type to signal an irreversible or dangerous action |

These terms have the same meaning across every component — so once you've learned them for Button, they carry over to everything else.
