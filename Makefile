# Skills installer — location-independent.
# Computes its own path, so `make install` works no matter where the repo is
# cloned. Symlinks this repo as a whole into ~/.claude/skills.

DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

.PHONY: install uninstall help

help: ## Show available targets
	@grep -E '^[a-z][a-zA-Z-]*:.*##' $(MAKEFILE_LIST) | sed -E 's/:.*## /\t/'

install: ## Symlink this repo into ~/.claude/skills
	@mkdir -p $(HOME)/.claude
	ln -sfn "$(DIR)" "$(HOME)/.claude/skills"

uninstall: ## Remove the ~/.claude/skills symlink
	rm -f "$(HOME)/.claude/skills"
