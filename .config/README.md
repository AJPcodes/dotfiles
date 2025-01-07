# AJPCodes Dotfiles

Repo for tracking configuration files.
This repo is set up using a bare Git repo per instructions [From an Atlassian Dev](https://www.atlassian.com/git/tutorials/dotfiles)

Also referencing [Jamin's setup](https://github.com/jaminthorns/environment)

### Run in home dir :
`git clone --bare https://github.com/AJPcodes/dotfiles.git $HOME/dotfiles`

`alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`

### In home dir :
`config checkout`

`config config --local status.showUntrackedFiles no`

`xcode-select --install`

### Install Home Brew :
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
`echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ajp/.zprofile`
`eval "$(/opt/homebrew/bin/brew shellenv)"`

## Fix permission errors  :
`sudo chown -R $(whoami) /usr/local/var/homebrew`
`sudo chown -R $(whoami):admin /usr/local/* && sudo chmod -R g+rwx /usr/local/*`

`brew bundle --no-lock --file=.Brewfile`

### Initialize asdf :
`source $(brew --prefix asdf)/asdf.sh`

### Add asdf plugins :
`cat .tool-versions | cut -d " " -f 1 | xargs -n 1 asdf plugin add`

### Install asdf programs :
`NODEJS_CHECK_SIGNATURES=no asdf install`

### Install Oh My Zsh
`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

<!-- ### Install global Yarn packages :
`yarn global add` -->

### Create a .gitconfig :
<!-- 
#install fisher and packages
`fish -c "curl -sL https://git.io/fisher | source && fisher update"`

### get fish path :
`fish=$(command -v fish)`

### Add fish to shells :
`grep -q $fish /etc/shells || echo $fish | sudo tee -a /etc/shells`

### Change to fish  :
`test $SHELL = $fish || chsh -d $fish` -->


### MISC SETUP
### Use settings sync to sync VS code settings
Switched from the extension to the built in version

### Move SSH keys from previous machine
`./ssh folder`

### Set up github login

### Dockerized postgres DB :
`docker run --name cb-dev -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres:15`


Install Obsidion and sync with google drive folder
