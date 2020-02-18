# hex.vim

A simple vim plugin for hex editing in vim

## Installation

### Dependencies

This plugin requires xxd to be installed

### Installation

To install the plugin do the following depending on your plugin manager

#### Vundle

Add the following to your .vimrc

```
Plugin 'depsterr/hex.vim'
```

Then run the following commands in vim

```
:source %
:PluginInstall
```

#### NeoBundle

Add the following to your .vimrc

```
NeoBundle 'depsterr/hex.vim'
```

Then run the following commands in vim

```
:source %
:NeoBundleInstall
```

#### Vimplug

Add the following to your .vimrc

```
Plug 'depsterr/hex.vim'
```

Then run the following commands in vim

```
:source %
:PlugInstall
```

#### Pathogen

Run the following commands

```
cd ~/.vim/bundle
git clone https://github.com/depsterr/hex.vim
```

## Usage

Use the following command to switch the current buffer between normal and hex view

```
:HexToggle
```

The plugin handles writing itself, there is no need to toggle to raw data before writing to the file.

If you wish to map this to a key simply add the following to your .vimrc

```
map <key> :HexToggle<CR>
```

You will of course need to replace \<key\> with the key you wish to use.
