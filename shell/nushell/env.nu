let sep = (if $nu.os-info.name == "windows" {"\\"} else {"/"})

def fast-git-style [] {
    let ret = (do -p { git --no-optional-locks branch -v } | complete)
    if ($ret.exit_code == 0) {
        let info = ($ret.stdout | str trim | parse -r '\* (?<name>(\([\S ]+\))|([\w\/\-\.]+)) +\w+ (\[((?<state>[^\]]+))+\])?')
        $"(ansi green)->(ansi '#FF00FF') ($info.name.0)"
    } else {
        ""
    }
}

$env.PROMPT_COMMAND = {
    mut home = ""
    try {
        if $nu.os-info.name == "windows" {
            $home = $env.USERPROFILE
        } else {
            $home = $env.HOME
        }
    }

    let dir = ([
        ($env.PWD | str substring 0..($home | str length) | str replace $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let workspace = (if (($dir | str length) > 40) {
      let path = $dir | split row $sep
      let last = ($path | length) - 1
      ($path | select $last).0
    } else { $dir })

    let path_color = (if (is-admin) { ansi "#ff6a6a" } else { ansi "#008b8b" })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($workspace)"

    $"($path_segment) (fast-git-style) \n "
}

$env.PROMPT_COMMAND_RIGHT = {
    let time_segment = ([
        (date now | format date '%r'),
        " ",
    ] | str join)
    $"(ansi '#FF00FF')($time_segment)"
}

#$env.PROMPT_INDICATOR = " "

$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi '#69ac00')\(¬‿¬\) "
$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi '#399ee6')｡^‿^｡ "
$env.PROMPT_MULTILINE_INDICATOR = $"(ansi '#9ca0b0')\(･o･\) "


$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
    to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
    to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
  }
}

$env.NU_LIB_DIRS = [
  ($nu.default-config-dir | path join 'scripts')
]

$env.NU_PLUGIN_DIRS = [
  ($nu.default-config-dir | path join 'plugins')
]

def --env nuproxy [] {
  $env.http_proxy = "http://127.0.0.1:1080"
  $env.https_proxy = "http://127.0.0.1:1080"
}
def --env unproxy [] {
  hide-env http_proxy
  hide-env https_proxy
}

##################### MacOS #######################
def --env trash [ f = "" ] {
  if $f == "" {
  } else {
    rm -t $f
  }
}

def --env icloud [ f = "" ] {
  cd `~/Library/Mobile Documents/com~apple~CloudDocs`
}

alias python3 = /opt/homebrew/bin/python3
alias python = /opt/homebrew/bin/python3
alias pip3 = /opt/homebrew/bin/pip3
alias pip = /opt/homebrew/bin/pip3
alias godot = /Applications/Godot.app/Contents/MacOS/Godot

$env.PATH = ($env.PATH | prepend '/opt/homebrew/bin')
$env.PATH = ($env.PATH | prepend '/opt/homebrew/sbin')

# homebrew
$env.HOMEBREW_FORCE_BREWED_GIT = "1"
$env.HOMEBREW_BREW_GIT_REMOTE = "https://mirrors.ustc.edu.cn/brew.git"
$env.HOMEBREW_API_DOMAIN = "https://mirrors.ustc.edu.cn/homebrew-bottles/api"
$env.HOMEBREW_BOTTLE_DOMAIN = "https://mirrors.ustc.edu.cn/homebrew-bottles/bottles"

$env.PATH = ($env.PATH | prepend '/opt/homebrew/include')
$env.LIBRARY_PATH = "/opt/homebrew/lib"

$env.ASDF_DIR = (brew --prefix asdf | str trim | into string | path join 'libexec')
source /opt/homebrew/opt/asdf/libexec/asdf.nu
