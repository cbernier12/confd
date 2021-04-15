PS1='$(pwd)/>'
alias ll='ls -AhlF --color=auto --group-directories-first'
alias la='ls -ahlF --color=auto --group-directories-first'
alias cd..='cd ..'
alias cls="clear"

curl http://etcd:2379/health
confd -onetime -backend etcd -node http://etcd-server:2379
