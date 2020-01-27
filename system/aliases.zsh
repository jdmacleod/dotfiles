# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
else
  alias ls="/bin/ls -GpF"
  alias l="/bin/ls -lGph"
  alias ll="/bin/ls -lGphrt"
  alias la="/bin/ls -laGph"
fi

# Simplified Commands
alias commit="git commit $1"
alias add="git add $1"
alias status="git status -s"
alias push="git push"
alias pushem="git push origin master"
alias chrome="${1} | open -a Google\ Chrome"
alias comp="gcc -Wall -o"
alias rename="git remote rename origin upstream"
alias b="bundle ${1}"
alias be="bundle exec ${1}"

# Directories
alias dev="cd $HOME/Developer"
alias c="cd $HOME/Developer/C"
alias py="cd $HOME/Developer/Python"
alias web="cd $HOME/Developer/Web"
alias rb="cd $HOME/Developer/Ruby"
alias mamp="cd /Applications/MAMP/"
alias htdocs="cd /Library/WebServer/Documents"

# Projects

# Work
WORK="$HOME/Dropbox/Work"
alias work="cd $HOME/Dropbox/Work"

