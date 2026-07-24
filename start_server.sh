#!/usr/bin/env bash
# Serve the site locally at http://127.0.0.1:4000 — Ctrl-C to stop.
cd "$(dirname "$0")" && bundle exec jekyll serve --livereload "$@"
