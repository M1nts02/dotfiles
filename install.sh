DIR="$( cd "$( dirname "$0" )" && pwd )"
echo ${DIR}
echo '' > ${HOME}/.aria2.session

mkdir -p ${HOME}/.config
ln -s ${DIR}/config/nvim        ${HOME}/.config/nvim
ln -s ${DIR}/config/yazi        ${HOME}/.config/yazi
ln -s ${DIR}/config/ghostty     ${HOME}/.config/ghostty
ln -s ${DIR}/config/mpv         ${HOME}/.config/mpv
ln -s ${DIR}/config/flashspace  ${HOME}/.config/flashspace
ln -s ${DIR}/config/gitui  ${HOME}/.config/gitui
ln -s ${DIR}/config/gitu  ${HOME}/.config/gitu

ln -s ${DIR}/hammerspoon   ${HOME}/.hammerspoon

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
            <string>-j 20</string>
            <string>-d Downloads</string>
            <string>--input-file=.aria2.session</string>
            <string>--save-session=.aria2.session</string>
            <string>--save-session-interval=60</string>
            <string>--max-concurrent-downloads=20</string>
            <string>--max-overall-upload-limit=20kb</string>
            <string>--disk-cache=64M</string>
            <string>--file-allocation=none</string>
            <string>--no-file-allocation-limit=64M</string>
            <string>--seed-time=0</string>
            <string>--timeout=600</string>
            <string>--max-tries=0</string>
            <string>--retry-wait=0</string>
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
