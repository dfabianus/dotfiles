```bash
# See changes in your actual dotfiles that aren't in the repo
chezmoi diff

# See changes in the repo that would be applied to your dotfiles
chezmoi diff --reverse

# Apply changes from repo to your dotfiles
chezmoi apply

# Add a new file to be managed by chezmoi
chezmoi add ~/.somefile

# Edit a file in the repo
chezmoi edit ~/.somefile

# See what files chezmoi is managing
chezmoi managed

# See what files chezmoi is not managing
chezmoi unmanaged
```
