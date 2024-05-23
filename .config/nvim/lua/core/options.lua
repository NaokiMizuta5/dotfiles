local global = require("core.global")

local function load_options()
    local global_local = {
        ambiwidth = "single",
        autoindent = true,
        autowrite = true,
        backup = true,
        backupdir = global.cache_dir .. "backup/",
        backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
        cindent = true,
        clipboard = "unnamedplus",
        cmdheight = 0,
        directory = global.cache_dir .. "swap/",
        display = "lastline",
        encoding = "utf-8",
        errorbells = true,
        expandtab = true,
        fileformats = "unix,mac,dos",
        hidden = true,
        history = 2000,
        hlsearch = true,
        ignorecase = true,
        inccommand = "split",
        incsearch = true,
        infercase = true,
        laststatus = 3,
        list = true,
        listchars = "tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%",
        magic = true,
        mouse = "n",
        pumblend = 0,
        pumheight = 10,
        redrawtime = 1500,
        scrolloff = 7,
        sessionoptions = "curdir,help,tabpages,winsize",
        shada = "!,'300,<50,@100,s10,h",
        shell = "zsh",
        shiftwidth = 4,
        showcmd = true,
        showmatch = true,
        showtabline = 1,
        shortmess = 'I',
        sidescrolloff = 5,
        smartcase = true,
        smartindent = true,
        softtabstop = 4,
        swapfile = true,
        tabstop = 4,
        termguicolors = true,
        title = true,
        undodir = global.cache_dir .. "undo/",
        undofile = true,
        updatetime = 100,
        viewoptions = "folds,cursor,curdir,slash,unix",
        virtualedit = "block",
        visualbell = true,
        wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
        wildignorecase = true,
        wildmenu = true,
        winblend = 0,
        wrapscan = true,
    }
    for name, value in pairs(global_local) do
        vim.o[name] = value
    end
end

load_options()
