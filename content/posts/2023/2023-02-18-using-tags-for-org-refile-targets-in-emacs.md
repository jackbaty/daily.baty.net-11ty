---
title: "Using :tag for org-refile-targets in Emacs"
date: "2023-02-18"
categories: 
  - "software"
tags: 
  - "emacs"
  - "orgmode"
---

Today I learned that I can use tags in Org files as a filter for org-refile-targets. I have my refile targets map to org-agenda-files but limit them to only top-level headings in order to keep the list under control. Once in a while, though, I would like to make a more deeply nested heading available for refiling. I can do this by using (:tag . "refile"). Who knew?!

```lisp
(setq org-refile-targets '((org-agenda-files :maxlevel . 1)
(org-agenda-files :tag . "refile")))
```

(h/t [Marcin ‘mbork’ Borkowski](https://mbork.pl/2023-02-18_My_approach_to_TODOs))
