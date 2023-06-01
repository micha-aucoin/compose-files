FROM ghcr.io/nestybox/ubuntu-jammy-systemd:latest 

# Install Sshd
RUN apt-get update && apt-get install --no-install-recommends -y openssh-server \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /home/admin/.ssh \
    && chown admin:admin /home/admin/.ssh

EXPOSE 22

# setup ssh connections
COPY ssh-conn.sh home/admin/ssh-conn.sh
RUN chmod +x home/admin/ssh-conn.sh \
    && chown admin:admin home/admin/ssh-conn.sh


# Set systemd as entrypoint.
ENTRYPOINT [ "/sbin/init", "--log-level=err" ]




