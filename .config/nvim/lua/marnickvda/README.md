# Neovim Config

This Neovim configuration is built around
**[Lazy.nvim](https://github.com/folke/lazy.nvim)** for modular, lazy-loaded
plugin management. It emphasizes readability, scalability, and maintainability.

---

## Folder Structure

```text
lua/marnickvda/
├── core/               # Core config (non-plugins)
│   ├── config.lua         # Central config values (e.g., ensure_installed)
│   ├── init.lua           # Loads settings, remaps, plugin manager
│   ├── plugin-manager.lua # Lazy.nvim setup
│   ├── settings.lua       # Vim options (tab size, mouse, etc.)
│   ├── keybinds.lua       # Global keymaps
│   └── remap.lua          # Key remapping utilities
├── plugins/            # Lazy.nvim plugin specs
│   ├── core/              # Foundational tools
│   │   ├── formatter.lua
│   │   ├── mason.lua
│   │   ├── trouble.lua
│   │   ├── lazygit.lua
│   │   └── which-key.lua
│   ├── editing/           # Text-editing enhancements (autopairs, surround, etc.)
│   ├── lsp/               # LSP setup (completion, keymaps, config)
│   ├── navigation/        # File/tree navigation (telescope, nvim-tree)
│   ├── treesitter/        # Treesitter and related plugins
│   │   ├── treesitter.lua
│   │   ├── highlight.lua
│   │   ├── textobjects.lua
│   │   └── treesitter-context.lua
│   ├── ui/                # Visual and interface plugins (colorscheme, statusline, etc.)
│   └── init.lua           # Loads plugin imports from all subfolders
```

---

## 🧐 Plugin Organization

Plugins are grouped by purpose and placed in their corresponding folder:

| Folder        | Purpose                                                 |
| ------------- | ------------------------------------------------------- |
| `core/`       | Foundational tools like Mason, formatters, diagnostics  |
| `editing/`    | Code editing enhancements (e.g., autopairs, surround)   |
| `lsp/`        | Language Server Protocol setup, completion, LSP keymaps |
| `navigation/` | Navigation tools (e.g., Telescope, nvim-tree, tmux)     |
| `treesitter/` | Syntax highlighting and context via Treesitter          |
| `ui/`         | Themes, status lines, scroll animations, etc.           |

Each plugin is defined in its own file and lazy-loaded appropriately.

---

## Adding a New Plugin

1. **Pick a folder** under `plugins/` based on the plugin’s purpose.
2. **Create a new file**, e.g., `myplugin.lua`, and return a plugin spec:

```lua
-- plugins/ui/alpha-nvim.lua
return {
  "goolord/alpha-nvim",
  config = function()
    require("alpha").setup(require("alpha.themes.startify").config)
  end,
}
```

3. **Done!** It will be automatically picked up by Lazy via `plugins/init.lua`.

---

## Configuration Centralization

Shared config like `ensure_installed` for Mason and Treesitter is defined in:

```lua
marnickvda/core/config.lua
```

Access it in plugin specs like:

```lua
ensure_installed = require("marnickvda.core.config").ensure_installed.mason
```

---

## Plugin Management

- Run `:Lazy` to open the Lazy.nvim UI
- Run `:Mason` to install LSP servers and formatters
- Run `:TSUpdate` to update Treesitter parsers

---

## Requirements

- Neovim ≥ 0.9
- `git`, `curl`, and system utilities for Mason
- Optional: `ripgrep`, `fd`, `node`, `go`, etc. (for certain plugins)
