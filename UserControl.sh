#!/bin/bash
# Script projet 2 Lionel => partie utilisateur
# connexion ssh a une machine distante en amont via un le script MainScript.sh
# Définir les couleurs des variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Aucune couleur
# choix des sections avec boucle while
while true; do
    echo -e "${GREEN}\n------ MENU COMPTE UTILISATEUR ------\n"
    echo -e "${CYAN}[1]${NC} Créer un compte utilisateur"
    echo -e "${CYAN}[2]${NC} Modifier un MDP"
    echo -e "${CYAN}[3]${NC} Supprimer un compte utilisateur"
    echo -e "${CYAN}[4]${NC} Désactiver un compte utilisateur"
    echo -e "${CYAN}[5]${NC} Retour au menu precedent\n"
    echo -e "Choisissez une option: "
    read choix
    
# a chaque choix correspond une commande qui execute l'action demandé et boucle tant qu el'utilisateur ne choisi pas quitter"
    case $choix in
        1)
            echo ""
            read -p "Quel est le nom du compte utilisateur à créer? " new_user
            sudo adduser $new_user
            ;;
        2)
            echo ""
            read -p "Le mdp de quel utilisateur voulez vous modifier? " userpasswd_change
            sudo passwd $userpasswd_change
            ;;
        3)
            echo ""
            read -p "Quel compte utilisateur voulez supprimer? " delete_user
            sudo userdel $delete_user
            ;;
        4)
            echo ""
            read -p "Quel compte utilisateur souhaitez vous désactiver? " desactivate_user
            sudo chage -E 0 $desactivate_user
            ;;
        5) # Retour au menu précédent
            echo -e "\nRetour au menu précédent"
            break
            ;;
        *)  #Erreur
            echo -e "${RED}\nErreur:choix invalide, veuillez recommencer"
            ;;
            
     esac
done
