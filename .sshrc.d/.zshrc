echo "Loading .zshrc..."

export PATH=$PATH:/opt/bin

export ZSH=$SSHHOME/.sshrc.d/.oh-my-zsh

# ZSH_THEME="sorin"
ZSH_THEME="avit"

# Without this on RancherOS when Backspace is pressed, the cursor moves to the right instead of deleting characters.
if [[ $(uname -a) = *"rancher"* ]]; then
  TERM=xterm
fi

plugins=(git z sudo zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias doco="docker-compose"
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcr="docker-compose run"
alias dclt="docker-compose logs --follow --tail=100"
alias d="docker"
alias certbot='sudo docker run -it --rm --name certbot \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            certbot/certbot certonly'
alias dci=docker_install

docker_install() {
    installer=$1

    # default to ohmyssh images
    if [[ ! $installer = *"/"* ]]; then
      installer=ohmyssh/$installer
    fi

    docker run --rm -v /opt/bin:/target $installer
    docker rmi $installer
}
