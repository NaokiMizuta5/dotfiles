# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	autojump
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# --------------------------------------------
# 基本設定
# --------------------------------------------

# ヒストリーの設定（コマンド履歴の保存と共有）
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history          # コマンド履歴をリアルタイムで保存
setopt share_history               # 他のシェルと履歴を共有

# オートコレクト（間違ったコマンドを自動修正）
setopt correct                     # 間違ったコマンドを修正提案

# オート補完
autoload -Uz compinit
compinit

# カラフルな ls コマンド
alias ls='ls --color=auto'         # Mac の場合は `ls -G` に変更
alias ll='ls -la'

# デフォルトエディタ
export EDITOR=nano                 # 必要に応じて `vim` や `code` に変更可能

# --------------------------------------------
# エイリアス
# --------------------------------------------

# Git のショートカット
alias g='git'
alias gs='git status'
alias gb='git branch'
alias gc='git commit -m'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias ga='git add'
alias gac='git add --all && git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch -vv'

# alias
alias l='eza -la --icons'
alias p='cd ~/projects'
alias d='cd ~/dotfiles'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias rm='rm -iv'
alias cp='cp -iv'
alias nvim='env TERM=wezterm nvim'
alias v='env TERM=wezterm nvim'
alias dp='docker ps'
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'
alias dce-'docker compose exec'
alias dcb='docker compose build'
alias nvim-startuptime='vim-startuptime -vimpath nvim'
alias shutnow='shutdown -h now'
alias relogin='exec zsh -l'

# カスタムエイリアス
alias mygit='gaa && gc 'updated' && gpu origin main'
mkcd() {
    if [ -z "$1" ]; then
        echo "エラー: ディレクトリ名を指定してください。" >&2
        return 1
    fi
    mkdir -p "$1" && cd "$1"
}
crop() {
   if [ -z "$1" ]; then
	echo "エラー: ファイル名を指定してください。">&2
	return 1
   fi 
   touch "$1" && cursor -a "$1"
}

# システム系
alias cls='clear'                  # シェルをクリア
alias update='sudo apt update && sudo apt upgrade -y' # システム更新（Ubuntu向け）
alias free='free -h'               # メモリ使用状況を人間に分かりやすい形式で表示

# ネットワーク
alias ip='ip a'                    # ネットワーク設定を表示
alias ping='ping -c 5'             # 5回だけ ping を実行
alias thm='openvpn /usr/local/etc/openvpn/richard5.ovpn' # TryHackMeのVPN接続

# Python 開発関連
alias py='python3'
alias venv='python3 -m venv venv && source venv/bin/activate'

# C++ テンプレート作成
alias at='touch {a..g}.cpp && for file in {a..g}.cpp; do \
echo "#include <iostream>" > "$file"; \
echo "#include <iomanip>" >> "$file"; \
echo "#include <vector>" >> "$file"; \
echo "#include <climits>" >> "$file"; \
echo "#include <cstring>" >> "$file"; \
echo "#include <algorithm>" >> "$file"; \
echo "#include <stack>" >> "$file"; \
echo "#include <cmath>" >> "$file"; \
echo "#include <queue>" >> "$file"; \
echo "#include <map>" >> "$file"; \
echo "#include <set>" >> "$file"; \
echo "using namespace std;" >> "$file"; \
echo "using ll = long long;" >> "$file"; \
echo "using ull = unsigned long long;" >> "$file"; \
echo "#define pb push_back" >> "$file"; \
echo "#define rep(i,n) for (int i=0; i<(n); i++)" >> "$file"; \
echo "#define reps(i,n) for (int i=1; i<=(n); i++)" >> "$file"; \
echo "#define for_(i,a,b) for (int i=(a); i<(b); i++)" >> "$file"; \
echo "#define Yes(b) ((b)?\"Yes\":\"No\")" >> "$file"; \
echo "#define YES(b) ((b)?\"YES\":\"NO\")" >> "$file"; \
echo "template <typename T> inline bool chmin(T& a, const T& b) {bool compare = a > b; if (a > b) a = b; return compare;}" >> "$file"; \
echo "template <typename T> inline bool chmax(T& a, const T& b) {bool compare = a < b; if (a < b) a = b; return compare;}" >> "$file"; \
echo "template <typename T> T gcd(T a, T b) {if (b == 0)return a; else return gcd(b, a % b);}" >> "$file"; \
echo "template <typename T> inline T lcm(T a, T b) {return (a * b) / gcd(a, b);}" >> "$file"; \
echo "template <typename T> inline T ceil(T a, T b) {return (a+(b-1))/b;}" >> "$file"; \
echo "template <typename T> inline T floor(T a, T b) {return a/b;}" >> "$file"; \
echo "const ll MOD = 1e9 + 7;" >> "$file"; \
echo "" >> "$file"; \
echo "void solve()" >> "$file"; \
echo "{" >> "$file"; \
echo "    " >> "$file"; \
echo "}" >> "$file"; \
echo "" >> "$file"; \
echo "int main()" >> "$file"; \
echo "{" >> "$file"; \
echo "    ios::sync_with_stdio(false);" >> "$file"; \
echo "    cin.tie(nullptr);" >> "$file"; \
echo "" >> "$file"; \
echo "    solve();" >> "$file"; \
echo "    return 0;" >> "$file"; \
echo "}" >> "$file"; \
done'
# --------------------------------------------
# カスタム関数
# --------------------------------------------

# プロジェクトを作成して移動
mkproj() {
    mkdir -p ~/projects/"$1"
    cd ~/projects/"$1" || return
}

# 一括検索（カレントディレクトリで文字列を検索）
fsearch() {
    grep -rnw . -e "$1"
}

# Python サーバー起動
pserve() {
    python3 -m http.server "$1"
}

# IP アドレスを取得
getip() {
    curl ifconfig.me
}

# --------------------------------------------
# プラグインと追加設定
# --------------------------------------------

# zsh-autosuggestions（コマンド予測）
if [ -d ~/.zsh/zsh-autosuggestions ]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-syntax-highlighting（コマンド構文の色付け）
if [ -d ~/.zsh/zsh-syntax-highlighting ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# コマンド実行時にタイムスタンプを表示
preexec() {
    echo -e "\n\033[1;32m[$(date +"%Y-%m-%d %H:%M:%S")]\033[0m $1"
}

# --------------------------------------------
# プロンプトの設定
# --------------------------------------------

PROMPT='%F{cyan}%n%f@%F{yellow}%m%f:%F{green}%~%f %F{magenta}%#%f '

alias ubuntu='docker start my-ubuntu && docker exec -it my-ubuntu bash'
alias deli='cd /Users/naoki/delishmall/delishmall-admin-client'

if [ "$ZSHRC_PROFILE" != "" ]; then
    zmodload zsh/zprof && zprof > /dev/null
fi

# comp
autoload -Uz compinit
compinit

# vi mode
bindkey -v
export KEYTIMEOUT=1
cursor_mode() {
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
                [[ ${KEYMAP} == viins ]] ||
                [[ ${KEYMAP} = '' ]] ||
                [[ $1 = 'beam' ]]; then
                echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}
cursor_mode

# fzf functions
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^p' fzf-select-history

fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.git*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}

fb() {
    local branches branch
    branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

fl() {
    git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
        --bind "ctrl-m:execute:
            (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF" --preview 'f() {
        set -- $(echo "$@" | grep -o "[a-f0-9]\{7\}" | head -1);
        if [ $1 ]; then
            git show --color $1
        else
            echo ""
        fi
    }; f {}' | grep -o "[a-f0-9]\{7\}" | tr '\n' ' '
}

fv() {
    local file
    file=$(find ${1:-.} -path '*/\.git*' -prune -o -type f -print 2> /dev/null | fzf +m --preview "bat -f {}") && env TERM=wezterm nvim "$file"
}