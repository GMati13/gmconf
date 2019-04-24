# Created by newuser for 5.4.2
fpath=($fpath "/home/user/.zfunctions")

    # Set Spaceship ZSH as a prompt
    autoload -U promptinit; promptinit
    prompt spaceship

    SPACESHIP_USER_SHOW=always
    SPACESHIP_TIME_SHOW=true
    SPACESHIP_EXIT_CODE_SHOW=true

    SPACESHIP_PROMPT_ORDER=(
        user          # Username section
        dir           # Current directory section
        git           # Git section (git_branch + git_status)
        hg            # Mercurial section (hg_branch  + hg_status)
        jobs          # Background jobs indicator
        line_sep      # Line break
        vi_mode
        exit_code     # Exit code section
        char          # Prompt character
    )

    spaceship_vi_mode_enable
    export KEYTIMEOUT=1
    bindkey "^?" backward-delete-char

##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

# some more ls aliases
alias ll='ls -alF --color'
alias la='ls -A --color'
alias l='ls -CF --color'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

SNAP_BIN=/snap/bin
export PATH=$PATH:$SNAP_BIN

PYTHON_BIN=$HOME/.local/bin
export PATH=$PATH:$PYTHON_BIN

YARN_BIN=$HOME/.yarn/bin
export PATH=$PATH:$YARN_BIN

# tmux
alias tmux='tmux -2'

# vi
alias vi='vim -u NONE'

# translate
alias translate='trans -e google -t ru -show-original n -show-translation-phonetics n -show-languages n -show-prompt-message n -show-translation n -show-dictionary n'

source ~/.zshrc-clam
source ~/.zshrc-git
source ~/.zshrc-scripts

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
