vimx () {
if [ $# -eq 0 ]
  then
    result=${PWD##*/}
    nvim $result.tex
  else
    mkdir $1
    cd $1 && mkdir images && mkdir sections && nvim "$1.tex"

fi

}

pdf () {
nohup zathura --config-dir "~/.config/zathura/" "$1" >/dev/null 2>&1 &
exit
}

alias ls='ls --color=auto'
alias ganache="Downloads/ganache-2.5.4-linux-x86_64.AppImage"
alias goodbye="systemctl poweroff"
alias bye="i3-msg exit"
alias vim="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias appunti='/usr/bin/git --git-dir=$HOME/.appunti/ --work-tree=$HOME'
#alias appunti="nvim ~/vimwiki/index.wiki"
alias diary='nvim ~/diary/index.wiki'

config-update () {
config add -u &
config commit -m "$(date +'%d-%m-%Y')"
config push origin master
}
