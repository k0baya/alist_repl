mkdir -p background && cd background

repo="alist-org/alist"

tag=$(curl -s "https://api.github.com/repos/$repo/releases/latest" | grep -o '"tag_name": ".*"' | sed 's/"tag_name": "//;s/"//')

download_url="https://github.com/$repo/releases/download/$tag/alist-linux-amd64.tar.gz"

wget "$download_url" -O manager.tar.gz

mkdir -p program && mkdir -p tempupdate

tar -xzf manager.tar.gz -C tempupdate && rm -f manager.tar.gz && mv -f tempupdate/* program/manager && rm -rf tempupdate && cd program && chmod +x manager && cd /home/runner/${REPL_SLUG}

cat <<EOL > main.sh
rm -rf nohup.out
PASSWORD="\${PASSWORD:-PASSWORD}"
nohup ./background/program/manager admin set \${PASSWORD}
nohup ./background/program/manager server >/dev/null 2>&1
EOL
