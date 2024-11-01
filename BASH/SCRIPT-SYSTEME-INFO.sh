#!/bin/bash

# Définir les couleurs des variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # Aucune couleur

# Boucle while true pour faire un menu sur les informations systèmes
while true; do
    echo -e "${GREEN}------ MENU INFORMATION SYSTEME ------\n"
    echo -e "${YELLOW}[1]${NC} Type de CPU, nombre de coeurs, etc.."
    echo -e "${YELLOW}[2]${NC}  Mémoire RAM totale"
    echo -e "${YELLOW}[3]${NC}  Utilisation de la RAM"
    echo -e "${YELLOW}[4]${NC}  Utilisation du disque"
    echo -e "${YELLOW}[5]${NC}  Utilisation du processeur "
    echo -e "${RED}[x]${NC}  Quitter\n"
    echo -e "${GREEN}Veuillez choisir une option : ${NC}"
    read choix
    
    # Case pour faire un bloc avec les choix correspondants au menu 
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
            echo -e "${YELLOW}Exit${NC}"
            break
            ;;

        # Inique si erreur de saisie et relance le script
        *)
            echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
            ;;
    esac
done 
# Fin du script
