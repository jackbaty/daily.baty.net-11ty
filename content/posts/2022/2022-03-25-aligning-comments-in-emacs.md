---
title: "Aligning comments in Emacs"
date: "2022-03-25"
categories: 
  - "emacs"
tags: 
  - "emacs"
---

I want my per-line code comments to line up nicely, so I’ll often add a bunch of spaces by hand to make things just so. I realized that, being Emacs, there must be an easier way to handle this. Of course there is.

Two minutes of searching [revealed a short bit of lisp](https://stackoverflow.com/a/20278032) that does the job nicely:

```lisp
;; Align comments in marked region
;; Via https://stackoverflow.com/a/20278032
(defun jab/align-comments (beginning end)
  "Align comments within marked region."
  (interactive "*r")
  (let (indent-tabs-mode align-to-tab-stop)
    (align-regexp beginning end (concat "\(\s-*\)"
                                        (regexp-quote comment-start)))))
```

Here’s an example of what I was working on, with horribly un-aligned comments.

```lisp
(setq org-roam-capture-templates
  '(("d" "default" plain "%?"
    :target (file+head "%<%Y%m%d>-${slug}.org"
                       "#+title: ${title}n#+index: n#+setupfile: ~/org/_SETUP/EXPORTn#+setupfile: ~/org/_SETUP/org-roam-publish-fancy.setup")
    :unnarrowed t)
    ("P" ;; Key
     "Public (published in /public)" ;; Description
     plain  ;; Type
     (file "~/org/roam/templates/PublicTemplate.org")  ;; Template
    :target (file "public/${slug}.org") ;; Target
    :unnarrowed t)
    ("p" ;; Key
     "project"  ;; Description
     plain   ;; Type
     (file "~/org/roam/templates/ProjectTemplate.org") ;; Template
    :target (file "projects/%<%Y%m%d>-${slug}.org")    ;; Target
    :unnarrowed t)))
```

Then, here’s that same thing after executing `jab/align-comments`

```lisp
(setq org-roam-capture-templates
  '(("d" "default" plain "%?"
    :target (file+head "%<%Y%m%d>-${slug}.org"
                       "#+title: ${title}n#+index: n#+setupfile: ~/org/_SETUP/EXPORTn#+setupfile: ~/org/_SETUP/org-roam-publish-fancy.setup")
    :unnarrowed t)
    ("P"                                               ;; Key
     "Public (published in /public)"                   ;; Description
     plain                                             ;; Type
     (file "~/org/roam/templates/PublicTemplate.org")  ;; Template
    :target (file "public/${slug}.org")                ;; Target
    :unnarrowed t)
    ("p"                                               ;; Key
     "project"                                         ;; Description
     plain                                             ;; Type
     (file "~/org/roam/templates/ProjectTemplate.org") ;; Template
    :target (file "projects/%<%Y%m%d>-${slug}.org")    ;; Target
    :unnarrowed t)))
```

Much better. It’s cool because it uses `comment-start` so it works with any language’s comment syntax. There are probably 17 other ways of doing this that I haven’t discovered, but this works.

Every day is a new day in Emacs.
