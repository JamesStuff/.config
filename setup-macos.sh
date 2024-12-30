#!/bin/zsh

# xcode command line tools
xcode-select --install

# Enable Cmd + Ctrl for window dragging from anywhere
defaults write -g NSWindowShouldDragOnGesture -bool true
# defaults delete -g NSWindowShouldDragOnGesture

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# TODO: Have a look at this...
# # Enable subpixel font rendering on non-Apple LCDs
# defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Enable tap to click (Trackpad) for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true


# Avoid the creation of .DS_Store files on network volumes or USB drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Finder stuff...
defaults write com.apple.finder ShowPathbar -bool true                     # Show path bar
defaults write com.apple.finder ShowStatusBar -bool true                   # Show status bar
killall Finder



# Get sudo
#sudo -v

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Enable brew
(
  echo
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
) >>/Users/mrf/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages and casks with brew
echo "Installing programs with homebrew"
brew update
brew upgrade

brew install --cask discord karabiner-elements raycast visual-studio-code anki backuploupe betterdisplay blender docker firefox font-xkcd gimp font-sf-mono-nerd-font handbrake homerow hot iina inkscape iterm2 maxtex mos nightfall obs openscad parsec prismlauncher prusaslicer rstudio slack spotify steam utm diffusionbee aerospace mos

brew install arp-scan asciinema bash bat cdecl cowsay fastfetch fd ffmpeg fish fontforge fzf gallery-dl git-delta glow gnu-typist go gradle htop hugo ice iftop imagemagick ipython jandedobbeleer/oh-my-posh/oh-my-posh jq koekeishiya/formulae/skhd koekeishiya/formulae/yabai llvm lp_solve mactop maven mypy neofetch neovim node numpy pdf2json pdf2svg pinentry-mac pipx pnpm pyenv-virtualenv pyenv-virtualenvwrapper r rclone ripgrep ruby samba thefuck tlrc tmux tmux-sessionizer tree wakeonlan wget xcbeautify you-get youtube-dl yt-dlp zig zlib zoxide zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting

# create LaunchAgents dir
mkdir -p ~/Library/LaunchAgents

# enable automatic updates every 12 hours
echo "Enabling autoupdate for homebrew packages..."
brew tap homebrew/autoupdate
brew autoupdate start 43200 --upgrade


# === Dock ===
# Folders to add to the dock
dockutil --add '/Applications' --view grid --display folder --no-restart
dockutil --add '~/Downloads' --view list --display folder


# git config
echo "Setting up git"
git config --global user.name "James Robinson"
git config --global user.email "james@jamesrob.com"
