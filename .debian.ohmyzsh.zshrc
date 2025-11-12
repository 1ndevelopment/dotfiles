if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Begin User Configuration

export WORK_WEEK=$(date "+%yww%W.%u")

procs() { sudo ps -aux | awk '{print $4,$2,$1,$11}' | sort ;}
killproc() { sudo pkill "$@" ;}

alias cp='rsync -ah --progress'
alias dir='ls -1a'

#alias ls='lsd'
alias ls='eza --icons=always'
alias ll='eza --icons=always -lah'

alias x='exit'
alias cls='clear'
alias matrix='cmatrix'
alias rfsh='cls && source ~/.zshrc'
alias n='nano'
alias open='firefox'
alias dl='aria2c'

alias pmlstin='apt list --installed'
alias pmlst='apt search'
alias pmlstupg='apt list --upgradable'
alias pmupd='sudo apt update'
alias pmupg='sudo apt upgrade'
alias pmins='sudo apt install '
alias pmuni='sudo apt remove'
alias pmar='sudo apt autoremove'
alias pmfix='sudo apt update && sudo apt --fix-broken install'
alias pmcln='sudo apt clean && sudo apt autoclean'

alias dk='docker'
alias dc='docker-compose'
alias dcd='docker-compose down'
alias dcu='docker-compose up'
alias dps='docker ps -a'
alias dlst='docker ps -a'
alias dimg='docker images -a'
alias dimgs='docker images -a'
alias drmi='docker rmi'
alias dstop='docker stop'
alias drm='docker rm'
alias dcln='docker system prune -a'

alias pod='podman'
alias podc='podman-compose'
alias podcd='podman-compose down'

alias ts='tailscale'
alias tss='tailscale status'

alias startnx='sudo /etc/NX/nxserver --restart'

alias tmux-attach='tmux attach -t 0'

alias biggest='du . -ha | sort -hr | head -n $1'

alias dlp2p="aria2c --disk-cache=64MB --seed-time=0 --bt-metadata-only=true --bt-save-metadata=true --max-connection-per-server=4 --min-split-size=1M --file-allocation=none --auto-file-renaming=true $1"

alias scp="rsync -avz --info=progress2 --human-readable $1"

alias mntiso="mount -o loop $1 /mnt/iso"

# Requires qemu-system
alias bootiso="qemu-system-x86_64 -boot d -m 128 -cdrom $1"

# Requires ffmpeg & youtube-dl
alias yt2mp3="youtube-dl -x --audio-format mp3 --audio-quality 0 $1"

alias connect2vpn="/home/z0rk/.ovpn/connect.sh"


echo "
  ___        __             __                         __ 
 <  /__  ___/ /__ _  _____ / /__  ___  __ _  ___ ___  / /_
 / / _ \/ _  / -_) |/ / -_) / _ \/ _ \/  ' \/ -_) _ \/ __/
/_/_//_/\_,_/\__/|___/\__/_/\___/ .__/_/_/_/\__/_//_/\__/ 
   $WORK_WEEK                    /_/           official
"
fastfetch --logo none && echo ''
df -h / | awk 'NR==1 {print $2, $3, $4, $5} NR==2 {print $2, $3, $4, $5}' && echo ''

# End User Configuration

# For cursor-agent & claude code
export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"
