# alpine-net-tools

[Alpine](https://alpinelinux.org/)-based Docker image for networking tasks.

## What's installed

- `bind-tools`
- `curl`
- `git`
- `jq`
- `mtr`
- `nano`
- `openssh` and `openssh-server`
- `python2` (for [sshuttle](https://github.com/sshuttle/sshuttle))
- `wget`
- `zsh` (with [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh))

## SSH

Pass your public key(s) as follows:

```bash
docker run --rm -d -e keys="`cat key1 [key2, ...]`" -p 9999:22 mavnt/alpine-net-tools
```

-----
[GitHub](https://github.com/mavnt/alpine-net-tools) - [Docker Hub](https://hub.docker.com/r/mavnt/alpine-net-tools)
