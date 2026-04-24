# Celigo FX Design System — Docs Source

Markdown source for the **Celigo FX Design System** documentation site published on GitBook.

- **Published site:** https://celigo.gitbook.io/celigo-design-system/
- **GitBook space:** Docs (`6dVG2kxXhCSgs2Z18izG`) in the [Celigo Design System site](https://app.gitbook.com/o/hCx98aEWAei7dMUCu0xj/sites/site_TeB44)
- **Component library:** [`@celigo/fuse-ui`](https://github.com/celigo/fuse-ui) — components live there, *docs* live here
- **Storybook:** https://celigo.github.io/fuse-ui-feature/

Modeled after [shadcn/ui's docs structure](https://ui.shadcn.com/docs/components/radix/button): one page per component with a consistent layout (Preview → Usage → Examples → Variants & States → Props → Tokens → Guidelines → A11y → Related).

---

## Repo layout

```
docs/                    ← published to GitBook
  README.md              Introduction (site home)
  SUMMARY.md             Navigation
  installation.md
  components/
    README.md            Components overview
    button.md
  assets/
    button-preview.png   Figma export of node 16:42

scripts/
  import.sh              Re-trigger GitBook git-import
  publish.sh             Publish the site (idempotent)
```

The site is fed from `docs/` via GitBook's `repoProjectDirectory` config so the project README and tooling can live at the repo root without polluting the published nav.

## Authoring

Every page in `docs/` is a regular markdown file. Front-matter at the top sets the page icon and description shown in the GitBook nav:

```markdown
---
icon: circle-dot
description: A labelled action trigger for primary, secondary, outline, or ghost actions.
---

# Button
...
```

GitBook-flavoured blocks are supported and render as native components in the published site:

| Block | Use for |
| - | - |
| `{% hint style="info" %}` | Callouts, tips, warnings |
| `{% tabs %}` ... `{% tab title="npm" %}` | Code-snippet alternatives |
| `<figure>...<figcaption>` | Captioned screenshots |
| HTML tables | Props tables, token tables |

## Adding a new component

1. **Create** `docs/components/<name>.md` — copy `button.md` as a template; the section structure is the convention.
2. **Add an asset** at `docs/assets/<name>-preview.png` — pull from Figma (`get_screenshot` MCP) and reference as `../assets/<name>-preview.png`.
3. **Update nav** in `docs/SUMMARY.md` — add the new component under the `## Components` heading.
4. **Commit and push** to `main`.
5. **Re-import** by running `scripts/import.sh` (or wait for the next scheduled sync).
6. **Verify** at https://celigo.gitbook.io/celigo-design-system/components/<name>.

## Local preview

GitBook's git-sync is the source of truth — there's no local preview server. Either:

- Push a draft branch and create a [GitBook change request](https://gitbook.com/docs/collaboration/change-requests) targeting that branch, **or**
- Render markdown locally with VS Code's preview to sanity-check structure (GitBook-specific blocks won't render, but everything else will).

## Scripts

All scripts read the GitBook API token from the `GITBOOK_TOKEN` environment variable.

| Script | What it does |
| - | - |
| `scripts/import.sh` | Triggers `POST /spaces/{id}/git/import` to pull the latest commit |
| `scripts/publish.sh` | Calls `POST /orgs/{orgId}/sites/{siteId}/publish` (idempotent) |

```bash
export GITBOOK_TOKEN=gb_api_...   # any user token with admin on the space
./scripts/import.sh
./scripts/publish.sh              # only needed once after major nav changes
```

## How this site was built

- **Space:** `6dVG2kxXhCSgs2Z18izG` (the pre-existing "Docs" space inside the [Celigo Design System site](https://app.gitbook.com/o/hCx98aEWAei7dMUCu0xj/sites/site_TeB44)).
- **Content:** Imported from this repo via `POST /v1/spaces/{spaceId}/git/import` with `url` pointing at the public GitHub repo and `ref: refs/heads/main`.
- **Hierarchy:** Driven by filesystem layout — `README.md` is the section root, `SUMMARY.md` controls nav, subfolders become groups (`docs/components/` → "Components" group).
- **Assets:** PNGs in `docs/assets/` are uploaded into GitBook's storage on import and served from its CDN.
- **Publishing:** `POST /v1/orgs/{orgId}/sites/{siteId}/publish` flips the site to `published: true`. Access is via the share-link at `urls.published`.

## License

Internal Celigo content. Not for external redistribution.
