FROM alpine:3.9.5
RUN apk add --no-cache \
    curl>=7.64.0-r3 \
    bind-tools>=9.14.12-r0 \
    git>=2.20.2-r0 \
    jq>=1.6-r0 \
    mtr>=0.92-r0 \
    nano>=3.2-r0 \
    openssh-server>=7.9_p1-r6 \
    openssh>=7.9_p1-r6 \
    python>=2.7.16-r2 \
    wget>=1.20.3-r0 \
    zsh>=5.6.2-r0

RUN mkdir /root/.ssh && ssh-keygen -A \
    && sed -i 's/^#PasswordAuthentication\ yes/PasswordAuthentication\ no/' /etc/ssh/sshd_config \
    && sed -i 's/^root:!::0:::::/root:*::0:::::/' /etc/shadow
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    sed -i 's,^root:x:0:0:root:/root:/bin/ash,root:x:0:0:root:/root:/bin/zsh,' /etc/passwd && \
    sed -i 's,^ZSH_THEME="robbyrussell",ZSH_THEME="ys",' /root/.zshrc
COPY motd /etc/motd
CMD echo "$keys" >/root/.ssh/authorized_keys && /usr/sbin/sshd -D -e