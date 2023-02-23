---
title: "Doom Emacs from scratch"
date: "2021-03-10"
categories: 
  - "misc"
tags: 
  - "emacs"
---

A week ago I decided to cancel [Doom Emacs](https://github.com/hlissner/doom-emacs) and go back to building [Emacs from Scratch](https://www.baty.blog/2021/emacs-from-scratch-again) , and once again I was reminded what a terrible idea that is.

Seriously, stock Emacs, even with a leg up from [Nano Emacs](https://github.com/rougier/nano-emacs) , gets so many things “wrong” that I could spend the rest of my life fixing things and still wanting more. I thought building from scratch would help me _avoid_ [Configuration Fatigue](https://www.baty.blog/2021/configuration-fatigue) . Wow, was I wrong.

So, back to Doom. I started from scratch with the usual…

```
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d~/.emacs.d/bin/doom install
```

Then I edited init.el and enabled just a few non-stock things. “Zen” mode, org-journal, and pandoc-mode. Otherwise, it’s right out of the box.

I copied the gotta-haves from my original config.el. Most of these are around file paths, Org mode, and LaTeX. Plus a few of my favorite key bindings. Otherwise, I left it alone. So far.

Doom Emacs is simply too good to pass up. It handles all of the little behavioral and visual tweaks that would otherwise take forever to learn about and modify on my own. Half of the things it does for me I just expect to be part of Emacs, and am surprised when I find they’re not.

I’m still using the default Doom theme, which isn’t my favorite, but I’m trying to resist farting around with that for at least a couple of days while I get settled back in.
