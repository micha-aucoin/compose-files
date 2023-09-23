#!/bin/bash

create_text_box() {
    local text=("$@")

    local text_length=0
    for line in "${text[@]}"; do
        local line_length=${#line}
        if ((line_length > text_length)); then
            text_length=$line_length
        fi
    done

    local box_width=$((text_length + 4))
    local border=$(printf "%${box_width}s" | tr ' ' '#')

    echo -e "\n$border"
    for line in "${text[@]}"; do
        printf "# %-${text_length}s #\n" "$line"
    done
    echo -e "$border\n"
}



generate_and_copy_ssh_key() {
    local key_name="$1"
    local user="$2"
    local hosts=("${@:3}")  # Get the list of hosts from the third argument onwards

    if [ "$key_name" == "ansible" ]; then
        text=("Generating $key_name ssh key pair"
        "DON'T CREATE PASSWORD FOR THIS KEY")
    else
        text=("Generating $key_name ssh key pair")
    fi

    create_text_box "${text[@]}"
    ssh-keygen -t ed25519 -f "/home/admin/.ssh/$key_name" -C "$key_name"

    for host in "${hosts[@]}"; do
        create_text_box "Copying $key_name public key to $host"
        ssh-copy-id -i "/home/admin/.ssh/${key_name}.pub" "$user@$host"
    done
}


target_hosts=("node1" "node2" "node3" "node4" "node5")
generate_and_copy_ssh_key "sysbox_workstation" "admin" "${target_hosts[@]}"
generate_and_copy_ssh_key "ansible" "admin" "${target_hosts[@]}"
