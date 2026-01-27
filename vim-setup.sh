#!/bin/bash

# ============================================================================
# VIM DEVELOPMENT ENVIRONMENT SETUP SCRIPT
# For: Brandon Martinez - Java/Spring Boot/DevOps Engineer
# ============================================================================

set -e  # Exit on error

echo "=========================================="
echo "Vim Development Environment Setup"
echo "=========================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_info() {
    echo -e "${YELLOW}[i]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Check if running on Linux/macOS
if [[ "$OSTYPE" != "linux-gnu"* ]] && [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for Linux or macOS"
    exit 1
fi

# Detect package manager
if command -v apt-get &> /dev/null; then
    PKG_MANAGER="apt-get"
    INSTALL_CMD="sudo apt-get install -y"
elif command -v yum &> /dev/null; then
    PKG_MANAGER="yum"
    INSTALL_CMD="sudo yum install -y"
elif command -v brew &> /dev/null; then
    PKG_MANAGER="brew"
    INSTALL_CMD="brew install"
else
    print_error "No supported package manager found (apt-get, yum, or brew)"
    exit 1
fi

print_info "Detected package manager: $PKG_MANAGER"
echo ""

# ============================================================================
# 1. INSTALL DEPENDENCIES
# ============================================================================
echo "Step 1: Installing system dependencies..."
echo ""

# Install Vim
if ! command -v vim &> /dev/null; then
    print_info "Installing Vim..."
    $INSTALL_CMD vim
    print_status "Vim installed"
else
    print_status "Vim already installed"
fi

# Install Git
if ! command -v git &> /dev/null; then
    print_info "Installing Git..."
    $INSTALL_CMD git
    print_status "Git installed"
else
    print_status "Git already installed"
fi

# Install curl
if ! command -v curl &> /dev/null; then
    print_info "Installing curl..."
    $INSTALL_CMD curl
    print_status "curl installed"
else
    print_status "curl already installed"
fi

# Install Node.js and npm (required for CoC)
if ! command -v node &> /dev/null; then
    print_info "Installing Node.js..."
    if [[ "$PKG_MANAGER" == "brew" ]]; then
        brew install node
    else
        curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
        sudo apt-get install -y nodejs
    fi
    print_status "Node.js installed"
else
    print_status "Node.js already installed"
fi

# Install ripgrep for better search (used by FZF)
if ! command -v rg &> /dev/null; then
    print_info "Installing ripgrep..."
    $INSTALL_CMD ripgrep
    print_status "ripgrep installed"
else
    print_status "ripgrep already installed"
fi

# Install fd-find (alternative to find, used by FZF)
if [[ "$PKG_MANAGER" == "apt-get" ]]; then
    if ! command -v fdfind &> /dev/null; then
        print_info "Installing fd-find..."
        $INSTALL_CMD fd-find
        print_status "fd-find installed"
    else
        print_status "fd-find already installed"
    fi
elif [[ "$PKG_MANAGER" == "brew" ]]; then
    if ! command -v fd &> /dev/null; then
        print_info "Installing fd..."
        $INSTALL_CMD fd
        print_status "fd installed"
    else
        print_status "fd already installed"
    fi
fi

# Install universal-ctags for better code navigation
if ! command -v ctags &> /dev/null; then
    print_info "Installing universal-ctags..."
    if [[ "$PKG_MANAGER" == "brew" ]]; then
        brew install universal-ctags
    else
        $INSTALL_CMD universal-ctags || $INSTALL_CMD exuberant-ctags
    fi
    print_status "ctags installed"
else
    print_status "ctags already installed"
fi

echo ""

# ============================================================================
# 2. BACKUP EXISTING CONFIGURATION
# ============================================================================
echo "Step 2: Backing up existing configuration..."
echo ""

BACKUP_DIR="$HOME/.vim_backup_$(date +%Y%m%d_%H%M%S)"

if [ -f "$HOME/.vimrc" ]; then
    print_info "Backing up existing .vimrc to $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    cp "$HOME/.vimrc" "$BACKUP_DIR/"
    print_status "Backup created"
fi

if [ -d "$HOME/.vim" ]; then
    print_info "Backing up existing .vim directory to $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    cp -r "$HOME/.vim" "$BACKUP_DIR/"
    print_status "Backup created"
fi

echo ""

# ============================================================================
# 3. INSTALL VIM-PLUG
# ============================================================================
echo "Step 3: Installing vim-plug..."
echo ""

if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    print_info "Downloading vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    print_status "vim-plug installed"
else
    print_status "vim-plug already installed"
fi

echo ""

# ============================================================================
# 4. CREATE DIRECTORY STRUCTURE
# ============================================================================
echo "Step 4: Creating directory structure..."
echo ""

mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/undodir
mkdir -p ~/.vim/colors
mkdir -p ~/.config/coc

print_status "Directory structure created"
echo ""

# ============================================================================
# 5. COPY CONFIGURATION FILES
# ============================================================================
echo "Step 5: Installing configuration files..."
echo ""

# Note: The actual .vimrc and coc-settings.json should be in the same directory
# as this script or you need to adjust the paths

print_info "Installing .vimrc..."
# Assuming the configuration file is in the same directory
if [ -f "$(dirname "$0")/.vimrc" ]; then
    cp "$(dirname "$0")/.vimrc" "$HOME/.vimrc"
    print_status ".vimrc installed"
else
    print_info ".vimrc file not found in script directory, assuming already in place"
fi

print_info "Installing CoC settings..."
if [ -f "$(dirname "$0")/coc-settings.json" ]; then
    cp "$(dirname "$0")/coc-settings.json" "$HOME/.vim/coc-settings.json"
    print_status "CoC settings installed"
else
    print_info "coc-settings.json file not found in script directory, assuming already in place"
fi

echo ""

# ============================================================================
# 6. INSTALL VIM PLUGINS
# ============================================================================
echo "Step 6: Installing Vim plugins..."
echo ""

print_info "This will open Vim and install all plugins..."
print_info "Wait for the installation to complete, then press Enter to continue."
echo ""

vim +PlugInstall +qall

print_status "Vim plugins installed"
echo ""

# ============================================================================
# 7. INSTALL COC EXTENSIONS
# ============================================================================
echo "Step 7: Installing CoC extensions..."
echo ""

print_info "Installing CoC extensions for Java, JSON, YAML, etc..."

vim -c "CocInstall -sync coc-json coc-yaml coc-java coc-snippets coc-pairs coc-git|q"

print_status "CoC extensions installed"
echo ""

# ============================================================================
# 8. INSTALL JAVA LANGUAGE SERVER (Optional)
# ============================================================================
echo "Step 8: Java Language Server setup..."
echo ""

if command -v java &> /dev/null; then
    print_status "Java detected on system"
    print_info "For full Java support, you need Eclipse JDT Language Server (jdtls)"
    print_info "Installation instructions:"
    echo "  1. Download from: https://download.eclipse.org/jdtls/snapshots/"
    echo "  2. Extract to: ~/.local/share/eclipse.jdt.ls/"
    echo "  3. Add to PATH or create alias in ~/.bashrc:"
    echo "     alias jdtls='java -jar ~/.local/share/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_*.jar'"
else
    print_info "Java not detected. Install JDK for Java development:"
    echo "  Ubuntu/Debian: sudo apt-get install openjdk-17-jdk"
    echo "  macOS: brew install openjdk@17"
fi

echo ""

# ============================================================================
# 9. ADDITIONAL TOOLS
# ============================================================================
echo "Step 9: Additional recommended tools..."
echo ""

print_info "For complete functionality, consider installing:"
echo ""
echo "  Maven (if not present):"
echo "    Ubuntu/Debian: sudo apt-get install maven"
echo "    macOS: brew install maven"
echo ""
echo "  Docker CLI (if working with containers):"
echo "    Follow: https://docs.docker.com/engine/install/"
echo ""
echo "  kubectl (if working with Kubernetes):"
echo "    Follow: https://kubernetes.io/docs/tasks/tools/"
echo ""
echo "  Linters for code quality:"
echo "    - yamllint: pip install yamllint"
echo "    - hadolint: brew install hadolint"
echo "    - checkstyle: For Java linting"
echo ""

# ============================================================================
# 10. FINAL STEPS
# ============================================================================
echo "=========================================="
echo "Installation Complete!"
echo "=========================================="
echo ""

print_status "Your Vim development environment is ready!"
echo ""
echo "Quick Start Guide:"
echo "==================="
echo ""
echo "Basic Commands:"
echo "  - Open Vim: vim"
echo "  - File explorer: Ctrl+n"
echo "  - Fuzzy file search: Ctrl+p"
echo "  - Search in files: Ctrl+f"
echo "  - Tag/structure bar: F8"
echo ""
echo "Leader Key Commands (Space + key):"
echo "  - <Space>w : Save file"
echo "  - <Space>q : Quit"
echo "  - <Space>nf : Find current file in NERDTree"
echo "  - <Space>f : Format code"
echo "  - <Space>rn : Rename symbol"
echo ""
echo "Java-Specific:"
echo "  - gd : Go to definition"
echo "  - gr : Find references"
echo "  - K : Show documentation"
echo "  - <Space>ji : Organize imports"
echo ""
echo "Split Navigation:"
echo "  - Ctrl+h/j/k/l : Move between splits"
echo ""
echo "Custom Commands:"
echo "  :SpringBootRun : Run Spring Boot app"
echo "  :MavenClean : Clean and install with Maven"
echo "  :DockerPs : List Docker containers"
echo "  :KubectlPods : List Kubernetes pods"
echo ""
echo "Next Steps:"
echo "  1. Run 'vim' to start editing"
echo "  2. Type ':PlugStatus' to check plugins"
echo "  3. Type ':CocInfo' to verify CoC installation"
echo "  4. Open a Java file to test language server"
echo ""
echo "Configuration files:"
echo "  - Main config: ~/.vimrc"
echo "  - CoC config: ~/.vim/coc-settings.json"
echo "  - Backup: $BACKUP_DIR (if existed)"
echo ""
echo "For help: :help or visit https://vim.fandom.com"
echo ""

print_status "Happy coding! 🚀"
