#!/bin/sh

# verify environment variables are set
# if [[ -z "$SERVER_NAME" ]]; then
#   echo SERVER_NAME variable missing;
#   exit 1;
# fi


PS1='$(pwd)/>'
alias ll='ls -hlF --color=auto --group-directories-first'
alias la='ls -ahlF --color=auto --group-directories-first'
alias cd..='cd ..'
alias cls="clear"
# start nginx foreground
# exec /usr/sbin/nginx -g 'daemon off;'

# generate configs
#
# /bin/confd -onetime -backend env
#
# vi /etc/nginx/conf.d/default.conf
#
