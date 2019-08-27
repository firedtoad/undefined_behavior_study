#!/usr/bin/env bash
# Setup bionic with proper tools

docker pull ubuntu:eoan-20190813

tmpfile=$(mktemp ub-docker-script.XXXXXX)
exec 3>"$tmpfile"

cat >&3 <<EOL
#!/usr/bin/env bash
set -x
set -e
adduser  --disabled-password --uid $(id -u) --gecos "" $(whoami)
apt -qq update > /tmp/update.txt 2>&1
apt -qq -o Dpkg::Use-Pty=0 install clang clang-tidy cmake cppcheck curl g++ python3 tar valgrind -y > /tmp/install.txt 2>&1
su - $(whoami)
cd $(pwd)
./generate_results.bash
EOL

cat "$tmpfile"
chmod +x "$tmpfile"

docker run \
  --rm \
  --cap-add SYS_PTRACE \
  --mount type=bind,source=$(pwd),target=$(pwd) \
  ubuntu:bionic-20180821 \
  /bin/bash -x $(pwd)/"$tmpfile"
rm "$tmpfile"

