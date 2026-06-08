---
layout: project
title: Accessibility Automator
description: An AI-powered tool that scans course slide decks for WCAG accessibility violations — missing alt text, low contrast, broken reading order — and suggests fixes automatically. Built to solve the real deadline pressure Temple faculty face with accessibility compliance.
icon: ♿
status: building
order: 1
tags: [Python, Canvas API, Claude AI, WCAG, PowerPoint]
github: tba
---

## The Problem

Temple faculty face hard deadlines for making course materials WCAG-compliant. Manually fixing accessibility issues across dozens of slide decks is tedious, time-consuming, and easy to get wrong.

## What We're Building

A tool that accepts a PowerPoint file (or pulls slides directly from Canvas), scans every slide for common accessibility violations, and uses an LLM to suggest or automatically apply fixes:

- **Missing alt text** — AI generates contextual descriptions for images
- **Low contrast** — flags color combinations that fail WCAG AA
- **Reading order** — detects when screen readers would read slides out of order
- **Missing slide titles** — required for screen reader navigation
- **Canvas integration** — process an entire course's materials in one click

## Why This Matters

Microsoft's built-in checker misses most contrast issues and has no AI-powered fix suggestions. No existing tool is integrated into Canvas. This fills a real gap for our faculty.

## Get Involved

Interested in contributing? Check out the GitHub repo or email us.
