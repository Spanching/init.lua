
# My personal NeoVim configuration 

This is mostly used as a backup if something breaks, but feel free to take a look around. My OS is Windows 10.

## Prerequisits

### Scoop

Use [Scoop](https://scoop.sh/#/) to install all the requirements for NeoVim and NeoVim itself. Which at the time of writing are:

### PowerShell

Install [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3) and add it to the ```PATH``` variable with ```C:\Program Files\PowerShell\7\```.

### LazyGit

To use git with [LunarVim](https://www.lunarvim.org/), install [LazyGit](https://github.com/jesseduffield/lazygit#installation)

### Alacritty

To use a terminal emulator install [Alacritty](https://alacritty.org/).

The config is located in ```~\AppData\Roaming\alacritty```

```
# Window config
window:
  padding:
    x: 0
    y: 0
  dynamic_padding: true
  decoratons: none
  startup_mode: Maximized

# Shell config
shell:
  program: c:\Program Files\PowerShell\7\pwsh.exe
  args:
    - -WorkingDirectory c:\Users\<username> 

# Font config:
font:
  normal:
    family: "JetBrainsMono Nerd Font"
    style: Regular
  bold:
    family: "JetBrainsMono Nerd Font"
    style: Bold
  italic:
    family: "JetBrainsMono Nerd Font"
    style: Italic
  bold_italic:
    family: "JetBrainsMono Nerd Font"
    style: BoldItalic
  size: 11
```

### AutoHotkey

To map Esc to Caps Lock, install [AutoHotKey](https://www.autohotkey.com/).

The mapping can be done with just this config in a ```.ahk``` file usually located in ```~\Documents\AutoHotKey```:

```
#Requires AutoHotkey v2.0

Capslock::Esc

FileCreateShortcut "C:\path_to_documents\capslockToESC.ahk", "C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\capslockToESC.lnk"
```

## Plugins

### [lazy](https://github.com/folke/lazy.nvim)

Plugin Manager, should install very easy

### [which-key](https://github.com/folke/which-key.nvim)

### [telescope](https://github.com/nvim-telescope/telescope.nvim)

requires plugin nvim-treesitter

external dependencies:

```
scoop install fd
scoop install ripgrep
```

### [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### [catppuccin](https://github.com/catppuccin/nvim)

Just my colorscheme (frappe version)

### [undotree](https://github.com/mbbill/undotree)

### [lazygit](https://github.com/kdheepak/lazygit.nvim)

### [Barbar](https://github.com/romgrk/barbar.nvim)

### [Language Server](https://github.com/VonHeikemen/lsp-zero.nvim)

Not requiured, but strongly recommended: [Mason](https://github.com/williamboman/mason.nvim)

