# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade

# Install libraries
# Run `brew leaves | xargs brew desc --eval-all | awk -F': ' '{printf "\t%-24s # %s\n", $1, $2}'` to get the latest list.

formulaes=(
    stow            # Organize software neatly under a single directory tree (e.g. /usr/local)
    neovim          # Ambitious Vim-fork focused on extensibility and agility
    tmux            # Terminal multiplexer
    
    git             # Distributed revision control system
    lazygit         # Simple terminal UI for git commands
    gitleaks        # Audit git repos for secrets

    bat             # Clone of cat(1) with syntax highlighting and Git integration
    fzf             # Command-line fuzzy finder written in Go
    ripgrep         # Search tool like grep and The Silver Searcher
    tree            # Display directories as trees (with optional color/HTML output)

    nmap            # Port scanning utility for large networks
    dug             # Global DNS propagation checker that gives pretty output

    make            # Utility for directing compilation
    direnv          # Load/unload environment variables based on $PWD
    caddy           # Powerful, enterprise-ready, open source web server with automatic HTTPS

    go              # Open source programming language to build simple/reliable/efficient software
    golang-migrate  # Database migrations CLI tool
    goose           # Go Language's command-line interface for database migrations
    sqlc            # Generate type safe Go from SQL

    hey             # HTTP load generator, ApacheBench (ab) replacement
    imagemagick     # Tools and libraries to manipulate images in many formats

    mysql           # Open source relational database management system
    postgresql@15   # Object-relational database system

    powerlevel10k   # Theme for zsh
    prettier        # Code formatter for JavaScript, CSS, JSON, GraphQL, Markdown, YAML
    prettierd       # Prettier daemon

    openjdk@21      # Development kit for the Java programming language
    typescript      # Language for application scale JavaScript development

    nvm             # Manage multiple Node.js versions
    cocoapods       # Dependency manager for Cocoa projects
)

brew install "${formulaes[@]}"

# Install Applications
# Run `brew ls --casks | xargs brew desc --eval-all | awk -F': ' '{printf "\t%-24s # %s\n", $1, $2}'` to get the latest list.

casks=(
    1password                # (1Password) Password manager that keeps all passwords secure behind one password
	appcleaner               # (FreeMacSoft AppCleaner) Application uninstaller
	bruno                    # (Bruno) Opensource IDE for exploring and testing api's
	docker                   # Pack, ship and run any application as a lightweight container
	font-meslo-lg-nerd-font  # (MesloLG Nerd Font families (Meslo LG))
	iterm2                   # (iTerm2) Terminal emulator as alternative to Apple's Terminal app
	microsoft-auto-update    # (Microsoft Auto Update) Provides updates to various Microsoft products
	microsoft-office         # (Microsoft Office) Office suite
	minecraft                # (Minecraft) Sandbox construction video game
	pgadmin4                 # (pgAdmin4) Administration and development platform for PostgreSQL
	rectangle                # (Rectangle) Move and resize windows using keyboard shortcuts or snap areas
	slack                    # (Slack) Team communication and collaboration software
	spotify                  # (Spotify) Music streaming service
	visual-studio-code       # (Microsoft Visual Studio Code, VS Code) Open-source code editor
	whatsapp                 # (WhatsApp) Native desktop client for WhatsApp
    google-chrome            # (Google Chrome) Web browser
)

brew install --cask "${casks[@]}"

# Move all dotfiles to correct locations.
stow .

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Run 'p10k configure' to setup the zsh theme"
