SERVER_HOST=server01.baty.net
SERVER_DIR=/home/jbaty/apps/daily.baty.net/public_html
PUBLIC_DIR=~/sites/daily.baty.net/_site/
TARGET=server01.baty.net

.POSIX:
.PHONY: build checkpoint deploy clean

build:
	npx @11ty/eleventy

clean:
	rm -rf _site/

checkpoint:
	git add .
	git diff-index --quiet HEAD || git commit -m "Publish checkpoint"

deploy: build checkpoint
	git push
# @echo "\033[0;32mDeploying updates to $(TARGET)...\033[0m"
# rsync -v -rz --checksum --delete --no-perms $(PUBLIC_DIR) $(SERVER_HOST):$(SERVER_DIR)
