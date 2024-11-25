#!/bin/bash
# MAUDAVPN
# VER 1.0.1
#
clear

# Diretório onde os arquivos ZIP serão armazenados
DESTINO="REPOSITORIOS"
mkdir -p "$DESTINO"

# Arquivo com os links dos repositórios
REPOS_FILE="repositorios.txt"

# Verifica se o arquivo de repositórios existe
if [ ! -f "$REPOS_FILE" ]; then
    echo "Erro: Arquivo $REPOS_FILE não encontrado!"
    exit 1
fi

# Função para processar os repositórios
processar_repositorios() {
    while IFS= read -r repo; do
        # Ignora linhas vazias ou comentários
        [[ -z "$repo" || "$repo" == \#* ]] && continue
        
        # Extrai o nome do repositório
        repo_name=$(basename "$repo" .git)
        echo "Clonando repositório: $repo_name"

        # Clona o repositório
        git clone "$repo" "$repo_name"

        # Remove a pasta .git
        if [ -d "$repo_name/.git" ]; then
            echo "Removendo pasta .git do $repo_name"
            rm -rf "$repo_name/.git"
        fi

        # Compacta em formato ZIP no diretório de destino
        echo "Compactando $repo_name em formato ZIP"
        zip -r "$DESTINO/$repo_name.zip" "$repo_name"

        # Remove o repositório clonado para liberar espaço
        echo "Removendo pasta $repo_name"
#        rm -rf "$repo_name"
    done < "$REPOS_FILE"
}

# Executa a função
processar_repositorios

echo "Processo concluído. Arquivos ZIP salvos em: $DESTINO"