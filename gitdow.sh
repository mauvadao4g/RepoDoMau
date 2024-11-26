#!/bin/bash
# fazendo push pro diretorio do github

echo "Fazendo Donwload dos arquivos do github"
echo

git pull
[[ $? == 0 ]] && {
echo "Sucesso"
} || {
echo "Error"
}

