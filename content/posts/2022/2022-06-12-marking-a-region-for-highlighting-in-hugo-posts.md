---
title: "Marking a region for highlighting in Hugo posts"
date: "2022-06-12"
categories:
  - "emacs"
tags:
  - "hugo"
---

You'll notice that I highlight short phrases in many of my daily post entries here. I think this makes it easier to scan things later. The HTML markup for this is just a styled `<mark>` tag wrapping the text to be highlighted.

I write my posts in Org-mode and convert them to Hugo-compatible Markdown using [ox-hugo](https://ox-hugo.scripter.co/). The path from Org-mode to HTML for this is a little convoluted, so I cheat and use a macro to generate the markup.

At the top of my blog.org file, I have defined the following macro:

```
#+macro: mark @@html:<mark>$1</mark>@@
```

And when writing posts in Org-mode, I surround the text I want to be highlighted with the macro, like this:

{% raw %}
```
I would like to {{{mark(higlight this text)}}} in the rendered HTML, please
```
{% endraw %}

This replaces the text passed to the macro with properly-escaped markup for export. While it's easy enough to type the macro manually, I've created a small elisp function to do it for me:

{% raw %}
```lisp
(defun jab/markregion ()
  "Add a 'mark' macro to the current region (for Hugo)"
  (interactive)
  (if (region-active-p)
      (progn
        (goto-char (region-end))
        (insert ")}}}")
        (goto-char (region-beginning))
        (insert "{{{mark("))))
```
{% endraw %}

Now, I can simply highlight some text and call the `jab/markregion` function and I'm done.

It's easier and faster than it sounds, really.
