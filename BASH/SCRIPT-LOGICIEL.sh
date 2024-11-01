#!/bin/bash

# Définir les couleurs des variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # Aucune couleur

# Boucle while true pour faire un menu sur la gestion de logiciel
while true; do
    echo -e "${GREEN}------ MENU GESTION LOGICIEL ------\n"
    echo -e "${YELLOW}[1]${NC} Installer un logiciel"
    echo -e "${YELLOW}[2]${NC} Désinstaller un logiciel"
    echo -e "${RED}[x]${NC} Quitter\n"
    echo -e "${GREEN}Veuillez choisir une option : ${NC}"
    read choix

    # Case pour faire un bloc avec les choix correspondants au menu 
    case $choix in
         # Choix pour installer un logiciel  
         1)
            echo -e "${GREEN}Entrer le nom du logiciel à installer : ${NC}"
	    read logiciel
            sudo apt install $logiciel -y
            ;;
         # Choix pour désinstaller un logiciel   
         2)
            echo -e "${GREEN}Entrer le nom du logiciel à désinstaller : ${NC}"
            read logiciel
            sudo apt remove $logiciel -y
          ;;
	      # Sortir du script 
         3)
            echo -e "${YELLOW}Exit${NC}"
            break
            ;;
	      # Inique si erreur de saisie et relance le script    
         4)
            echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
            ;;
    esac
done 
# Fin du script
