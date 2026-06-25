# Skills

Claude Code skills, managed independently of any dotfiles.

## Setup

Clone anywhere, then symlink into Claude:

```bash
git clone <repository-url> ~/Developer/n1kben/skills
cd ~/Developer/n1kben/skills
make install
```

`make install` symlinks this repo (wherever it lives) to `~/.claude/skills`.
Run `make uninstall` to remove the link.

Because it's a plain directory symlink, you can point other tools/agents at the
same repo (e.g. `ln -sfn "$PWD" <other-tool>/skills`).
