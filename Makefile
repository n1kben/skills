# Skills installer — location-independent.
# Computes its own path, so `make install` works no matter where the repo is
# cloned. Symlinks the repo's skills/ directory into ~/.claude/skills.

DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

.PHONY: install uninstall help

help: ## Show available targets
	@grep -E '^[a-z][a-zA-Z-]*:.*##' $(MAKEFILE_LIST) | sed -E 's/:.*## /\t/'

install: ## Symlink this repo's skills/ into ~/.claude/skills
	@mkdir -p $(HOME)/.claude
	ln -sfn "$(DIR)/skills" "$(HOME)/.claude/skills"

uninstall: ## Remove the ~/.claude/skills symlink
	rm -f "$(HOME)/.claude/skills"
