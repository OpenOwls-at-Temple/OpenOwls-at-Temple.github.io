---
layout: post
title: "Ask Clara: AI-Powered Career Coach"
author: "Mauricio Estrella"
project: "Ask Clara"
project_url: /projects/ask-clara/
date: 2026-08-06
category: student
published: false
---

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

**Ask Clara** is an AI career coach built for Temple University undergraduate,
graduate, and PhD students. A student signs in with their Temple account,
uploads a resume, answers a short questionnaire about their goals — and Clara
assesses their strengths and gaps against their three dream roles, then drafts
a tailored resume for each one. Clara is a low-pressure, always-on starting
point that complements the Temple Career Center, preparing students for
meaningful conversations with human advisors.

## What It Does

- **Temple sign-in & persistent profile** — students sign in with their `@temple.edu` Google account; their profile, ranked target roles, and documents are saved across sessions.
- **Profile intake** — upload a resume (PDF/DOCX) or LinkedIn export, and rank three dream roles by preference; Clara parses and stores it all.
- **AI career assessment** — Clara reviews the student's real experience against their target roles and returns specific strengths, honest gaps, and concrete recommendations tuned to STEM hiring.
- **Three tailored resume drafts** — one per ranked role, generated from the student's *actual* experience (never fabricated), editable in the browser and downloadable as DOCX.
- **Built to be trustworthy** — anything the AI can't ground in the student's real record goes into "Notes from Clara" as a suggestion, never into the resume itself.

<!-- ![The Ask Clara assessment page](/assets/images/ask-clara-demo.png) -->
<!-- Live demo: https://ask-clara-zeta.vercel.app · Code: https://github.com/OpenOwls-at-Temple/ask-clara -->

## How It Works

The frontend is a **React** single-page app (Vite) with a Temple-cherry design
system built from scratch. A **FastAPI** (Python) backend handles Google SSO,
resume parsing, and business logic, storing relational data in **PostgreSQL**
and document-shaped data (parsed resumes, assessments, generated drafts) in
**MongoDB**. The AI layer is a server-side **multi-agent orchestrator** on the
**Claude API**: specialized agents handle assessment and resume generation,
while the orchestrator strips personal contact info, trims context to a strict
token budget, and enforces a per-student generation quota — the whole pilot
runs on a fixed research grant, so every model call is metered and cached.
The project was built with the **OpenOwls Spec-Driven Development** process:
nine living spec documents drive every feature, and an AI coding assistant
(Claude Code) implements against them.

## Who It's For

- **Primary audience** — Temple undergrad, grad, and PhD students in STEM who want a starting point for career planning: an honest read on where they stand and resumes aimed at where they want to go.
- **Secondary audience** — the Temple Career Center, whose counselors students arrive to better prepared; Clara points every student toward a human advisor, never away from one.

<span class="dev-section-label">Meet the Developers</span>

<!-- NOTE: Sample/placeholder people below — swap in the real students,
     their photos (assets/images/team/), and their own words. -->
<div class="dev-grid">

  <div class="dev-card">
    <img class="dev-photo" src="/assets/images/team/sample-student-a.jpg" alt="Sample Student A">
    <div>
      <p class="dev-name">Sample Student A</p>
      <p class="dev-role">System design & AI-assisted development · CS '26</p>
      <p class="dev-links">
        <a href="https://www.linkedin.com/in/USERNAME/" target="_blank" rel="noopener">in&nbsp;·&nbsp;LinkedIn</a>
      </p>
    </div>
    <div class="dev-body">
      <p class="dev-quote">
        The hardest part wasn't writing code — it was making the system design
        calls the AI couldn't make for me, and then verifying everything it built.
      </p>

      <h4>My Journey</h4>
      <p>
        Ask Clara was my first project using Spec-Driven Development, a process
        from my professor where you write the full spec set — features,
        architecture, LLM integration, security — before any code, and the AI
        assistant implements against it. It was also my first time doing
        AI-assisted development, using Claude Code inside my IDE. My job shifted
        from typing every line to making the decisions that shape the system:
        choosing a pilot-friendly stack (FastAPI, React, Postgres + MongoDB),
        designing the LLM layer, and reviewing everything that came back
        against the specs.
      </p>

      <h4>What I Learned</h4>
      <p>
        That AI-assisted development moves the hard work up a level. The
        assistant can implement a feature in minutes, but it's only as good as
        the spec behind it — so I learned to write precise specs, to read
        generated code critically instead of trusting it, and to verify with
        real end-to-end browser tests, not just passing unit tests. Some of our
        best fixes came from E2E testing catching things the tests missed, like
        the model inventing its own JSON schema when the prompt didn't pin one
        down.
      </p>

      <h4>Biggest Challenge</h4>
      <p>
        Cost control. The pilot runs on a (hopefully) fixed grant for ~500 students, so
        unlimited AI generations weren't an option. I designed a database-backed
        per-student quota with an atomic check-and-increment (so two
        simultaneous clicks can't double-spend), automatic refunds when a
        generation fails, strict input token caps, and caching so viewing a
        saved assessment never re-calls the model. Budget as a first-class
        design constraint changed how I thought about every feature.
      </p>
    </div>
  </div>

  <div class="dev-card">
    <img class="dev-photo" src="/assets/images/team/mauricio-estrella.png" alt="Mauricio Estrella">
    <div>
      <p class="dev-name">Mauricio Estrella</p>
      <p class="dev-role">Role TBD · CS '26</p>
      <p class="dev-links">
        <a href="https://www.linkedin.com/in/mauricio-estrella-engineer/" target="_blank" rel="noopener">in&nbsp;·&nbsp;LinkedIn</a>
      </p>
    </div>
    <div class="dev-body">
      <p class="dev-quote">
        Quote TBD.
      </p>

<h4>My Journey</h4>
<p>
   TBD
</p>

<h4>What I Learned</h4>
<p>
   TBD
</p>

<h4>Biggest Challenge</h4>
<p>
   TBD
</p>
    </div>
  </div>

</div>

## What's Next

Phase 1 (the core MVP) is live and smoke-tested on real infrastructure. Phase 2
adds personalized 6-month development plans, job-lead scanning with alerts, and
per-posting resume + cover letter tailoring; Phase 3 explores a supervised
handoff to Temple Career Center counselors. Interested Owls can check out the
[repo](https://github.com/OpenOwls-at-Temple/ask-clara) or reach out — we're
happy to onboard the next team.
