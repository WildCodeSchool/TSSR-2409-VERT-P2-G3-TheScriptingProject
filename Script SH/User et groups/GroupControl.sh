#!/bin/bash
# Script projet 2 Lionel => partie Groupe
# connexion ssh a une machine distante en amont via un le script MainScript.sh
# choix des sections avec boucle while

while true; do
    echo -e "Menu: "
    echo -e "1) ajout a un groupe"
    echo -e "2) Quitter le groupe"
    echo -e "3) Retour au menu précédent"
    echo -e "x) Fin du script"
    echo -e "Choisissez une option: "
    read choix

    # a chaque choix correspond une commande qui execute l'action demandé et boucle tant que l'utilisateur ne choisi pas quitter"
    case $choix in
        1)      #ajout a un groupe
            echo "liste des groupes: "
            groups
            read -p "Dans quel groupe voulez vous ajouter l'utilisateur?" add_group
            sudo usermod -aG add_group $USER
            ;;
        2)      # quitter votre groupe
            read -p "Voulez vous quitter votre groupe actuel? (oui ou non)" reponse
            if [[ "$reponse" == "oui" ]]; then
                sudo gpasswd -d $USER $(id -gn)
                echo "vous avez bien quitter votre groupe"
            else
                echo "Vous restez dans votre groupe actuel"
            fi
            ;;
        3)      # Retour au menu précédent
            echo "Retour au menu précédent"
            break
            ;;
        4)      #Fin du script
            echo "Fin du script"
            exit 0
            ;;
        *)      #erreur
            echo "choix invalide, veuillez recommencer"
            ;;
            
     esac
done