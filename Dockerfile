FROM alpine:3.21.3
RUN apk add --no-cache \
    curl \
    bind-tools \
    git \
    jq \
    mtr \
    nano \
    openssh-server \
    openssh \
    python3 \
    wget \
    zsh

RUN mkdir /root/.ssh && ssh-keygen -A \
    && sed -i 's/^#PasswordAuthentication\ yes/PasswordAuthentication\ no/' /etc/ssh/sshd_config \
    && sed -i 's/^root:!::0:::::/root:*::0:::::/' /etc/shadow
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    sed -i 's,^root:x:0:0:root:/root:/bin/sh,root:x:0:0:root:/root:/bin/zsh,' /etc/passwd && \
    sed -i 's,^ZSH_THEME="robbyrussell",ZSH_THEME="ys",' /root/.zshrc
COPY motd /etc/motd
CMD echo "$keys" >/root/.ssh/authorized_keys && /usr/sbin/sshd -D -e
