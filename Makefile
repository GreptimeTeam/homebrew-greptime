# For example: make update-version VERSION=${GREPTIME_VERSION}
# make update-greptime-version VERSION=v0.14.2
.PHONY: update-greptime-version
update-greptime-version: ## Run update greptime version
	./scripts/update-greptime-version.sh $(VERSION)
