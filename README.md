
# My personal NeoVim configuration 

This is mostly used as a backup if something breaks, but feel free to take a look around. My OS is Windows 10.

## Prerequisits

### PowerShell

Install [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3) and add it to the ```PATH``` variable with ```C:\Program Files\PowerShell\7\```.

### WSL 

Install WSL and make sure it is version 2:

```pwsh
wsl --install
```

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

### LazyGit

Install [Lazygit](https://github.com/jesseduffield/lazygit) with: 

```
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

### Nerd Font

Install `JetBrainsMono Nerd Font` from [here](https://www.nerdfonts.com/) and set is as default Font in Windows Terminal. And while you are there you might want to set Ubuntu as default Terminal and disable the tabs. 

### AutoHotkey

To map Esc to Caps Lock, install [AutoHotKey](https://www.autohotkey.com/).

The mapping can be done with just this config in a ```.ahk``` file usually located in ```~\Documents\AutoHotKey```:

```
#Requires AutoHotkey v2.0

Capslock::Esc

FileCreateShortcut "C:\path_to_documents\capslockToESC.ahk", "C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\capslockToESC.lnk"
```

## Setting up WSL for Development

### Preliminaries

```
sudo apt update && sudo apt -y upgrade
sudo apt install -y build-essential
```

### Installing Neovim

```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && sudo apt -y upgrade
sudo apt install -y neovim
```

### Install and apply Starship

```
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc
```

### Install tmux

```
sudo apt-get install tmux
```

### Using my configuration for Neovim, Starship and Tmux

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
#### Using Docker in wsl2

I use Rancher Desktop so for me I have to link the docker command from my Windows Installation to wsl2 like this:

```
cd /usr/local/bin && sudo ln -s /mnt/c/Users/<user>/AppData/Local/Programs/Rancher\ Desktop/resources/resources/linux/bin/docker
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
