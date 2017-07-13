#!/usr/bin/env bash

: <<'Block_Comments'
如何xclip剪切文件？
https://elcasey.wordpress.com/2008/02/12/xclip-use-the-clipboard-from-the-command-line/ https://www.google.com/search?q=xclip+tutorial
Block_Comments

: <<'Block_Comments'
如何使用xclip复制输出到剪切板且同时输出？
-out ref man xclip
Block_Comments

: <<'Block_Comments'
为什么xclip没有使用管道也能输出？
-i, -in
read text into X selection from standard input or files (default)
Block_Comments

xclip -selection clipboard -in # man xclip /-sele
xclip -selection clipboard -out # man xclip /-sele
