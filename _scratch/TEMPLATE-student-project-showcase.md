---
# ═══════════════════════════════════════════════════════════════════════
#  STUDENT PROJECT SHOWCASE — TEMPLATE  (not published; safe to leave here)
# ───────────────────────────────────────────────────────────────────────
#  HOW TO USE:
#   1. Copy this file to:  _posts/YYYY-MM-DD-<project-slug>.md
#      e.g.  _posts/2026-08-15-owl-jeopardy.md
#      (This TEMPLATE file has no date in its name, so Jekyll ignores it.)
#   2. Fill in the front matter below and the sections in the body.
#   3. Drop profile photos in  assets/images/team/  (square, ~600×600px).
#   4. Keep  published: false  while you edit. When it's ready to go live,
#      change it to  published: true  (or delete the line) and push.
#      Because it lives in _posts with category "student", it will then
#      appear automatically in the Blog page's "Student Posts" list.
# ═══════════════════════════════════════════════════════════════════════

layout: post
title: "PROJECT NAME: A One-Line Hook"     # e.g. "Owl Jeopardy: Review Games That Build Themselves"
author: "Student A, Student B"             # the dev team, comma-separated
project: "PROJECT NAME"                     # shows as the 📁 tag
project_url: /projects/PROJECT-SLUG/        # e.g. /projects/owl-jeopardy/  → enables the "← Back to project" link
date: 2026-01-01                            # release date
category: student                           # student | faculty | industry — keep "student" here
published: false                            # flip to true (or delete) to go live
---

<!-- ════════════════════════════════════════════════════════════════
     STYLES for the developer cards. Leave this block as-is — it uses
     the site's theme variables and works on both the standalone post
     page and the Blog page's side-panel viewer.
     ════════════════════════════════════════════════════════════════ -->
<style>
  .dev-section-label {
    font-size: 0.7rem; font-weight: 700; letter-spacing: 0.15em;
    text-transform: uppercase; color: var(--gold);
    margin: 3rem 0 0.5rem; display: block;
  }
  .dev-grid {
    display: grid; grid-template-columns: 1fr; gap: 1.5rem; margin: 1.5rem 0 1rem;
  }
  .dev-card {
    background: var(--navy-mid); border: 1px solid var(--border);
    border-radius: 14px; padding: 1.75rem;
    display: grid; grid-template-columns: 96px 1fr; gap: 1.5rem; align-items: start;
  }
  .dev-photo {
    width: 96px; height: 96px; border-radius: 50%; object-fit: cover;
    border: 2px solid var(--gold); background: var(--navy-light);
  }
  .dev-name {
    font-family: var(--font-display); font-size: 1.15rem; font-weight: 800;
    color: #fff; margin: 0 0 0.15rem; letter-spacing: -0.01em;
  }
  .dev-role { color: var(--gray); font-size: 0.85rem; margin: 0 0 0.6rem; }
  .dev-links a {
    display: inline-flex; align-items: center; gap: 0.35rem;
    font-size: 0.8rem; font-weight: 600; color: var(--gold);
  }
  .dev-body { grid-column: 1 / -1; margin-top: 0.25rem; }
  .dev-body h4 {
    font-family: var(--font-display); font-size: 0.95rem; color: var(--gold-pale);
    margin: 1.1rem 0 0.35rem;
  }
  .dev-body p { margin: 0 0 0.5rem; }
  .dev-quote {
    border-left: 3px solid var(--gold-dim); padding-left: 1rem;
    color: var(--gray-light); font-style: italic;
  }
  @media (max-width: 560px) {
    .dev-card { grid-template-columns: 1fr; justify-items: center; text-align: center; }
    .dev-body { text-align: left; }
  }
</style>

<!-- ════════════════════════════════════════════════════════════════
     1. QUICK OVERVIEW  —  2–3 sentences. What is this, in plain English?
     ════════════════════════════════════════════════════════════════ -->

**PROJECT NAME** is a one-to-two sentence elevator pitch. Say what it is and
why it exists. Assume the reader is a recruiter or a fellow student who has
never heard of it before.

<!-- ════════════════════════════════════════════════════════════════
     2. WHAT IT DOES  —  the concrete features / how it works.
     ════════════════════════════════════════════════════════════════ -->

## What It Does

Describe the core features. Bullets work well here:

- **Feature one** — what it does and why it's useful.
- **Feature two** — what it does and why it's useful.
- **Feature three** — what it does and why it's useful.

If a picture or short demo helps, drop it in:

<!-- ![Screenshot of the app](/assets/images/PROJECT-SLUG-demo.png) -->
<!-- Live demo: <https://your-demo-url> · Code: <https://github.com/OpenOwls-at-Temple/your-repo> -->

## How It Works

A few sentences (or a short list) on the tech: the stack, the AI layer, the
interesting technical decisions. Keep it readable for a non-expert.

<!-- ════════════════════════════════════════════════════════════════
     3. WHO IT'S FOR  —  the audience / who benefits.
     ════════════════════════════════════════════════════════════════ -->

## Who It's For

Who uses this and what problem does it solve for them?

- **Primary audience** — e.g. Temple faculty who need to X.
- **Secondary audience** — e.g. students who want to Y.

<!-- ════════════════════════════════════════════════════════════════
     4. MEET THE DEVELOPERS
     First-hand, in the student's own voice. Duplicate a <div class="dev-card">
     block for each developer. Delete the extra example card if only one dev.
     Photos: assets/images/team/<name>.jpg  (square, ~600×600px).
     ════════════════════════════════════════════════════════════════ -->

<span class="dev-section-label">Meet the Developers</span>

<div class="dev-grid">

  <!-- ── DEVELOPER CARD (copy this whole block per person) ── -->
  <div class="dev-card">
    <img class="dev-photo" src="/assets/images/team/firstname-lastname.jpg" alt="Firstname Lastname">
    <div>
      <p class="dev-name">Firstname Lastname</p>
      <p class="dev-role">Role on the project — e.g. Frontend & AI integration · CS '26</p>
      <p class="dev-links">
        <a href="https://www.linkedin.com/in/USERNAME/" target="_blank" rel="noopener">in&nbsp;·&nbsp;LinkedIn</a>
        <!-- optional extra: &nbsp;&nbsp; <a href="https://github.com/USERNAME" target="_blank" rel="noopener">GitHub</a> -->
      </p>
    </div>
    <div class="dev-body">
      <p class="dev-quote">
        A one-sentence first-hand hook in the student's own voice — what this
        project meant to them.
      </p>

      <h4>My Journey</h4>
      <p>
        First-person story: how you got involved, what you owned, how the work
        unfolded over the sprint. Written by the student, edited lightly by the
        professor.
      </p>

      <h4>What I Learned</h4>
      <p>
        The concrete skills and lessons — technical (a framework, an API, a
        pattern) and non-technical (teamwork, scoping, communication).
      </p>

      <h4>Biggest Challenge</h4>
      <p>
        The hardest problem you hit and how you worked through it. This is the
        part recruiters love — show how you think.
      </p>
    </div>
  </div>

  <!-- ── SECOND DEVELOPER (delete if not needed) ── -->
  <div class="dev-card">
    <img class="dev-photo" src="/assets/images/team/firstname-lastname-2.jpg" alt="Firstname Lastname">
    <div>
      <p class="dev-name">Firstname Lastname</p>
      <p class="dev-role">Role on the project · CS '26</p>
      <p class="dev-links">
        <a href="https://www.linkedin.com/in/USERNAME/" target="_blank" rel="noopener">in&nbsp;·&nbsp;LinkedIn</a>
      </p>
    </div>
    <div class="dev-body">
      <p class="dev-quote">First-hand hook…</p>
      <h4>My Journey</h4>
      <p>…</p>
      <h4>What I Learned</h4>
      <p>…</p>
      <h4>Biggest Challenge</h4>
      <p>…</p>
    </div>
  </div>

</div>

<!-- ════════════════════════════════════════════════════════════════
     5. (OPTIONAL) WHAT'S NEXT — future work, how to get involved.
     ════════════════════════════════════════════════════════════════ -->

## What's Next

A sentence or two on where the project could go, and an invitation:
interested Owls can check out the [repo](https://github.com/OpenOwls-at-Temple)
or reach out.
