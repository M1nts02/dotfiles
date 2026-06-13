# Dotfiles

## install(Mac)

```bash
# Required
brew install --cask ghostty hammerspoon font-maple-mono-nf-cn karabiner-elements neovide-app
brew install neovim fzf eza zoxide mpv npm gitui macmon atuin bat ripgrep fd tree-sitter-cli

# Yazi
brew install yazi ffmpegthumbnailer unar poppler xclip clippy media-info p7zip pngpaste zoxide fzf mpv
brew install m1nts02/tap/mdrop
ya pkg upgrade

# Lsp and Formater
brew install jq emmylua_ls markdown-oxide sqruff clang-format biome stylua mdformat ruff tombi
brew install mhersson/formulas/mpls

# Optional
brew install --cask mediahuman-audio-converter appcleaner kid3 flowvision iina monitorcontrol squirrel-app zed petrichor
brew install pixi mihomo proxychains-ng imagemagick kimi-code zig zls choose-gui mole claude-code
brew install coreutils grep gawk gnu-sed bash
brew install m1nts02/tap/minttab
brew services start m1nts02/tap/minttab
brew services start mihomo

# Duti
brew install duti
duti -s com.kingsoft.wpsoffice.mac pdf all
duti -s netdcy.FlowVision png all
duti -s netdcy.FlowVision jpg all
duti -s netdcy.FlowVision jepg all
duti -s com.colliderli.iina mp3 all
duti -s com.colliderli.iina wav all
duti -s com.colliderli.iina m4a all
duti -s com.colliderli.iina ogg all
duti -s com.colliderli.iina mp4 all
duti -s dev.zed.Zed conf all
duti -s dev.zed.Zed csv all
duti -s dev.zed.Zed json all
duti -s dev.zed.Zed lua all
duti -s dev.zed.Zed md all
duti -s dev.zed.Zed toml all
duti -s dev.zed.Zed txt all
```
