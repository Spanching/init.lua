
# My personal NeoVim configuration 

This is mostly used as a backup if something breaks, but feel free to take a look around. My OS is Windows 10.

## PowerShell Based Setup

To not having to use AppData all the time, set the `XDG_CONFIG_HOME` variable to some config directory you like. Usually (and on Linux) this is `$HOME\.config`

### PowerShell

Install [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3) and add it to the ```PATH``` variable with ```C:\Program Files\PowerShell\7\```.

### Windows Terminal 

Install [Windwos Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701)

#### Catppuccin Colorscheme

I am using [Catppuccin](https://github.com/catppuccin/catppuccin) as my colorscheme.

```
{
  "launchMode": "maximized",
}
```

```
{
    ..default layout
    "schemes":
    [
        {
          "name": "Catppuccin Frappe",

          "cursorColor": "#F2D5CF",
          "selectionBackground": "#626880",

          "background": "#303446",
          "foreground": "#C6D0F5",

          "black": "#51576D",
          "red": "#E78284",
          "green": "#A6D189",
          "yellow": "#E5C890",
          "blue": "#8CAAEE",
          "purple": "#F4B8E4",
          "cyan": "#81C8BE",
          "white": "#B5BFE2",

          "brightBlack": "#626880",
          "brightRed": "#E78284",
          "brightGreen": "#A6D189",
          "brightYellow": "#E5C890",
          "brightBlue": "#8CAAEE",
          "brightPurple": "#F4B8E4",
          "brightCyan": "#81C8BE",
          "brightWhite": "#A5ADCE"
        }
    ],
}
```

```
{
    ..default layout
    "themes":
    [
        {
          "name": "Catppuccin Frappe",
          "tab": {
            "background": "#303446FF",
            "showCloseButton": "always",
            "unfocusedBackground": null
          },
          "tabRow": {
            "background": "#292C3CFF",
            "unfocusedBackground": "#232634FF"
          },
          "window": {
            "applicationTheme": "dark"
          }
        }
    ],
}
```

In the Terminal Settings > Open JSON file, add the above snippets. Close Windows Terminal Application while you do that. Then reopen and go to Settings > Color schemes and select the newly installed Catppuccin and set it as default.

### Package Managers 

Install chocolatey [here](https://chocolatey.org/).

Install Scoop [here](https://scoop.sh/)

### Required Software

```
choco install neovim fzf gzip wget make lua luarocks grep fd ripgrep lazygit starship nodejs
```

### PowerShell Profile

The PowerShell Profile location is saved in `$PROFILE`, you can edit it with `nvim $PROFILE`.

```
$ENV:STARSHIP_CONFIG = "C:\Users\AndreasK\OneDrive - MaibornWolff GmbH\Dokumente\PowerShell\starship.toml"
Invoke-Expression (&starship init powershell)

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

$ENV:FZF_DEFAULT_OPTS=@"
--preview "bat -n --color=always --line-range :500 {}"
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284
"@
$ENV:FZF_DEFAILT_COMMAND='--preview "bat -n --color=always --line-range :500 {}"'
$ENV:FZF_CTRL_T_OPTS='--preview "bat -n --color=always --line-range :500 {}"'
$ENV:FZF_CTRL_R_OPTS='--preview "bat -n --color=always --line-range :500 {}"'

function Git-CheckoutMaster {
    git checkout master
    git pull
}
Set-Alias gitcm Git-CheckoutMaster
```

### PowerShell fzf

```
Install-Module -Name PSFzf
```

### install treesitter cli 

```
npm install -g tree-sitter-cli
```

### Install bat

```
choco install bat
```
Now download the catppuccin theme for bat
```
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
```
Now you can change the theme to catppuccin by editing the configuration file
```
nvim $(bat --config-file)
```
And add the following line:
```
--theme="Catppuccin Frappe"
```

### Install delta

For nicer git diffs install delta:
``` 
choco install delta
```
Get catppuccin theme for delta
```
cd $HOME\.config\
git clone https://github.com/catppuccin/delta.git delta
```
Use delta for default git diffs:
```
nvim .\.gitconfig
```
Add the following configurations to this (change the Path to absolute):
```
[include]
    path = $HOME/.config/delta/catppuccin.gitconfig
[core]
    pager = delta
[interactive]
    diffFilter = delta --color-only
[delta]
    navigate = true
    side-by-side = true
    features = catppuccin-frappe
[diff]
    colorMoved = default
```

### using my neovim configuration

```
cd .config\
git clone https://github.com/Spanching/init.lua.git nvim
cp ~/.config/nvim/starship.toml ~/.config/starship.toml 
cp ~/.config/nvim/.tmux.conf ~/.tmux.conf 
TMUX_CONF=~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```



## wsl based setup

### wsl 

install wsl and make sure it is version 2:

```pwsh
wsl --install
```

### windows terminal 

install [windwos terminal](https://apps.microsoft.com/store/detail/windows-terminal/9n0dx20hk701)

#### catppuccin colorscheme

i am using [catppuccin](https://github.com/catppuccin/catppuccin) as my colorscheme.

```
{
  "launchmode": "maximized",
}
```

```
{
    ..default layout
    "schemes":
    [
        {
          "name": "catppuccin frappe",

          "cursorcolor": "#f2d5cf",
          "selectionbackground": "#626880",

          "background": "#303446",
          "foreground": "#c6d0f5",

          "black": "#51576d",
          "red": "#e78284",
          "green": "#a6d189",
          "yellow": "#e5c890",
          "blue": "#8caaee",
          "purple": "#f4b8e4",
          "cyan": "#81c8be",
          "white": "#b5bfe2",

          "brightblack": "#626880",
          "brightred": "#e78284",
          "brightgreen": "#a6d189",
          "brightyellow": "#e5c890",
          "brightblue": "#8caaee",
          "brightpurple": "#f4b8e4",
          "brightcyan": "#81c8be",
          "brightwhite": "#a5adce"
        }
    ],
}
```

```
{
    ..default layout
    "themes":
    [
        {
          "name": "catppuccin frappe",
          "tab": {
            "background": "#303446ff",
            "showclosebutton": "always",
            "unfocusedbackground": null
          },
          "tabrow": {
            "background": "#292c3cff",
            "unfocusedbackground": "#232634ff"
          },
          "window": {
            "applicationtheme": "dark"
          }
        }
    ],
}
```

in the terminal settings > open json file, add the above snippets. close windows terminal application while you do that. then reopen and go to settings > color schemes and select the newly installed catppuccin and set it as default.

### lazygit

install [lazygit](https://github.com/jesseduffield/lazygit) with: 

```
lazygit_version=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -po '"tag_name": "v\k[^"]*')
curl -lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${lazygit_version}_linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

### nerd font

install `jetbrainsmono nerd font` from [here](https://www.nerdfonts.com/) and set is as default font in windows terminal. and while you are there you might want to set ubuntu as default terminal and disable the tabs. 

### autohotkey

to map esc to caps lock, install [autohotkey](https://www.autohotkey.com/).

the mapping can be done with just this config in a ```.ahk``` file usually located in ```~\documents\autohotkey```:

```
#requires autohotkey v2.0

capslock::esc

filecreateshortcut "c:\path_to_documents\capslocktoesc.ahk", "c:\users\<username>\appdata\roaming\microsoft\windows\start menu\programs\startup\capslocktoesc.lnk"
```

## setting up wsl for development

### preliminaries

```
sudo apt update && sudo apt -y upgrade
sudo apt install -y build-essential
```

### installing neovim

```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && sudo apt -y upgrade
sudo apt install -y neovim
```

### install and apply starship

```
curl -ss https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc
```

### install tmux

```
sudo apt-get install tmux
```

### using my configuration for neovim, starship and tmux

```
git clone https://github.com/Spanching/init.lua.git ~/.config/nvim
cp ~/.config/nvim/starship.toml ~/.config/starship.toml 
cp ~/.config/nvim/.tmux.conf ~/.tmux.conf 
TMUX_CONF=~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

To apply this config to tmux and download all necessary repos, go in temux and run "<leader>I" (multiple times sometimes). It should then load the theme.

### Install additional Software

```
sudo apt install -y fd-find ripgrep
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
sudo apt install -y nodejs npm python3-pip
pip install pyright
PATH="$PATH:$HOME/.local/bin"
```

# Using NVIM for Java Development

## Install Eclipse language server

Make sure maven is installed

then 

```
git clone https://github.com/eclipse-jdtls/eclipse.jdt.ls.git
echo "export JAVA_HOME=/path/to/java/17" >> ~/.bashrc
./mvnw clean verify [-DSkipTests=true]
sudo mv eclipse.jdt.ls /opt/
```

### Install Java-Debug bundle

```
git clone https://github.com/microsoft/java-debug.git
cd java-debug
./mvnw clean install
sudo mv java-debug /opt/
```

### Install VSCode Java Test bundle

```
git clone https://github.com/microsoft/vscode-java-test.git
npm install
npm run build-plugin
sudo mv vscode-java-test /opt/
```
