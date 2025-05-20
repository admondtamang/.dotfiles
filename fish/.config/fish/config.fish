
# ~/.config/fish/config.fish

# Init starship prompt
starship init fish | source

# Enable 'thefuck' command
thefuck --alias | source

# Set KUBECONFIG environment variable
set -gx KUBECONFIG "/Users/admondtamang/.kube/config"

# Disable default greeting
set fish_greeting

# Aliases
alias ls="eza "
alias ll="eza -l --color=always"
alias la="eza -a --color=always"
alias lla="eza -al --color=always"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gph="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gd="git diff"

# Kubernetes aliases
alias k="kubectl"
alias ka="kubectl apply"
alias kd="kubectl describe"
alias kg="kubectl get"
alias kl="kubectl logs"
alias kx="kubectl exec -it"

# Change ownership of file to oneself
alias own="sudo chown (id -u):(id -g)"

# NPM aliases using bun
alias npm="bunx"
alias npx="bunx"

# Kubernetes helpers using fzf
alias kns="kubens | fzf --prompt='Select namespace: ' --height=~50% --layout=reverse --border | xargs kubens"
alias kctx="kubectx | fzf --prompt='Select context: ' --height=~50% --layout=reverse --border | xargs kubectx"

# Editor shortcuts
alias v="vim"
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"

# Suspend system
alias suspend="systemctl suspend"
alias x="exit"
