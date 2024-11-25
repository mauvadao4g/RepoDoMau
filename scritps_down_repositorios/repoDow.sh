#!/bin/bash

# Diretório onde os arquivos ZIP serão armazenados
OUTPUT_DIR="repos_zipped"
mkdir -p "$OUTPUT_DIR"

# Array com os links dos repositórios
repositorios=(
    "https://github.com/tahabasri/snippets"
    "https://github.com/rafamadriz/friendly-snippets"
    "https://github.com/honza/vim-snippets.git"
    "https://github.com/estefanionsantos/snippets.git"
    "https://github.com/akinalibeer/vim-snipmate.git"
)

# Função para processar os repositórios
processar_repositorios() {
    for repo in "${repositorios[@]}"; do
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

        # Compacta em formato ZIP
        echo "Compactando $repo_name em formato ZIP"
        zip -r "$OUTPUT_DIR/$repo_name.zip" "$repo_name"

        # Remove o repositório clonado para liberar espaço
        echo "Removendo pasta $repo_name"
        rm -rf "$repo_name"
    done
}

# Executa a função
processar_repositorios

echo "Processo concluído. Arquivos ZIP salvos em: $OUTPUT_DIR"