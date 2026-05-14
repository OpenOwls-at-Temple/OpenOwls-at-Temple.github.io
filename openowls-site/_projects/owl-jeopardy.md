---
layout: project
title: Owl Jeopardy
description: An AI-powered Jeopardy-style review game that ingests your Canvas course materials and automatically generates categories and questions — so faculty can run an engaging last-lecture review session without writing a single question by hand.
icon: 🎯
status: building
order: 2
tags: [React, Canvas API, Claude AI, Node.js, WebSockets]
github: https://github.com/OpenOwls-at-Temple/owl-jeopardy
---

## The Problem

Professors love using Jeopardy as a review game for the last lecture. Commercial tools like JeopardyLabs require manually entering every question. That takes time faculty don't have — and the questions can't pull from the actual course material automatically.

## What We're Building

A web app where a faculty member pastes in their Canvas course ID, and the tool:

1. Pulls slides, notes, and quiz content via the Canvas API
2. Sends them to an LLM to generate Jeopardy-style categories and Q&A pairs
3. Launches a live, playable game board in the browser
4. Supports buzzer-style play with score tracking for teams

The key differentiator: **the game builds itself from your course content**. No manual question entry.

## Tech Stack

- **Frontend**: React game board with real-time updates
- **Backend**: Node.js + Canvas API for content ingestion
- **AI layer**: Claude API for question generation
- **Live play**: WebSockets for buzzer synchronization

## Get Involved

Interested in contributing? Check out the GitHub repo or email us.
