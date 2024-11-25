#!/bin/bash
# MAUDAVPN
# VER 1.0.0
#
clear

git config --global --add safe.directory /storage/emulated/0/MAUVADAO/MAUVADAO_GITHHUB/RepoDoMau

git add -A
git commit -m "Update: $(date +%y%m%d%H%M%S)"
git push