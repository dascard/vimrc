#!/bin/bash

# Dascard's Vim Configuration Installer
# Author: dascard
# Email: dascard601@gmail.com

set -e  # Exit on any error

echo "🚀 Dascard's Vim Configuration Installer"
echo "========================================="

# Function to print colored output
print_info() {
    echo -e "\033[34m[INFO]\033[0m $1"
}

print_success() {
    echo -e "\033[32m[SUCCESS]\033[0m $1"
}

print_warning() {
    echo -e "\033[33m[WARNING]\033[0m $1"
}

print_error() {
    echo -e "\033[31m[ERROR]\033[0m $1"
}

# Check if Vim is installed
if ! command -v vim &> /dev/null; then
    print_error "Vim is not installed. Please install Vim first."
    exit 1
fi

# Backup existing configuration
print_info "Backing up existing Vim configuration..."
if [ -f ~/.vimrc ]; then
    cp ~/.vimrc ~/.vimrc.backup.$(date +%Y%m%d_%H%M%S)
    print_success "Backed up ~/.vimrc"
fi

if [ -d ~/.vim ]; then
    cp -r ~/.vim ~/.vim.backup.$(date +%Y%m%d_%H%M%S)
    print_success "Backed up ~/.vim directory"
fi

# Get current script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Vundle if not exists
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    print_info "Installing Vundle plugin manager..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    print_success "Vundle installed"
else
    print_info "Vundle already exists, updating..."
    cd ~/.vim/bundle/Vundle.vim && git pull
fi

# Create necessary directories
print_info "Creating necessary directories..."
mkdir -p ~/.vim/tasks
mkdir -p ~/.vim/autoload

# Copy configuration files
print_info "Installing configuration files..."
cp "$SCRIPT_DIR/.vimrc" ~/.vimrc
cp "$SCRIPT_DIR/coc-settings.json" ~/.vim/coc-settings.json
cp "$SCRIPT_DIR/tasks.ini" ~/.vim/tasks/tasks.ini

print_success "Configuration files installed"

# Install plugins
print_info "Installing Vim plugins (this may take a while)..."
vim +PluginInstall +qall

print_success "Plugins installed"

# Check for Node.js (required for COC.nvim)
if ! command -v node &> /dev/null; then
    print_warning "Node.js is not installed. COC.nvim requires Node.js >= 12.12"
    echo "Please install Node.js from: https://nodejs.org/"
else
    NODE_VERSION=$(node --version | cut -d'v' -f2)
    print_info "Node.js version: $NODE_VERSION"
fi

# Check for common development tools
print_info "Checking for development tools..."

tools_to_check=("git" "python3" "pip3" "gcc" "g++" "java" "javac")
missing_tools=()

for tool in "${tools_to_check[@]}"; do
    if command -v "$tool" &> /dev/null; then
        print_success "$tool is installed"
    else
        missing_tools+=("$tool")
        print_warning "$tool is not installed"
    fi
done

if [ ${#missing_tools[@]} -gt 0 ]; then
    echo ""
    print_warning "The following tools are missing and may be needed for development:"
    for tool in "${missing_tools[@]}"; do
        echo "  - $tool"
    done
    echo ""
    echo "Install them with:"
    echo "  sudo apt-get update"
    echo "  sudo apt-get install ${missing_tools[*]}"
fi

# Final messages
echo ""
print_success "🎉 Installation completed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Restart your terminal or run 'source ~/.bashrc'"
echo "2. Open Vim and run ':PluginInstall' if any plugins failed to install"
echo "3. Install language servers for COC.nvim:"
echo "   :CocInstall coc-clangd coc-pyright coc-tsserver coc-java"
echo "4. Install a Nerd Font for better icons (recommended: JetBrains Mono)"
echo ""
echo "📖 For more information, see README.md"
echo "🐛 If you encounter issues, check the troubleshooting section in README.md"
echo ""
echo "Happy coding! 🚀"
