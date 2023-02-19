---
title: "Using tags for org-refile-targets"
date: 2023-02-18T09:49:39.10-4:00
tags: [Emacs]
---

Today I learned that I can use tags in Org files as a filter for `org-refile-targets`. I have my refile targets map to `org-agenda-files` but limit them to only top-level headings in order to keep the list under control. Once in a while, though, I would like to make a more deeply nested heading available for refiling. I can do this by using `(:tag . "refile")`. Who knew?!

```lisp
(setq org-refile-targets '((org-agenda-files :maxlevel . 1)
                           (org-agenda-files :tag . "refile")))
```

