#!/bin/bash

# Generate sysbox_workstation SSH key
echo "Generating sysbox_workstation SSH key"
ssh-keygen -t ed25519 -f /home/admin/.ssh/workstation -C "sysbox_workstation" 

# Copy sysbox_workstation SSH key to target hosts
ssh-copy-id -i /home/admin/.ssh/workstation.pub admin@node1
ssh-copy-id -i /home/admin/.ssh/workstation.pub admin@node2
ssh-copy-id -i /home/admin/.ssh/workstation.pub admin@node3

# Generate ansible SSH key
echo "Generating ansible SSH key"
ssh-keygen -t ed25519 -f /home/admin/.ssh/ansible -C "ansible" 

# Copy ansible SSH key to target hosts
ssh-copy-id -i /home/admin/.ssh/ansible.pub admin@node1
ssh-copy-id -i /home/admin/.ssh/ansible.pub admin@node2
ssh-copy-id -i /home/admin/.ssh/ansible.pub admin@node3

echo "adding identity to the session"
eval $(ssh-agent)
ssh-add ~/.ssh/workstation
