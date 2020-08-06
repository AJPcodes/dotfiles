if status is-login
    # Initialize Homebrew
    set -gx HOMEBREW_PREFIX "/usr/local";
set -gx HOMEBREW_CELLAR "/usr/local/Cellar";
set -gx HOMEBREW_REPOSITORY "/usr/local/Homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/usr/local/bin" "/usr/local/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/usr/local/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/usr/local/share/info" $INFOPATH;

    # Initialize asdf
    source /usr/local/opt/asdf/asdf.fish

    # Enable global Yarn packages
    set -p PATH 

    # Secrets
    test -e $HOME/.secrets && source $HOME/.secrets

    # Set up config alias for using a bare repo for dotfiles
    alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
end

if status is-interactive
    # Disable greeting
    # set fish_greeting

    # Less options
    set -x LESS -R

    # Erlang options
    set -x ERL_AFLAGS -kernel shell_history enabled

    # bat options
    set -x BAT_PAGER less -R
    set -x BAT_THEME Dracula

    # fzf options
    set -l fzf_colors "fg:-1,fg+:-1,bg:-1,bg+:-1,hl:6,hl+:6,spinner:4,info:4,marker:4,pointer:2,prompt:2"
    set -x FZF_DEFAULT_OPTS "--reverse --no-info --height 50% --color $fzf_colors"
end
