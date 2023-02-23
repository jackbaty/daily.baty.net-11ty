---
title: "Adding an RSS feed to my wiki"
date: "2022-03-10"
categories: 
  - "misc"
tags: 
  - "misc"
---

[TiddlyWiki](https://tiddlywiki.com/) is a single static HTML file. It does not generate an RSS feed of new entries. It doesn’t _generate_ anything.

I treat my wiki at [wiki.baty.net](https://wiki.baty.net/rss.xml) more like a blog than a wiki, so not having an RSS feed feels like an omission. Most of the time I consider this to be a feature. I like that I can write any old nonsense and it doesn’t actively go out and bother anyone. It’s my little secret, that you can read if you want.

On the other hand, I find it annoying when I’m interested in someone else’s writing and they don’t provide any feeds. So, I’ve decided to make it easier to follow me. I suppose if you deliberately subscribe to the wiki’s feed, you _want_ to be bothered by the stuff I write there.

My solution is based on [this article](https://radar231.com/RSS%2520Feed%2520for%2520Tiddlywiki%2520SSG%2520Website.html) . The short version is that I created a new tiddler named “RSS Feed” containing the following:

<table><tbody><tr><td><pre class="chroma" style="font-family: monospace, monospace; font-size: 1em; margin: 0px; padding: 0.25rem 0px 0.25rem 0.5rem; tab-size: 4; background-color: #f5f5f5 !important;" tabindex="0"><code style="font-family: 'Source Code Pro', Menlo, Consolas, Monaco, monospace, system-ui, -apple-system, BlinkMacSystemFont, 'PingFang SC', 'Microsoft YaHei UI', 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 0.875rem; display: inline-block; max-width: 100%; padding: 0px; word-wrap: break-word; overflow-wrap: break-word; line-break: anywhere; color: #e74c3c; background-color: #f5f5f5 !important;"></code></pre></td><td><pre class="chroma" style="font-family: monospace, monospace; font-size: 1em; margin: 0px; padding: 0.25rem 0px 0.25rem 0.5rem; tab-size: 4; min-width: max-content; background-color: #f5f5f5 !important;" tabindex="0"><code class="language-fallback" style="font-family: 'Source Code Pro', Menlo, Consolas, Monaco, monospace, system-ui, -apple-system, BlinkMacSystemFont, 'PingFang SC', 'Microsoft YaHei UI', 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 0.875rem; display: inline-block; max-width: 100%; padding: 0px; word-wrap: break-word; overflow-wrap: break-word; line-break: anywhere; color: #e74c3c; background-color: #f5f5f5 !important;" data-lang="fallback"></code></pre></td></tr></tbody></table>

This tiddler runs a filter finding the last 10 tiddlers tagged with `Feed` and renders them as RSS-formatted XML.

Extracting the rendered text from that tiddler out to an RSS file is done using my Makefile using the [TiddlyWiki node.js module](https://www.npmjs.com/package/tiddlywiki) . The command is as follows:

`tiddlywiki --load index.html --render "&#91;&#91;RSS Feed]]" "rss.xml" text/plain`

This generates a file at ./output/rss.xml containing the rendered RSS text/xml. Later in the Makefile, I rsync rss.xml up to the server along with the rest of the wiki files. Here’s the complete Makefile:

```bash
SERVER_HOST=server01.baty.net
SERVER_DIR=/home/jbaty/apps/rudimentarylathe.wiki/public_html
PUBLIC_DIR=~/Sync/wikis/rudimentarylathe/
TARGET=server01.baty.net

.POSIX:
.PHONY: checkpoint deploy

build:
        tiddlywiki --load index.html --render "&#91;&#91;RSS Feed]]" "rss.xml" text/plain

checkpoint:
        git add .
        git diff-index --quiet HEAD || git commit -m "Publish checkpoint"

deploy: build checkpoint
        git push
        @echo "33&#91;0;32mDeploying updates to $(TARGET)...33&#91;0m"
        rsync -v -rz --checksum --delete --no-perms $(PUBLIC_DIR)index.html $(SERVER_HOST):$(SERVER_DIR)
        rsync -v -rz --checksum --delete --no-perms $(PUBLIC_DIR)output/rss.xml $(SERVER_HOST):$(SERVER_DIR)
        rsync -v -rz --checksum --delete --no-perms $(PUBLIC_DIR)files $(SERVER_HOST):$(SERVER_DIR)
```

All this means is that you can now subscribe to the daily posts at [wiki.baty.net](https://wiki.baty.net/) using the following URL: [https://wiki.baty.net/rss.xml](https://wiki.baty.net/rss.xml) .

The odd thing is that I normally create each daily post first thing in the morning and update it throughout the day. I’m not sure how different RSS readers will handle this, but it’s a start.

I haven’t added the discovery links yet, but should. I also don’t think the RSS tiddler needs all those non-breaking spaces so I may play with that later.

****Update March 11, 2022****: Saq Imtiaz sent a link to his [experimental plugin for generating RSS and JSON feeds](https://github.com/saqimtiaz/tw5-feeds) . Worth a look!
