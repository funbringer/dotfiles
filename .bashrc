#!/usr/bin/bash
# ^ shebang is for shellcheck

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
color_prompt=yes;
if [ "$color_prompt" = yes ]; then
    # select proper color (root / ssh / user)
    if [ "$(id -u)" == "0" ]; then
        user_host_color='\[\033[01;31m\]' # red
    elif [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        user_host_color='\[\033[01;33m\]' # yellow
    else
        user_host_color='\[\033[01;32m\]' # green
    fi
    path_color='\[\033[01;34m\]' # blue
    reset_color='\[\033[00m\]'
else
    user_host_color=
    path_color=
    reset_color=
fi
PS1=$user_host_color'\u@\h'$reset_color':'$path_color'\w'$reset_color'\$ '
unset color_prompt force_color_prompt
unset user_host_color path_color reset_color

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Enable FZF if necessary
if command -v fzf > /dev/null; then
    if ! command -v fzf-share > /dev/null; then
        function fzf-share() {
            if [ -d /usr/share/fzf ]; then
                echo /usr/share/fzf
            elif [ -d /usr/share/doc/fzf/examples ]; then
                echo /usr/share/doc/fzf/examples
            fi
        }
    fi
    FZF_FILES=(
        # SEE: pacman -Qlq fzf | grep bash
        "$(fzf-share)/completion.bash"
        "$(fzf-share)/key-bindings.bash"
    )
    for f in "${FZF_FILES[@]}"; do
        if [ -f "$f" ]; then
            source "$f"
        fi
    done
    # Fine tuning: use fd when possible
    if command -v fd > /dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f'
    fi
fi

# favorite editor
export EDITOR=nvim

# Optional things if not root
if [ "$(id -u)" != "0" ]; then
    # Rust
    #export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src/"
    export PATH="$PATH:/usr/lib/rustup/bin"
    export PATH="$PATH:$HOME/.cargo/bin"

    # Java
    export JAVA_HOME=/usr/lib/jvm/default

    # bcc tools
    export PATH="/usr/share/bcc/tools:$PATH"
    export PATH="/usr/share/bpftrace/tools:$PATH"

    # local bin
    export PATH="$HOME/.local/bin:$PATH"
fi

# Work items (not to be sync'ed)
for f in "$HOME/.config/bashrc"/*; do
    if [ -f "$f" ]; then
        source "$f"
    fi
done

# Colored man output
man() {
    env                                             \
        LESS_TERMCAP_mb="$(printf "\e[1;31m")"      \
        LESS_TERMCAP_md="$(printf "\e[1;31m")"      \
        LESS_TERMCAP_me="$(printf "\e[0m")"         \
        LESS_TERMCAP_se="$(printf "\e[0m")"         \
        LESS_TERMCAP_so="$(printf "\e[1;44;33m")"   \
        LESS_TERMCAP_ue="$(printf "\e[0m")"         \
        LESS_TERMCAP_us="$(printf "\e[1;32m")"      \
            man "$@"
}

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias  l='ls -CF'

alias sr='stack ghci'
