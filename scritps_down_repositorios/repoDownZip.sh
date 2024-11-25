#!/bin/bash

# Diretório onde os arquivos ZIP serão armazenados
OUTPUT_DIR="repositorios_zip"
mkdir -p "$OUTPUT_DIR"

# Array com os links dos repositórios
repositorios=(
    "https://github.com/tahabasri/snippets"
    "https://github.com/rafamadriz/friendly-snippets"
    "https://github.com/honza/vim-snippets"
    "https://github.com/estefanionsantos/snippets"
    "https://github.com/akinalibeer/vim-snipmate"
)

# Função para processar os repositórios
processar_repositorios() {
    for repo in "${repositorios[@]}"; do
        # Extrai o nome do repositório
        repo_name=$(basename "$repo")
        echo "Baixando repositório: $repo_name"

        # Monta o URL para download do ZIP
        zip_url="${repo}/archive/refs/heads/main.zip"

        # Baixa o repositório como ZIP
        curl -L -o "$OUTPUT_DIR/${repo_name}.zip" "$zip_url" || {
            echo "Falha ao baixar $repo_name. Tentando com 'master' como branch."
            zip_url="${repo}/archive/refs/heads/master.zip"
            curl -L -o "$OUTPUT_DIR/${repo_name}.zip" "$zip_url" || {
                echo "Falha ao baixar $repo_name em ambos os formatos (main/master)."
            }
        }
    done
}

# Executa a função
processar_repositorios

echo "Processo concluído. Arquivos ZIP salvos em: $OUTPUT_DIR"