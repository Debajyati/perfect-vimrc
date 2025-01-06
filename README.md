# perfect-vimrc

## My vim/nvim config entirely in vimscript with Conqueror of Completion, to setup environment for different programming languages

#### Prerequisites:
- Make sure you already have a backup of your previous **vim-config** (if any).
In case you have already a **vim-config** and you don't want to lose it, you can make a **backup** file using the command below before creating the new `.vimrc` -
```bash
      mv .vimrc .vimrc.bak
```
Also Make sure you run the command in the directory where your already existing .vimrc is located. The command will rename it with a .bak file-extension which stands for backup. Now this backup file can be stored/located wherever wanted.

-  install vim-plug, nodejs, yarn, & build-essentials.

### Note:
This config can also be used for NeoVim if wanted. Just replace the directory `~/.vim/plugged` with `.local/share/nvim/plugged` in the first line of the section of the config shown below, before performing the 2nd step of [Instructions](#actual-work) -  
```vim
call plug#begin('~/.vim/plugged')
" Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline'
" Plug coc.nvim for C/C++ lsp
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
" Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'prasada7/toggleterm.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
```

#### Actual Work
1. Copy the whole text of the `config.vim` file in this repo and paste it in your own blank `.vimrc` file. Save it. 
2. Next Run the command `:PlugInstall` inside vim (According to the config, I'm using Vim-Plug plugin manager. If you use any other plugin manager like vundle or packer, you are free to change the config file wherever needed and then run the plugin manager's install command). You may need to run the command after **restarting** vim. You may also need to run `:PLugClean` to remove all the previously installed plugins.
3. After all plugins are installed run the `:PlugUpdate` command inside vim to update the already installed plugins.
4. Now run `:CocInstall coc-clangd` inside vim to install the required lsp for C and C++, `:CocInstall coc-pyright` to install the required lsp for python. `:CocInstall coc-tsserver coc-json coc-eslint` is recommended javascript/typescript + json 
 lsp support. You can find the required lsp for the programming language that you use on [this page](https://github.com/neoclide/coc.nvim/wiki/Language-servers) of coc.nvim repo.   
5. Now navigate to your project directory, and check if the setup is working properly.
6. **(Optional)**: Uncomment the line  `Plug 'Exafunction/codeium.vim', { 'branch': 'main' }` in the config file and run `:PlugInstall` to install the Codeium AI plugin in vim. After installation refer to the [Official Codeium AI installation and usage guide](https://codeium.com/vim_tutorial) .
7. Enjoy!
#### Additional (How to use it) + Some Keybindings:
1. `,` is the leader key in this configuration.
2. Use `,+n` to open and close the file explorer.
3. Use the **arrow keys** to move down through the list of code suggesions and use `Enter` key to manually trigger completion. You can also click `Tab` to trigger completion by going down through the list of code suggesions & click `Shift+Tab` to trigger completion by going up through the list of code suggessions.
4. Click `Ctrl+\` to toggle terminal. Now you can navigate to the file buffer from terminal and vice versa using the native window navigation keymaps of vim or your beloved mouse, whatever you want. Use `Ctrl+d` to kill the terminal.
5. Run `:Colors` to change colorscheme
6. Click `<space>ff` to quickly navigate to a file inside the CWD, with fuzzy search(fzf) **(Optional: for file preview- install bat. for debian/ubuntu - `sudo apt install bat`. For windows - `scoop install bat`)**.
7. Click `<space>b` to quickly navigate to an existing buffer inside the CWD.

### Contributing
Any kind of suggesion, contributions(bug fixes, enhancements) are cordially welcomed.
