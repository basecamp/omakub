#!/bin/bash

if [ ! -f /etc/os-release ]; then
    echo "$(tput setaf 1)Aviso: Não foi possível determinar o SO. Arquivo /etc/os-release não encontrado."
    read -p "Deseja continuar mesmo assim? (s/N) " resposta
    if [[ ! $resposta =~ ^[Ss]$ ]]; then
        echo "Instalação interrompida."
        exit 1
    fi
fi

. /etc/os-release

# Verifica se está rodando Fedora
if [ "$ID" != "fedora" ]; then
    echo "$(tput setaf 1)Aviso: Requisito de SO não atendido"
    echo "Você está rodando: $ID"
    echo "SO recomendado: Fedora"
    read -p "Deseja continuar mesmo assim? (s/N) " resposta
    if [[ ! $resposta =~ ^[Ss]$ ]]; then
        echo "Instalação interrompida."
        exit 1
    fi
fi
