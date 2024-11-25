#!/bin/bash
# MAUDAVPN
# VER 1.0.0
#
clear

echo -e '\e[44;1;33mUPANDO PRO GITHUB\e[0m'
echo

echo -e '\e[1;34m'
git config --global --add safe.directory /storage/emulated/0/MAUVADAO/MAUVADAO_GITHHUB/RepoDoMau

echo -e '\e[1;30m'
git add -A
git commit -m "Update: $(date +%y%m%d%H%M%S)"
git push
echo -e '\e[0m'
echo  -e '\e[1;37mTERMINADO\e[0m'
