# perfect-vimrc

## My vim config with Conqueror of Completion, to setup environment for different programming languages

#### Prerequisites:
- Make sure you already have a backup of your previous **vim-config** (if any).
In case you have already a **vim-config** and you don't want to lose it, you can make a **backup** file using the command below before creating the new `.vimrc` -

      mv .vimrc .vimrc.bak
Also Make sure you run the command in the directory where your already existing .vimrc is located. The command will rename it with a .bak file-extension which stands for backup. Now this backup file can be stored/located wherever wanted.

-  install vim-plug, nodejs, yarn, & build-essentials. 
#### Actual work:
1. Copy the whole text of the `config.vim` file in this repo and paste it in your own blank `.vimrc` file. Save it.
2. Next Run the command `:PlugInstall` inside vim (According to the config, I'm using Vim-Plug plugin manager. If you use any other plugin manager like vundle or packer, you are free to change the config file wherever needed and then run the plugin manager's install command). You may need to run the command after **restarting** vim.
3. After all plugins are installed run the `:PlugUpdate` command inside vim to update the already installed plugins.
4. Now run `:CocInstall coc-clangd` inside vim to install the required lsp for C and C++, `:CocInstall coc-pyright` to install the required lsp for python. `:CocInstall coc-tsserver coc-json coc-eslint` is recommended javascript/typescript + json 
 lsp support. You can find the required lsp for the programming language that you use on [this page](https://github.com/neoclide/coc.nvim/wiki/Language-servers) of coc.nvim repo.   
5. Now navigate to your project directory, and check if the setup is working properly.
6. **(Optional)**: Uncomment the line  `Plug 'Exafunction/codeium.vim', { 'branch': 'main' }` in the config file and run `:PlugInstall` to install the Codeium AI plugin in vim. After installation refer to the [Official Codeium AI installation and usage guide](https://codeium.com/vim_tutorial) .
7. Enjoy!
#### Additional (How to use it) + Some Keybindings:
1. Use `Ctrl+n` to open and close the file explorer.
2. Use the **arrow keys** to move down through the list of code suggesions and use `Enter` key to manually trigger completion. You can also click `Tab` to trigger completion by going down through the list of code suggesions & click `Shift+Tab` to trigger completion by going up through the list of code suggessions.
4. Click `Ctrl+\` to toggle terminal. Now you can navigate to the file buffer from terminal and vice versa using your beloved mouse. Use `Ctrl+d` to kill the terminal.

### Contributing
Any kind of suggesion, contributions(bug fixes, enhancements) are cordially welcomed.
