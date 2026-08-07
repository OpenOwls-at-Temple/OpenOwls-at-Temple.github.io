# `_scratch/` — draft workspace (never published)

This folder is a **staging area for work-in-progress blog posts**. Because its
name starts with an underscore, **Jekyll ignores it entirely** — nothing here
is ever built or shown on the live site. Edit freely; you can't break the site
from in here.

## What's in here

| File | What it is |
| --- | --- |
| `TEMPLATE-student-project-showcase.md` | The blank template. **Copy this** to start a new project post. |
| `2026-08-06-owl-jeopardy.md` | A filled-in **example** (with sample students) showing what a finished post looks like. |
| `owl-jeopardy-preview.html` | A standalone visual preview of that example. **Double-click to open in a browser** — no Jekyll needed. |

## Workflow

1. **Students draft here.** Copy `TEMPLATE-student-project-showcase.md` to a new
   file, e.g. `2026-11-20-owl-jeopardy.md`, and fill it in. Add profile photos
   to `assets/images/team/`.
2. **Professor reviews and edits** the draft in this folder.
3. **When it's ready to go live**, do two things:
   - Set `published: true` in the front matter (it's `false` while drafting).
   - **Copy the `.md` file into `_posts/`.**
   Then commit and push. GitHub Pages rebuilds in ~1 minute, and the post
   appears automatically under "Student Posts" on the Blog page.

That's it — no menus or links to wire up. The post's URL and its listing are
generated from the front matter.

## Notes

- The `.html` preview is a **static snapshot** — it does **not** update when you
  edit the `.md`. It's just a visual reference for the finished look. To see live
  changes as you edit, run the site locally (`bundle exec jekyll serve`).
- Keep `published: false` on anything still in this folder, as a safety net.
