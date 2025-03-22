# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Finder: Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true


## DOCK

# Set the icon size of Dock items to 40 pixels
defaults write com.apple.dock tilesize -int 40 

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
 
# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Disable magnification
defaults write com.apple.dock magnification -bool false

# Minimize windows into applications icons
defaults write com.apple.dock minimize-to-application -bool true

# Show an indicator below the application icon when an application is running
defaults write com.apple.dock show-process-indicators -bool true

# Don't animate opening applications
defaults write com.apple.dock launchanim -bool false

mkdir -p $HOME/Desktop/Screenshots
defaults write com.apple.screencapture location $HOME/Desktop/Screenshots
