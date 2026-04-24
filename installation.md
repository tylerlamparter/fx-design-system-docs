---
icon: download
description: Install the FX Design System package and pull in the components you need.
---

# Installation

The FX Design System ships as the [`@celigo/fuse-ui`](https://github.com/celigo/fuse-ui) package. Drop it into any Celigo React project.

## Prerequisites

* **React** 18 or later
* **Node** 18 or later
* A build pipeline that supports ES modules (Vite, Next.js, Webpack 5 — all fine)

## Install the package

{% tabs %}
{% tab title="npm" %}
```bash
npm install @celigo/fuse-ui
```
{% endtab %}

{% tab title="pnpm" %}
```bash
pnpm add @celigo/fuse-ui
```
{% endtab %}

{% tab title="yarn" %}
```bash
yarn add @celigo/fuse-ui
```
{% endtab %}
{% endtabs %}

## Load the styles

Import the compiled stylesheet once at the root of your app — usually in `main.tsx`, `_app.tsx`, or the top-level entry file for your bundler:

```tsx
import '@celigo/fuse-ui/dist/fuse-ui.css';
```

This pulls in the design tokens, typography, and the reset rules the components rely on.

## Import a component

Once the package and styles are in place, import a component and use it:

```tsx
import { Button } from '@celigo/fuse-ui';

export function Example() {
  return (
    <Button size="md" type="Primary">
      Save changes
    </Button>
  );
}
```

## Editor setup (optional)

For the best authoring experience, we recommend:

* **TypeScript** — all components ship with full type definitions. No `@types/...` package needed.
* **ESLint** plugin `@celigo/eslint-plugin-fuse-ui` — catches common misuse at lint time (e.g. two `Primary` buttons in the same section).
* **VS Code extension** `Celigo FX Tools` — autocompletes token names and previews icons inline.

## Next steps

* Browse the [Components](components/) catalog.
* Learn the conventions in the [Button](components/button.md) reference — the patterns there apply across the system.
