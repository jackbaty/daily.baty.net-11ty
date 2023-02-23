SERVER_HOST=server01.baty.net
SERVER_DIR=/home/jbaty/apps/baty.blog/public_html
PUBLIC_DIR=/Users/jbaty/sites/baty.net-eleventy/_site/
TARGET=server01.baty.net

.POSIX:
.PHONY: build checkpoint deploy

# npx -y pagefind --source public

build:
	rm -rf $PUBLIC_DIR
	npm run build

checkpoint:
	git add .
	git diff-index --quiet HEAD || git commit -m "Publish checkpoint"

deploy: build checkpoint
	git push
#	@echo "\033[0;32mDeploying updates to $(TARGET)...\033[0m"
#	rsync -v -rz --checksum --delete --no-perms $(PUBLIC_DIR) $(SERVER_HOST):$(SERVER_DIR)

