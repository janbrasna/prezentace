CONTAINER_IMAGE=docker.io/library/ruby:2.7-buster
JEKYLL_ENV=production
HTML_PROOFER_OPTIONS=--disable-external
undefine BUNDLE_APP_CONFIG # let bundler use config from .bundle; in bash it would be 'unset BUNDLE_APP_CONFIG'

prepare:
	gem install bundler -v "~> 2.0"
	bundle install

build:
	bundle exec jekyll build
	bundle exec htmlproofer '_site/index.html' $(HTML_PROOFER_OPTIONS)

build_in_docker:
	docker pull $(CONTAINER_IMAGE)
	docker run --user $(id -u):$(id -g) \
		--workdir $(PWD) \
		-v $(PWD):$(PWD) \
		--rm=true \
		--entrypoint=/bin/sh \
		-e JEKYLL_ENV=$(JEKYLL_ENV) \
		-e LC_ALL='C.UTF-8' `# required for html-proofer to work correctly in the container` \
		$(CONTAINER_IMAGE) -c 'make prepare && make build'

build_in_podman:
	podman pull $(CONTAINER_IMAGE)
	podman run \
		--workdir $(PWD) \
		-v $(PWD):$(PWD):Z \
		--rm=true \
		--entrypoint=/bin/sh \
		-e JEKYLL_ENV=$(JEKYLL_ENV) \
		-e LC_ALL='C.UTF-8' `# required for html-proofer to work correctly in the container` \
		$(CONTAINER_IMAGE) -c 'make prepare && make build'
