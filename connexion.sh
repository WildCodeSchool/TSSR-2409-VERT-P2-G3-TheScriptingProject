#!/bin/bash

#Menu Interactif plusieurs niveaux 

# Variables
user1="lbartaire@10.0.0.20"
user2="lbartaire@10.0.0.21"
Ex_script_User="chmod +x ~/UserControl.sh && ./UserControl.sh && rm ~/UserControl.sh"

PS3="Sur quelle machine voulez vous vous connecter? "
echo "Machines disponibles:"
options=("Ubuntu 1" "Ubuntu 2" "quitter")

select choix in "${options[@]}"; do
    case $REPLY in
    #Ubuntu 1
    1)
    #on liste les action des differentes sections
        PS3="Que voulez vous gérer? "
        echo "actions disponibles: "
        actions=("gestion utilisateurs" "gestions alimentations" "quitter")

        select choice in "${actions[@]}"; do
            case $REPLY in
                 #gestions des utilisateurs
                1)
                    scp ~/UserControl.sh $user1:~
                    ssh -t $user1 "$Ex_script_User"
                    ;;
                 #gestions alimentations (code a modifier)
                2)
                    scp ~/UserControl.sh $user1:~
                    ssh -t $user1 "$Ex_script_User"
                    ;;
                 #sortie           
                3)
                    echo "Au revoir"
                    break
                    ;;
                 *)
                    echo "choix invalide, veuillez recommencer"
                    ;; 
            esac
        done
        ;;
     #Ubuntu 2
    2)
    #on liste les action des differentes sections
        PS3="Que voulez vous gérer? "
        echo "actions disponibles: "
        actions=("gestion utilisateurs" "gestions alimentations" "quitter")

        select choice in "${actions[@]}"; do
            case $REPLY in
                 #gestions des utilisateurs
                1)
                    scp ~/UserControl.sh $user2:~
                    ssh -t $user2 "$Ex_script_User"
                    ;;
                 #gestions alimentations (code a modifier)
                2)
                    scp ~/UserControl.sh $user2:~
                    ssh -t $user2 "$Ex_script_User"
                    ;;
                 #sortie           
                 3)
                    echo "Au revoir"
                    break
                    ;;
                 *)
                    echo "choix invalide, veuillez recommencer"
                    ;; 
            esac
        done
        ;;
     #Sortie
    3)
        echo "Au revoir"
        break
        ;;
    *)
        echo "choix invalide, veuillez recommencer"
        ;;
    esac
done
