FROM ghcr.io/nestybox/ubuntu-jammy-systemd:latest

# Installs
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    openssh-server \
    python3 \
    curl \ 
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /home/admin/.ssh \
    && chown admin:admin /home/admin/.ssh

EXPOSE 22

# Set systemd as entrypoint.
ENTRYPOINT [ "/sbin/init", "--log-level=err" ]