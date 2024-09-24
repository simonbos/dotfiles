# 🏠 Simon's dotfiles
Simon Bos' dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

First, ensure you have `git` and `chezmoi` installed.
Next, install the dotfiles with:

```
chezmoi init simonbos
```

### Managing private dotfiles 🔒
`chezmoi` is explicitly kept simple and doesn't include support for multiple repositories[^1].
However, in my setup, I do keep some (work) dotfiles private by using [these guidelines](https://github.com/twpayne/chezmoi/issues/189#issuecomment-458806742):

1. I have a seperate *private* dotfiles repository which is also managed by `chezmoi`.
1. In this repository, I include a `chezmoi` alias (`cheznous`) in my `fish` config, which adds the appropriate flags for having a seperate source directory.
1. To avoid conflicts, I try to include support for config directories. See for example the `zsh` setup.

[^1]: https://github.com/twpayne/chezmoi/issues/1169
