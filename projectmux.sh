#!/usr/bin/env bash

projects=$(echo "CoreDNS Ansible-Role-Dotfiles" | tr " " "\n")
selected=$(echo -e "$projects" | fzf)

coredns="TestCoreDNS"
AD="Ansible-Dotfiles"

if [[ "$selected" == "CoreDNS" ]]; then
    echo "Core!!!"
    tmux new -A -s "$coredns" -d -c "$HOME/open-source/CoreDNS/coredns/"
    tmux new-window -t "$coredns"  -n "testing" -c "$HOME/open-source/CoreDNS/testing"
    tmux switch-client -t "$coredns"
    exit 0
fi

if [[ "$selected" == "Ansible-Role-Dotfiles" ]]; then
    tmux new -A -s "$AD" -d -c "$HOME/projects/ansible-roles/ansible-role-dotfiles"
    tmux new-window -t "$AD"  -n "testing" -c "$HOME/projects/ansible-roles/ansible-role-dotfiles"
    tmux switch-client -t "$AD"
    exit 0
fi
