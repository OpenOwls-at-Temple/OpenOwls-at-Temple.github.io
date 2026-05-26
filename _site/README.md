# OpenOwls Website

The official website for OpenOwls at Temple University — [OpenOwls-at-Temple.github.io](https://OpenOwls-at-Temple.github.io)

## Tech Stack

- [Jekyll](https://jekyllrb.com/) static site generator
- Hosted on GitHub Pages (free)
- No external CMS — everything is Markdown files and Git

## Local Development

```bash
# Install dependencies
bundle install

# Serve locally with live reload
bundle exec jekyll serve --livereload

# Visit http://localhost:4000
```

## Adding a New Project

1. Create a new file in `_projects/your-project-name.md`
2. Copy the front matter from an existing project and update the fields
3. Write the project description in Markdown below the `---`
4. Submit a pull request

### Project front matter fields

```yaml
---
layout: project
title: Your Project Title
description: One or two sentence summary shown on the card.
icon: 🦉          # any emoji
status: planned   # planned | building | active
order: 4          # controls sort order on homepage
tags: [React, Python, Canvas API]
github: https://github.com/OpenOwls-at-Temple/your-repo   # optional
demo: https://your-demo-url.com                           # optional
contributors: [Alice Smith, Bob Jones]                    # optional
---

Your full project description in Markdown here.
```

## Deploying

Push to `main` — GitHub Pages builds and deploys automatically within ~1 minute.

## Structure

```
openowls-site/
├── _config.yml          # Site settings
├── _layouts/
│   ├── default.html     # Base layout
│   └── project.html     # Individual project page layout
├── _includes/
│   ├── nav.html          # Navigation bar
│   └── footer.html       # Footer
├── _projects/            # One .md file per project
│   ├── accessibility-automator.md
│   ├── owl-jeopardy.md
│   └── ai-career-coach.md
├── assets/
│   └── css/main.css      # All styles
└── index.html            # Homepage
```

## Contributing

All OpenOwls members are welcome to improve the site. It's a project like any other — open a PR, get it reviewed, ship it.
