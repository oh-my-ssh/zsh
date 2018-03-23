## oh-my-ssh ## 

This repo is an example of how to use https://github.com/Russell91/sshrc in combination with zsh and oh-my-zsh.

The focus is on making life easier when connecting to minimal Linux distros such as CoreOS and RancherOS, which have very little besides docker installed by default.

## Setup ##

On your local machine:

Install https://github.com/Russell91/sshrc

Clone this repo and then copy .sshrc and .sshrc.d/ into your home directory.

## Usage ##

Instead of using `ssh <some machine>`, use `sshrc <some machine>`

This will connect to the desired machine and automatically install zsh via docker.

The .zshrc contains the shell function `docker_install()` (aliased to dci), which can install things via docker. At the moment only zsh and docker-compose are supported.

E.g.

```
dci docker-compose
dci zsh
```

The following zsh plugins come pre-configured: git, z, sudo, zsh-autosuggestions
