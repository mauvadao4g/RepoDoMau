#!/bin/bash
# fazendo push pro diretorio do github

echo "Fazendo push"
echo

git pull
[[ $? == 0 ]] && {
echo "Sucesso"
} || {
echo "Error"
}

