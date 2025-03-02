![docker pull count](https://img.shields.io/docker/pulls/mavnt/alpine-net-tools) ![Docker Image Size](https://img.shields.io/docker/image-size/mavnt/alpine-net-tools)

# alpine-net-tools

[Alpine](https://alpinelinux.org/)-based Docker image for networking tasks.

## What's installed

* `bind-tools`
* `curl`
* `git`
* `jq`
* `mtr`
* `nano`
* `openssh` and `openssh-server`
* `python3` (for [sshuttle](https://github.com/sshuttle/sshuttle))
* `wget`
* `zsh` (with [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh))

## SSH

Pass your public key(s) as follows:

```bash
docker run --rm -d -e keys="`cat key1 [key2, ...]`" -p 9999:22 mavnt/alpine-net-tools
```

Full example:

```bash
ssh-keygen -t rsa -b 4096 -N "" -f ./id_rsa
docker run --rm -d -e keys="`cat id_rsa.pub`" -p 9999:22 mavnt/alpine-net-tools
ssh -i ./id_rsa root@localhost -p 9999
```

-----
[GitHub](https://github.com/mavnt/alpine-net-tools) - [Docker Hub](https://hub.docker.com/r/mavnt/alpine-net-tools)
