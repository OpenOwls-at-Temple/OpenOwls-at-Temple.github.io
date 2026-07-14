---
title: "Getting Started with uv: A Faster Python Workflow (and How It Maps to conda)"
author: Prof. Alex Pang
category: faculty
date: 2026-07-13
---

Starting this sprint, I want **every OpenOwls project to use [uv](https://docs.astral.sh/uv/)** for Python package and environment management. This post is your getting-started guide. If you have been using `conda` (or `pip` + `venv`), you already know the concepts — you just need a new set of commands, and this guide maps them one-to-one.

## Why uv

`uv` is a single, extremely fast tool — written in Rust by the team behind Ruff — that replaces `pip`, `pip-tools`, `virtualenv`, `pyenv`, and `pipx`. For OpenOwls it earns its place for four reasons:

- **Speed.** Installs are typically 10–100× faster than `pip`, and there is no slow dependency solver like the one that makes `conda` crawl.
- **Reproducibility.** Every project gets a universal, cross-platform `uv.lock` file automatically. "Works on my machine" stops being a mystery.
- **One tool, one mental model.** No more juggling `pyenv` for Python versions, `venv` for environments, and `pip` for packages.
- **It fits our SDD structure.** Our [multi-package SDD guide](/openowls-sdd-multi-packages-guide/) asks each package to own its **own `.venv`**. `uv` makes that the natural default rather than something you maintain by hand.

## Installing uv

You install `uv` **once**, globally — not per project.

```bash
# macOS / Linux
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows (PowerShell)
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

Prefer a package manager? Any of these also work: `brew install uv`, `pipx install uv`, or `pip install uv`. Verify it:

```bash
uv --version
```

## The one big mental shift from conda

With `conda`, the workflow is: create a **named** environment somewhere central, `activate` it, then install into it. Environments live in a global list and you switch between them.

With `uv`, the environment is just a **`.venv` folder inside your project**, and you usually **never activate it**. Instead you prefix commands with `uv run`, and `uv` automatically uses (and updates) the project's environment for you:

```bash
uv run python main.py     # runs in the project's .venv — no activation needed
uv run pytest
```

That single habit — `uv run` instead of activate-then-run — removes most of the friction people hit with `conda`.

## conda → uv cheat sheet

Keep this table handy. The left column is what you used to type; the right column is the `uv` equivalent.

| Task | conda | uv |
| --- | --- | --- |
| Install a specific Python | `conda install python=3.12` | `uv python install 3.12` |
| Create an env with Python 3.12 | `conda create -n proj python=3.12` | `uv init` then `uv python pin 3.12` (or `uv venv --python 3.12`) |
| Activate the env | `conda activate proj` | *usually skip it* — use `uv run`. Or `source .venv/bin/activate` |
| Add a package | `conda install numpy` | `uv add numpy` |
| Add a dev-only package | `conda install pytest` | `uv add --dev pytest` |
| Remove a package | `conda remove numpy` | `uv remove numpy` |
| List installed packages | `conda list` | `uv pip list` (or `uv tree`) |
| Run a script | `conda activate proj && python x.py` | `uv run python x.py` |
| Recreate the env from a lock/spec | `conda env create -f environment.yml` | `uv sync` |
| Export the environment | `conda env export > environment.yml` | *automatic* `uv.lock`, or `uv export -o requirements.txt` |
| Run a CLI tool one-off | `conda install black && black .` | `uvx black .` |
| Deactivate | `conda deactivate` | `deactivate` (only if you activated) |

## Starting a new project

This is the flow you'll use most. Three commands and you're running code:

```bash
uv init owl-jeopardy      # scaffolds pyproject.toml, .python-version, main.py, .gitignore
cd owl-jeopardy
uv add requests           # creates .venv + uv.lock on first add, installs the package
uv run python main.py     # runs your code in the project environment
```

A few things happened automatically:

- **`pyproject.toml`** now lists `requests` as a dependency — this is the file you edit (via `uv add` / `uv remove`), and you commit it.
- **`uv.lock`** pins the *exact* resolved versions of everything. Commit this too — it's what makes builds reproducible.
- **`.venv/`** holds the actual installed packages. **Do not commit it** — it's already in the generated `.gitignore`.

To pin the Python version for the whole team:

```bash
uv python pin 3.12        # writes .python-version, which uv respects everywhere
```

## Working on an existing project

When you clone an OpenOwls repo that already uses `uv`, you do **not** install packages one by one. You sync from the lockfile:

```bash
git clone <repo> && cd <repo>
uv sync                   # builds .venv to match uv.lock exactly
uv run python main.py
```

`uv sync` is the `uv` answer to `conda env create -f environment.yml` — but it's exact, cross-platform, and fast.

## The pip-compatible escape hatch

If you already have a `requirements.txt` (our SDD guides currently reference these), `uv` speaks that dialect directly through `uv pip` — a drop-in, much faster `pip`:

```bash
uv venv                                  # create a .venv
uv pip install -r requirements.txt       # install into it, fast
uv pip compile requirements.in -o requirements.txt   # lock loose specs
uv export -o requirements.txt            # generate one from a uv project
```

> **Recommendation:** for a brand-new package, prefer the native `uv add` / `pyproject.toml` / `uv.lock` flow — it's the reproducible path. Reach for `uv pip` when you're bridging an existing `requirements.txt` or need a quick throwaway environment.

## Running tools without installing them

`conda install`-ing a linter or formatter into every environment gets old. `uvx` runs a tool in a temporary, cached environment — nothing pollutes your project:

```bash
uvx ruff check .          # lint without installing ruff into the project
uvx black .               # format
uv tool install ruff      # or install it globally if you use it constantly
```

## How this maps to our SDD structure

Our [multi-package SDD guide](/openowls-sdd-multi-packages-guide/) says each package keeps **its own `.venv`** and never cross-activates a sibling's environment. With `uv` that rule enforces itself — every package folder simply gets its own `.venv` the first time you run `uv sync` or `uv add` inside it:

```bash
cd package1 && uv sync    # package1/.venv
cd ../package2 && uv sync # package2/.venv — completely separate
```

Because `uv run` always picks up the `.venv` of the directory you're in, you get the per-package isolation the guide asks for **without** manually activating and deactivating anything.

## When conda still makes sense

Being honest: `conda` has one real advantage — it installs non-PyPI binary packages (some scientific, GPU/CUDA, and cross-language stacks) that don't ship as standard Python wheels. If a future project genuinely needs that, we'll talk. But for everything OpenOwls builds today — web apps, Python backends, and LLM API integrations — every dependency is on PyPI, so `uv` covers us completely and is far faster.

## Your first step

Install `uv`, then try this in any scratch folder:

```bash
uv init hello && cd hello
uv add rich
uv run python -c "from rich import print; print('[bold gold1]Owls Helping Owls[/]')"
```

If that prints in color, you're ready. From here on, new OpenOwls projects start with `uv init`, not `conda create`. Bring questions to our next meeting — and if you hit a snag, post it so the next Owl finds the answer waiting.
