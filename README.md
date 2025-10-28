## What is this?

Configuration files of various user applications like `zsh` `git` `vim`, and `zed`, on my major MacBook. All of them follows [XDG Base Directory Specification](https://wiki.archlinux.org/title/XDG_Base_Directory). What you're seeing is my `$HOME` directory with other folders and files ignored.

What you might want to see is [.config/zsh/.zshrc](/BigCoke233/dotfiles/blob/master/.config/zsh/.zshrc), which contains:

- How I implement XDG Specification
- Aliases I use very often (custom commands like `peek` and `mkcd`)
- How I set up proxies and stuff

Many of the rest are default settings. I plan on customizing them in the future.

## Issues

While going through my home directory, I found multiple issues.

1. Many apps does not support XDG
  - Logseq, for instance, hasn't implemented it since an relevant issue was created 4 years ago.
2. Many apps don't know what "config" means
  - [Zed](https://zed.dev/) store AI conversations, prompts and themes in `.config/zed`
  - Maven store repositories and binary files in `.config/maven` (normally `.m2` at `$HOME`)
  - [Mole](https://github.com/tw93/Mole) store cache here.
  - They should all be moved to `.cache`, `.local/state` or `.local/share`.

Please consider these issues and don't just dump things in user's home if you're making software.
