# Dotfiles

A comprehensive collection of dotfiles and system configuration scripts for a reproducible development environment, managed by dotbot.

## Overview

This repository contains both dotfiles and installation scripts for setting up a complete development environment. It uses [dotbot](https://github.com/anishathalye/dotbot) for managing configuration files and includes scripts for installing and configuring software packages.

## Features

- **Dotbot-based Configuration Management**: YAML-based configuration with automatic symlinking
- **Modular Installation Scripts**: Separate scripts for different aspects of system setup
- **Cross-Platform Support**: Designed to work on Linux systems (primarily tested on Ubuntu/Debian-based distributions)
- **Version Control**: All configurations are version controlled for easy updates and rollbacks
- **User Customization**: Easy to override configurations without editing scripts

## Repository Structure

```
dotfiles/
├── bootstrap.sh          # Main entry point
├── install/             # Custom installation scripts
│   ├── install.sh       # Main installation logic
│   ├── packages.sh      # Package management
│   └── ...             # Other installation scripts
├── config/              # All configurations
│   ├── dotbot/         # Dotbot-specific configs
│   │   ├── install.conf.yaml    # Main dotbot config
│   │   ├── packages.yaml        # Package specifications
│   │   └── ...                 # Other config files
│   └── ...             # Other configurations
└── .config/            # Your actual dotfiles
    ├── nvim/
    ├── tmux/
    └── ...
```

## Prerequisites

- Git
- Bash shell
- sudo access (for package installation)

## Quick Start

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Run the bootstrap script:
   ```bash
   ./bootstrap.sh
   ```

The bootstrap script will:
- Initialize dotbot as a git submodule
- Set up all symlinks
- Run installation scripts
- Configure your system

## Configuration

### Package Management

Edit `config/dotbot/packages.yaml` to customize which packages are installed:
```yaml
packages:
  system:
    - build-essential
    - git
    # Add or remove packages
  development:
    - neovim
    - tmux
    # Add or remove packages
```

### User-Specific Overrides

Create `~/.dotfiles_config.sh` to override any settings:
```bash
# Override package categories
INSTALL_PACKAGES=true
INSTALL_LANGUAGES=false

# Override update mode
PACKAGE_UPDATE_MODE="update"
```

## Customization

### Adding New Configurations

1. Add your configuration files to the appropriate directory in `.config/`
2. Add the symlink to `config/dotbot/install.conf.yaml`:
   ```yaml
   - link:
       ~/.your-config: .config/your-config
   ```

### Adding New Packages

1. Add the package to the appropriate category in `config/dotbot/packages.yaml`
2. Run the bootstrap script again

## Maintenance

### Updating Configurations

To update your configurations:
```bash
cd ~/dotfiles
git pull
./bootstrap.sh
```

### Adding New Software

1. Add the package to `config/dotbot/packages.yaml`
2. Add any configuration files to `.config/`
3. Add symlinks to `config/dotbot/install.conf.yaml`
4. Run `./bootstrap.sh`

## Troubleshooting

### Common Issues

1. **Symlink Conflicts**
   - Remove existing symlinks: `rm ~/.config`
   - Run bootstrap again

2. **Package Installation Failures**
   - Check package names in `packages.yaml`
   - Verify package availability for your distribution

3. **Permission Issues**
   - Ensure you have sudo access
   - Check file permissions

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [dotbot](https://github.com/anishathalye/dotbot) for the configuration management system
- Inspired by various dotfiles repositories in the community
