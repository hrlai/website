---
title: Just another "getting started with GitHub" note
author: 'Hao Ran Lai'
date: '2022-08-07'
slug: just-another-getting-started-with-github-note
categories:
  - work
tags:
  - note
---

There is a plethora of GitHub online resources for beginners. I find Jenny Bryan's [Happy Git with R](https://happygitwithr.com/) sufficient on itself, with additional help from the general community via occassional Googling. This note does not try to offer any stepwise guide to get started with Github. Rather, I just want to list a few alternative uses of GitHub that may give you more reasons to explore version control.

# Get someone who's already using GitHub to collaborate on a standalone project

Before I started using GitHub, I had been aware of its purpose and existence like many of you. But it was only until [@xp-song](https://github.com/xp-song) invited me on [a project](https://github.com/xp-song/allometree) that I finally overcome the hurdle to integrate my `R` workflow with GitHub. We explored many aspects of GitHub including filing [Issues](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue) and resolving them with commits, pull requests, branches, and deciding whether or not to push [large files](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-git-large-file-storage). We made many silly mistakes and resolved them together. It took us a few weeks to settle into a shared routine. After this experience, I initiate almost all of my projects on GitHub and never went back to Dropbox or Google Drive. To be released from the need to rename a file with a `_final28` suffix is such a great feeling.

# Use GitHub as an Issue-only repository

In practice, one could entirely bypass the terminal and interface with GitHub point-and-click [via RStudio](https://happygitwithr.com/). So the terminal is no longer a strong reason not to explore version control. Still, the second major hurdle remains: how do I integrate GitHub into my daily workflow? Since routines are hard to change, why don't we avoid doing so at the beginning? Perhaps don't migrate from your cloud platform of choice to Github first. Instead, create a sister repository on GitHub for the same project but only use it as a project planner. The [Issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue) page is quite versatile: use it to create actionable tasks, [to-dos](https://docs.github.com/en/issues/tracking-your-work-with-issues/about-task-lists), discussion threads with collaborators (which also reduces your email inbox load), or even categorise tasks into [milestones](https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/about-milestones). If ticking boxes grants you a sense of achievement, give this a try. Make version control an option rather than the sole reason to explore GitHub.

# Subscribe to active public projects to get a sense of how experts work

Another great thing about version control platforms that support open source projects is the transparency. GitHub has a ["watch"](https://docs.github.com/en/rest/activity/watching) feature to let you subscribe to a repository and receive email notifications about discussions on the Issue page or new releases. For my work I have three `R` packages on my watchlist--- [`lme4`](https://github.com/lme4/lme4/), [`glmmTMB`](https://github.com/glmmTMB/glmmTMB), and [`greta`](https://github.com/greta-dev/greta)---initially to get notified when there is a new release, but eventually I become an avid reader of the comments and discussions on their Issue page. At the risk of sounding like a weird stalker, I do this because these discussions taught me a lot about their design philosophy (e.g., to fix or not to fix), thought processes, prioritisations, willingness to admit ignorance or uncertainty, reaching out to source experties from other programmers, and last but not least, being nice to each other. Eventually I copy their ways in initiating issues, setting milestones, and writing commit messages. If you are already using a software that has an active codebase and discussion on GitHub, why not keep an eye on its behind-the-scene activity and then decide whether GitHub is something for you later?