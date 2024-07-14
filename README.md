# alist_repl
Deploy alist on Replit.

temlate：Bash

Add `pkgs.busybox` in *replit.nix*

then

```bash
bash <(curl -s https://raw.githubusercontent.com/k0baya/alist_repl/main/test.sh)
```
## Update alist version
The same command above.
## Set password
Add a Secret in Tool box.
|Key|Value|
|-|-|
|PASSWORD|Your password|

# Deploy alist on serv00

```bash
wget -O alist-freebsd.sh https://raw.githubusercontent.com/k0baya/alist_repl/main/serv00/alist-freebsd.sh && sh alist-freebsd.sh
```
