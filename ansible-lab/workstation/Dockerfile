FROM ghcr.io/nestybox/ubuntu-jammy-systemd:latest 

# Installs
RUN apt-get update \
    && apt-get install --no-install-recommends -y -qq \
    openssh-server \
    bash-completion \
    git \
    ansible --quiet \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /home/admin/.ssh \
    && chown admin:admin /home/admin/.ssh

# setup ssh connections
COPY ssh-conn.sh home/admin/ssh-conn.sh
RUN chmod +x home/admin/ssh-conn.sh \
    && chown admin:admin home/admin/ssh-conn.sh

EXPOSE 22

# Set systemd as entrypoint.
ENTRYPOINT [ "/sbin/init", "--log-level=err" ]




