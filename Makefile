# Skills installer — location-independent.
# Computes its own path, so `make install` works no matter where the repo is
# cloned. Symlinks the repo's skills/ directory into ~/.claude/skills and ~/.agents/skills.

DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

.PHONY: install uninstall help

help: ## Show available targets
	@grep -E '^[a-z][a-zA-Z-]*:.*##' $(MAKEFILE_LIST) | sed -E 's/:.*## /\t/'

install: ## Symlink this repo's skills/ into ~/.claude/skills and ~/.agents/skills
	@mkdir -p $(HOME)/.claude $(HOME)/.agents
	ln -sfn "$(DIR)/skills" "$(HOME)/.claude/skills"
	ln -sfn "$(DIR)/skills" "$(HOME)/.agents/skills"

uninstall: ## Remove the ~/.claude/skills and ~/.agents/skills symlinks
	rm -f "$(HOME)/.claude/skills" "$(HOME)/.agents/skills"
