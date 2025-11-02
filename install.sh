DIR="$( cd "$( dirname "$0" )" && pwd )"
echo ${DIR}
echo '' > ${HOME}/.aria2.session

mkdir -p ${HOME}/.config
ln -s ${DIR}/config/nvim    ${HOME}/.config/nvim
ln -s ${DIR}/config/yazi    ${HOME}/.config/yazi
ln -s ${DIR}/config/ghostty ${HOME}/.config/ghostty
ln -s ${DIR}/config/mpv     ${HOME}/.config/mpv
ln -s ${DIR}/config/aria2   ${HOME}/.config/aria2

ln -s ${DIR}/hammerspoon   ${HOME}/.hammerspoon

mkdir -p ${HOME}/.vim
ln -s ${DIR}/vim/vimrc   ${HOME}/.vim/
ln -s ${DIR}/vim/gvimrc  ${HOME}/.vim/

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
            <string>/opt/homebrew/bin/aria2c</string>
            <string>--enable-rpc</string>
            <string>--rpc-listen-all</string>
            <string>-j 10</string>
            <string>-d Downloads</string>
        </array>
        <key>KeepAlive</key>
        <true/>
        <key>StandardErrorPath</key>
        <string>/tmp/aria2.log</string>
        <key>StandardOutPath</key>
        <string>/tmp/aria2.log</string>
        <key>EnvironmentVariables</key>
        <dict>
          <key>PATH</key>
            <string><![CDATA[/usr/local/bin:/opt/homebrew/bin]]></string>
        </dict>
    <key>WorkingDirectory</key>
    <string>${HOME}</string>
    </dict>
</plist>
" > ${HOME}/Library/LaunchAgents/com.aria2.agent.plist
