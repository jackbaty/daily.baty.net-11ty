module.exports = {
	tags: [
		"posts"
	],
	"layout": "layouts/post.njk",
	"permalink": "/{{page.date.getFullYear() }}/{{ page.fileSlug }}/",
};
