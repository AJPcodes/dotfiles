if status is-login
    # Initialize Homebrew
    set -gx HOMEBREW_PREFIX "/usr/local";
    set -gx HOMEBREW_CELLAR "/usr/local/Cellar";
    set -gx HOMEBREW_REPOSITORY "/usr/local/Homebrew";
    set -q PATH; or set PATH ''; set -gx PATH "/usr/local/bin" "/usr/local/sbin" "/usr/local/opt/postgresql@11/bin" $PATH;
    set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/usr/local/share/man" $MANPATH;
    set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/usr/local/share/info" $INFOPATH;


    # Initialize asdf
    source /usr/local/opt/asdf/asdf.fish

    # Enable global Yarn packages
    set -p PATH 

    # Secrets
    test -e $HOME/.secrets.fish && source $HOME/.secrets.fish

    # Set up config alias for using a bare repo for dotfiles
    alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
    
    # Common dev commands:
    alias checkx="mix compile --warnings-as-errors && mix credo --ignore design --strict && mix release --warnings-as-errors"
    alias startx="iex -S mix phx.server"
    alias compilex="mix compile --force --show-warnings"
    alias startc="yarn bs:build && yarn run dev"
    alias cb-dev="aws-vault exec cb-dev --"
    # alias cb-mgmt="aws-vault exec cb-mgmt --"
    # alias cb-demo="aws-vault exec cb-demo --"
    alias cb-stg="aws-vault exec cb-stg --"
    alias cb-prd="aws-vault exec cb-prd --"
    alias python python3
    # brew aliases 
    alias brewp='brew pin'
    alias brews='brew list -1'
    alias brewsp='brew list --pinned'
    alias bubo='brew update && brew outdated'
    alias bubc='brew upgrade && brew cleanup'
    alias bubu='bubo && bubc'
    alias bcubo='brew update && brew cask outdated'
    alias bcubc='brew cask reinstall (brew cask outdated) && brew cleanup'

    # Support autojump
    [ -f (brew --prefix)/share/autojump/autojump.fish ]; and source (brew --prefix)/share/autojump/autojump.fish



    

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

    # Avoid erlang mac oddities:
    set -x KERL_CONFIGURE_OPTIONS "--without-javac --with-ssl=/usr/local/opt/openssl@1.1" 
    # set -x KERL_CONFIGURE_OPTIONS "--without-javac --disable-hipe --with-ssl=/usr/local/opt/openssl@1.1"
end

