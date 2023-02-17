module.exports = {
	tags: [
		"journal"
	],
	"layout": "layouts/post.njk",
	"permalink": "/{{page.date.getFullYear() }}/{{ page.fileSlug }}/",
};
