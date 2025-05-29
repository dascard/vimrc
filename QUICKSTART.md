# Vim Configuration Quick Reference

## 🚀 Quick Start
```bash
# Install configuration
./install.sh

# Or manually:
cp .vimrc ~/.vimrc
cp coc-settings.json ~/.vim/
cp tasks.ini ~/.vim/tasks/
vim +PluginInstall +qall
```

## ⌨️ Essential Keybindings

### Basic
- `jk` → Exit insert mode
- `;` → Leader key
- `Ctrl+s` → Save file
- `F12` → Toggle floating terminal

### Build & Run (AsyncTasks)
- `F5` → Run current file
- `F6` → Build project
- `F7` → Run project
- `F8` → Build and run

### Navigation
- `Arrow keys` → Switch windows
- `F2` → Toggle file tree (NERDTree)
- `F4` → Toggle tag list (Tagbar)

### Leader Commands (`;`)
- `;w` → Save file
- `;q` → Quit
- `;=` → Format code (Prettier)
- `;h/j/k/l` → Navigate

### Space Commands
- `Space+f` → Find files
- `Space+b` → Buffer operations
- `Space+w` → Window operations
- `Space+t` → Terminal operations
- `Space+g` → Git operations

## 🔧 Core Plugins

### Essential
- **Vundle** - Plugin manager
- **COC.nvim** - Code completion & LSP
- **AsyncTasks** - Build system
- **Floaterm** - Terminal integration

### Development
- **NERDTree** - File explorer
- **Airline** - Status bar
- **Fugitive** - Git integration
- **Vimspector** - Debugger

### UI/UX
- **Tokyo Night** - Color scheme
- **Which-Key** - Key binding help
- **Startify** - Start screen
- **Tagbar** - Code outline

## 📁 File Structure
```
.vimrc              # Main configuration
coc-settings.json   # Language server settings
tasks.ini           # Build/run tasks
install.sh          # Installation script
README.md           # Full documentation
```

## 🛠️ Language Support

### Configured Languages
- C/C++ (clangd)
- Python (pyright)
- JavaScript/TypeScript (tsserver)
- Java (eclipse.jdt.ls)
- Go (gopls)
- Rust (rust-analyzer)

### Install Language Servers
```vim
:CocInstall coc-clangd coc-pyright coc-tsserver coc-java coc-go coc-rust-analyzer
```

## 🎨 Customization

### Change Theme
```vim
" In .vimrc
let g:tokyonight_style = 'storm'  " night, storm
colorscheme your-theme
```

### Add Build Tasks
```ini
# In tasks.ini
[your-task]
command=your-command
cwd=$(VIM_FILEDIR)
output=terminal
```

### Modify Key Bindings
```vim
" In .vimrc - Plugin Configuration section
nnoremap <F9> :YourCommand<CR>
```

## 🐛 Common Issues

1. **COC not working** → Install Node.js >= 12.12
2. **Icons not showing** → Install Nerd Font
3. **Colors wrong** → Enable true color in terminal
4. **Plugins not loading** → Run `:PluginInstall`

## 📞 Support

- Check `:messages` for errors
- Use `:CocInfo` for COC issues
- See full README.md for detailed troubleshooting
