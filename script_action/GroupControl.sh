#!/bin/bash
# Script projet 2 Lionel => partie Groupe
# connexion ssh a une machine distante en amont via un le script MainScript.sh
# choix des sections avec boucle while

# Définir les couleurs des variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Aucune couleur

while true; do
    echo -e "${GREEN}\n------ MENU GROUPE ------\n "
    echo -e "${CYAN}[1]${NC} Ajout a un groupe"
    echo -e "${CYAN}[2]${NC} Quitter le groupe"
    echo -e "${CYAN}[3]${NC} Retour au menu précédent\n"
    echo -e "Veuillez choisir une option :"
    read choix

    # a chaque choix correspond une commande qui execute l'action demandé et boucle tant que l'utilisateur ne choisi pas quitter"
    case $choix in

        1)      #ajout a un groupe
            echo -e "\nliste des groupes: "
            groups
            echo ""
            read -p "Dans quel groupe voulez vous ajouter l'utilisateur?" add_group
            sudo usermod -aG add_group $USER
            ;;

        2)      # quitter votre groupe
            echo ""
            read -p "Voulez vous quitter votre groupe actuel? (oui ou non)" reponse
            if [[ "$reponse" == "oui" ]]; then
                sudo gpasswd -d $USER $(id -gn)
                echo -e "\nvous avez bien quitter votre groupe"
            else
                echo -e "\nVous restez dans votre groupe actuel"
            fi
            ;;

        3)      # Retour au menu précédent
            echo -e "\nRetour au menu précédent"
            break
            ;;

        *)      #erreur
            echo -e "${RED}\nErreur:choix invalide, veuillez recommencer"
            ;;
            
     esac
done
