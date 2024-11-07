#!/bin/bash
# Script projet 2 Lionel => partie utilisateur
# connexion ssh a une machine distante en amont via un le script MainScript.sh

# choix des sections avec boucle while

while true; do
    echo -e "Menu: "
    echo -e "1) créer un compte utilisateur"
    echo -e "2) modifier un MDP"
    echo -e "3) supprimer un compte utilisateur"
    echo -e "4) désactiver un compte utilisateur"
    echo -e "5) quitter"
    echo -e "Choisissez une option: "
    read choix
    
# a chaque choix correspond une commande qui execute l'action demandé et boucle tant qu el'utilisateur ne choisi pas quitter"
    case $choix in
        1)
            read -p "Quel est le nom du compte utilisateur à créer? " new_user
            sudo adduser $new_user
            ;;
        2)
            read -p "${GREEN}Le mdp de quel utilisateur voulez vous modifier? " userpassw_change
            sudo passwd $userpassw_change
            ;;
        3)
            read -p "Quel compte utilisateur voulez supprimer? " delete_user
            sudo userdel $delete_user
            ;;
        4)
            read -p "Quel compte utilisateur souhaitez vous désactiver? " desactivate_user
            sudo chage -E 0 $desactivate_user
            ;;
        5)
            echo "Au revoir"
            break
            ;;
        *)
            echo "choix invalide, veuillez recommencer"
            ;;
            
     esac
done
