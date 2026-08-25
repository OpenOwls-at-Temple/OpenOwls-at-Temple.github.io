---
layout: post
title: "Owl Jeopardy: Review Games That Build Themselves"
author: "Zirong Wang, Wei Lun Chang"
project: "Owl Jeopardy"
project_url: /projects/owl-jeopardy/
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

**Owl Jeopardy** is a web app that turns any Temple course into a ready-to-play
Jeopardy review game. A professor pastes in their Canvas course ID, and the app
generates the categories and questions automatically — no more typing out a
board by hand the night before the last lecture.

## What It Does

- **Auto-generates the board** — pulls slides, notes, and quiz content from Canvas and uses an LLM to write Jeopardy-style categories and clue/answer pairs.
- **Live, playable game** — launches a real game board in the browser, with clue reveals and a running scoreboard.
- **Buzzer play for teams** — students buzz in from their own devices; the board syncs everyone in real time.
- **Zero manual entry** — the whole game is built from the actual course material, so it's always on-topic.

<!-- ![The Owl Jeopardy game board](/assets/images/owl-jeopardy-demo.png) -->
<!-- Live demo: coming soon · Code: https://github.com/OpenOwls-at-Temple -->

## How It Works

The frontend is a **React** game board that updates in real time. A **Node.js**
backend handles **Canvas API** ingestion — fetching a course's materials and
normalizing them into clean text. That text goes to the **Claude API**, which
generates the categories and Q&A pairs. Finally, **WebSockets** keep every
player's buzzer and the shared scoreboard in sync during live play.

## Who It's For

- **Primary audience** — Temple faculty who want an engaging last-lecture review without spending hours building questions in tools like JeopardyLabs.
- **Secondary audience** — students, who get a review session drawn straight from their own course content instead of generic trivia.

<span class="dev-section-label">Meet the Developers</span>

<!-- NOTE: Sample/placeholder people below — swap in the real students,
     their photos (assets/images/team/), and their own words. -->
<div class="dev-grid">

  <div class="dev-card">
    <img class="dev-photo" src="/assets/images/team/ZirongWang.jpg" alt="Zirong Wang">
    <div>
      <p class="dev-name">Zirong Wang</p>
      <p class="dev-role">Phase 1 Lead · Frontend, Authentication & Game Architecture · CS '26</p>
      <p class="dev-links">
        <a href="https://www.linkedin.com/in/zirong-wang-25ab31250" target="_blank" rel="noopener">in&nbsp;·&nbsp;LinkedIn</a>
      </p>
    </div>
    <div class="dev-body">
      <p class="dev-quote">
          Building the first working version taught me how important product
decisions and architecture are before adding more advanced features.
      </p>

      <h4>My Journey</h4>
      <p>
  I led the initial Phase 1 prototype of Owl Jeopardy using AI-assisted
  development tools. I defined the core product flow and used Claude to help
  build the question bank management system, game setup flow, Jeopardy board,
  scoring system, and persistent game state with React and TypeScript.
</p>

<p>
  I also added Google authentication with Supabase, including protected routes,
  sign-in and sign-out flows, user avatar display, and authentication state
  management. My role involved deciding what the product should do, guiding the
  AI through prompts and design documents, reviewing the generated code, testing
  the application, and fixing integration issues.
</p>

<p>
  I also designed the application structure with future phases in mind so that
  AI-generated questions and slide-based content could be added without
  rebuilding the core game experience.
</p>

      <h4>What I Learned</h4>
     <p>
  This project taught me how to use AI as part of a real software development
  workflow rather than just as a code generator. I learned how to break an
  open-ended product idea into smaller features, write clearer prompts and
  specifications, evaluate generated code, and iterate when the first solution
  was not good enough.
</p>

<p>
  I also learned that even when AI writes much of the implementation, decisions
  about architecture, product scope, testing, and integration still require
  careful human judgment.
</p>

      <h4>Biggest Challenge</h4>
      <p>
  The biggest challenge was keeping the AI-generated implementation consistent
  as the project grew. Different features were often generated at different
  times, so changes to authentication, state management, or the data model could
  easily break something that had already been working.
</p>

<p>
  I had to review the generated code, keep the architecture and design documents
  up to date, test how new features interacted with the existing system, and
  guide the AI to fix integration problems without creating unnecessary
  rewrites.
</p>
    </div>
  </div>

  <div class="dev-card">
    <img class="dev-photo" src="/assets/images/team/sample-student-b.jpg" alt="Wei Lun Chang">
    <div>
      <p class="dev-name">Wei Lun Chang</p>
      <p class="dev-role">LLM pipeline & backend integration & AI question generation · CS '26</p>
      <p class="dev-links">
        <a href="https://www.linkedin.com/feed/" target="_blank" rel="noopener">in&nbsp;·&nbsp;LinkedIn</a>
      </p>
    </div>
    <div class="dev-body">
      <p class="dev-quote">
        Getting the model to write questions that were actually <em>fair</em> —
        not too easy, not impossibly obscure — was the whole game.
      </p>

<h4>My Journey</h4>
<p>
  I worked on the AI question generation pipeline, starting from a
  streaming-based approach and building outward. I built slide ingestion
  so the app could generate questions directly from uploaded PPTX and PDF
  files, then wired up streaming generation over SSE with NDJSON so
  questions show up as they're produced instead of making users wait on
  one big response. Later I moved the LLM calls behind a LiteLLM
  abstraction layer and rebuilt that part as a FastAPI backend, which let
  us swap providers without rewriting the pipeline. I also added a
  localStorage cache so we weren't re-generating the same questions on
  every reload, and spent a chunk of time on difficulty calibration so
  the generated questions actually scaled the way a real Jeopardy board
  should.
</p>

<h4>What I Learned</h4>
<p>
  How to design around a streaming response instead of a single request —
  SSE and NDJSON force you to think about partial state and what the UI
  does with a clue that's half-formed. I also learned why an abstraction
  layer like LiteLLM matters in practice: once the backend didn't care
  which provider it was talking to, testing and swapping models got a lot
  less painful. On top of that, working off Professor Pang's architectural
  guidance and syncing our specs with it taught me how much clearer a
  build goes when the design doc is kept honest and current instead of
  written once and forgotten.
</p>

<h4>Biggest Challenge</h4>
<p>
  Merging the AI pipeline branch back into master. It had drifted enough
  from the mainline — new endpoints, the streaming changes, the caching
  layer — that the merge surfaced a bunch of small conflicts and edge
  cases that only showed up once everything had to work together. Cleaning
  that up, plus recalibrating difficulty after the merge, took longer than
  writing any single feature did.
</p>
    </div>
  </div>

</div>

## What's Next

We'd love to add a professor dashboard for editing generated questions before
game day, and support for image-based clues. Interested Owls can check out the
[repo](https://github.com/OpenOwls-at-Temple) or reach out — we're happy to
onboard the next team.
