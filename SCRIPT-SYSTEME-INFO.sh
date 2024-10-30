#!/bin/bash

# Définir les couleurs des variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # Aucune couleur

# Boucle while true pour les informations systèmes
while true; do
    echo -e "${YELLOW}MENU INFORMATION SYSTEME :"
    echo -e "${GREEN}1) Type de CPU, nombre de coeurs, etc.."
    echo -e "${GREEN}2) Mémoire RAM totale"
    echo -e "${GREEN}3) Utilisation de la RAM"
    echo -e "${GREEN}4) Utilisation du disque"
    echo -e "${GREEN}5) Utilisation du processeur "
    echo -e "${GREEN}6) Quitter"
    echo -e "${YELLOW}Veuillez choisir une option : ${NC}"
    read choix

    case $choix in

         # Type de CPU, nombres de coeurs, etc..
         1)
            lscpu
            ;;

         # Mémoire totale de la RAM
        2)
            free -h | grep Mem | awk '{print $2}'
            ;;

        # Utilisation de la RAM
        3)
            free -h
            ;;
            
       # Utilisation du disque
        4)
            df -h
            ;;
            
        # Utilisation du processeur
        5)
            top
            ;;

        # Quitter le script
        6)
            echo "Exit"
            break
            ;;

        # Inique si erreur de saisie et relance le script
        *)
            echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
            ;;
    esac
done 
