#!/usr/bin/env bash

DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "Dotfiles directory: ${DIR}"

OS="$(uname -s)"
case "${OS}" in
  Linux*)     PLATFORM=Linux;;
  Darwin*)    PLATFORM=Mac;;
  CYGWIN*)    PLATFORM=Cygwin;;
  MINGW*)     PLATFORM=MinGw;;
  *)          PLATFORM="UNKNOWN:${OS}"
esac

echo "Detected platform: ${PLATFORM}"

mkdir -p ${HOME}/.config
ln -s ${DIR}/config/nvim        ${HOME}/.config/nvim
ln -s ${DIR}/config/ghostty     ${HOME}/.config/ghostty
ln -s ${DIR}/config/mpv         ${HOME}/.config/mpv
ln -s ${DIR}/config/gitui       ${HOME}/.config/gitui
ln -s ${DIR}/config/stylua      ${HOME}/.config/stylua
ln -s ${DIR}/config/neovide     ${HOME}/.config/neovide
ln -s ${DIR}/config/minttab     ${HOME}/.config/minttab

mkdir -p ${HOME}/.config/yazi
ln -s ${DIR}/config/yazi/keymap.toml  ${HOME}/.config/yazi
ln -s ${DIR}/config/yazi/package.toml ${HOME}/.config/yazi
ln -s ${DIR}/config/yazi/theme.toml   ${HOME}/.config/yazi
ln -s ${DIR}/config/yazi/yazi.toml    ${HOME}/.config/yazi

if [ "${PLATFORM}" = "Mac" ]; then
  # Hammerspoon
  ln -s ${DIR}/hammerspoon ${HOME}/.hammerspoon
  # Global Spell Checking
  defaults write -g NSAllowContinuousSpellChecking -bool true
  defaults write com.apple.screencapture disable-shadow -bool true
  # Don't show dock
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock autohide-delay -float 1000
  defaults write com.apple.dock autohide-time-modifier -float 0
  # Allow Apps from Anywhere
  sudo spctl --master-disable

  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write -g ApplePressAndHoldEnabled -bool false

  killall Dock
  killall SystemUIServer

  # zshrc
  if [[ -L "${HOME}/.zshrc" ]]; then unlink "${HOME}/.zshrc"
  else rm -f "${HOME}/.zshrc"
  fi
  ln -s ${DIR}/shell/zshrc ${HOME}/.zshrc


  mkdir -p ${HOME}/Library/LaunchAgents
  echo "
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>com.aria2.app</string>
        <key>ProgramArguments</key>
        <array>
            <string>$(which minttab)</string>
        </array>
        <key>KeepAlive</key>
        <true/>
        <key>StandardErrorPath</key>
        <string>/tmp/minttab.log</string>
        <key>StandardOutPath</key>
        <string>/tmp/minttab.log</string>
        <key>EnvironmentVariables</key>
        <dict>
          <key>PATH</key>
            <string><![CDATA[/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin]]></string>
        </dict>
    <key>WorkingDirectory</key>
    <string>${HOME}</string>
    </dict>
</plist>
  " > ${HOME}/Library/LaunchAgents/com.minttab.agent.plist
fi
