---
title: "Fighting with Eleventy"
date: "2023-02-19"
categories:
  - "software"
tags:
  - "blogging"
  - "eleventy"
---

Over at [daily.baty.net](https://daily.baty.net), I've been trying to wrangle [Eleventy](https://11ty.dev) into showing the posts I want on the home page, in the order I want them. I've completely failed so far and it's very frustrating. I don't think this is at all the fault of Eleventy. I'm just really slow to pick up new things.

I have two tag-based "collections" in Eleventy: Journal and Post. I've always only shown "collections.journal" on the home page but I wanted to include regular blog posts, too. Do you think I can figure out how to do that? Nope. The closest I've come is to create a custom collection like so:

```javascript
eleventyConfig.addCollection("myHomeCollection", function(collectionApi) {
        const journals = collectionApi.getFilteredByTags("journal");
        const posts = collectionApi.getFilteredByTags("post");
        return allHomePosts = [...journals,...posts];
    });
```

This gets me the correct set of posts, but they're sorted first by tag and then by date, so it's unusable on the home page. I want reverse-chronological over the entire array but I've no idea how to do that. I'm so dense.

In the template, I use the reverse filter, `{ % for post in postslist | reverse % }`, but no joy. What the heck am I doing wrong here?
