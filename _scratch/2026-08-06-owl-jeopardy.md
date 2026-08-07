---
layout: post
title: "Owl Jeopardy: Review Games That Build Themselves"
author: "Sample Student A, Sample Student B"
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
    <img class="dev-photo" src="/assets/images/team/sample-student-a.jpg" alt="Sample Student A">
    <div>
      <p class="dev-name">Sample Student A</p>
      <p class="dev-role">Frontend & real-time play · CS '26</p>
      <p class="dev-links">
        <a href="https://www.linkedin.com/in/USERNAME/" target="_blank" rel="noopener">in&nbsp;·&nbsp;LinkedIn</a>
      </p>
    </div>
    <div class="dev-body">
      <p class="dev-quote">
        I'd never shipped anything real-time before — watching four laptops
        buzz in on one board for the first time was the moment it clicked.
      </p>

      <h4>My Journey</h4>
      <p>
        I owned the React game board and the buzzer experience. I started with a
        static board, then layered in the live state once the WebSocket channel
        was working. Most of my sprint was spent making the game <em>feel</em>
        good — clean reveals, clear whose-turn-it-is cues, and a scoreboard you
        can read from the back of a classroom.
      </p>

      <h4>What I Learned</h4>
      <p>
        How to reason about shared state across many clients, when to trust the
        server as the source of truth, and how to keep a UI responsive while the
        network catches up. On the team side, I learned to cut scope: our first
        design had way more features than we could finish, and picking the core
        loop made the whole thing possible.
      </p>

      <h4>Biggest Challenge</h4>
      <p>
        Race conditions on the buzzer. Two players hitting buzz within
        milliseconds would both light up. I fixed it by moving the
        "first-to-buzz" decision entirely to the server and locking the round
        the instant it received the first event — the clients just render what
        the server decides.
      </p>
    </div>
  </div>

  <div class="dev-card">
    <img class="dev-photo" src="/assets/images/team/sample-student-b.jpg" alt="Sample Student B">
    <div>
      <p class="dev-name">Sample Student B</p>
      <p class="dev-role">Canvas ingestion & AI question generation · CS '26</p>
      <p class="dev-links">
        <a href="https://www.linkedin.com/in/USERNAME/" target="_blank" rel="noopener">in&nbsp;·&nbsp;LinkedIn</a>
      </p>
    </div>
    <div class="dev-body">
      <p class="dev-quote">
        Getting the model to write questions that were actually <em>fair</em> —
        not too easy, not impossibly obscure — was the whole game.
      </p>

      <h4>My Journey</h4>
      <p>
        I built the Node backend that pulls a course from the Canvas API and the
        prompt pipeline that turns that content into a Jeopardy board. A lot of
        the work was unglamorous: cleaning messy slide text so the model had
        something coherent to work from.
      </p>

      <h4>What I Learned</h4>
      <p>
        Practical prompt engineering — how much structure the model needs, and
        how to make it return clean JSON I could drop straight into the board.
        I also learned how real APIs behave: pagination, rate limits, and the
        difference between the docs and reality.
      </p>

      <h4>Biggest Challenge</h4>
      <p>
        Keeping question difficulty consistent across categories. My first
        prompts gave wildly uneven boards. I ended up giving the model explicit
        difficulty tiers per row and a few worked examples, which made the
        $200 clues reliably harder than the $100 ones.
      </p>
    </div>
  </div>

</div>

## What's Next

We'd love to add a professor dashboard for editing generated questions before
game day, and support for image-based clues. Interested Owls can check out the
[repo](https://github.com/OpenOwls-at-Temple) or reach out — we're happy to
onboard the next team.
