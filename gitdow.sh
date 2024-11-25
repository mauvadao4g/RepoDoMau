#!/bin/bash
# fazendo push pro diretorio do github

echo "Fazendo push"
echo

git push
[[ $? == 0 ]] && {
echo "Sucesso"
} || {
echo "Error"
}

