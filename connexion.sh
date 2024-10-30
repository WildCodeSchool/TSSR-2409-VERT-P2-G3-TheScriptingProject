#!/bin/bash

#Menu Interactif plusieurs niveaux 

# Variables
user1="lbartaire@10.0.0.20"
user2="lbartaire@10.0.0.21"
Exe_script_User="chmod +x ~/UserControl.sh && ./UserControl.sh && rm ~/UserControl.sh"
Exe_script_Group="chmod +x ~/GroupControl.sh && ./GroupControl.sh && rm ~/GroupControl.sh"
Exe_script_System="chmod +x ~/GestionDuSysteme.sh && ./GestionDuSysteme.sh && rm ~/GestionDuSysteme.sh"
Exe_script_Logiciel="chmod +x ~/GestionLogiciel.sh && ./GestionLogiciel.sh && rm ~/GestionLogiciel.sh"
Exe_script_Parefeu="chmod +x ~/GestionParefeu.sh && ./GestionParefeu.sh && rm ~/GestionParefeu.sh"
Exe_script_Systeme="chmod +x ~/InfoDuSysteme.sh && ./InfoDuSysteme.sh && rm ~/InfoDuSysteme.sh"
Exe_script_Repertoire="chmod +x ~/GestionDesRepertoires.sh && ./GestionDesRepertoires.sh && rm ~/GestionDesRepertoires.sh"

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
        actions=("gestion utilisateurs" "gestions des groupes" "gestion du système" "Gestion des Répertoires" "Prise en main CLI" "Gestion Logiciel" "Gestion du Parefeu" "Information du Système" "quitter")

        select choice in "${actions[@]}"; do
            case $REPLY in
                 #gestions des utilisateurs
                1)
                    scp ~/UserControl.sh $user1:~
                    ssh -t $user1 "$Exe_script_User"
                    ;;
                 #gestions groupes (code a modifier)
                2)
                    scp ~/GroupControl.sh $user1:~
                    ssh -t $user1 "$Exe_script_Group"
                    ;;
                 #gestions système 
                3)
                    scp ~/GestionDuSysteme.sh $user1:~
                    ssh -t $user1 "$Exe_script_System"
                    ;;
                 #gestions Répertoires 
                4)
                    scp ~/GestionDesRepertoires.sh $user1:~
                    ssh -t $user1 "$Exe_script_Repertoire"
                    ;;
                 #Prise en main CLI 
                5)
                    ssh -t $user1
                    ;;
                 #gestions logiciel 
                6)
                    scp ~/GestionLogiciel.sh $user1:~
                    ssh -t $user1 "$Exe_script_Logiciel"
                    ;;
                 #gestions Parefeu
                7)
                    scp ~/GestionParefeu.sh $user1:~
                    ssh -t $user1 "$Exe_script_Parefeu"
                    ;;
                 #Information Système
                8)
                    scp ~/InfoDuSysteme.sh $user1:~
                    ssh -t $user1 "$Exe_script_Systeme"
                    ;;
                 #sortie           
                9)
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
        actions=("gestion utilisateurs" "gestions des groupes" "quitter")

        select choice in "${actions[@]}"; do
            case $REPLY in
                 #gestions des utilisateurs
                1)
                    scp ~/UserControl.sh $user2:~
                    ssh -t $user2 "$Exe_script_User"
                    ;;
                 #gestions des Groupes 
                2)
                    scp ~/GroupControl.sh $user2:~
                    ssh -t $user2 "$Exe_script_Group"
                    ;;
                 #gestions système 
                3)
                    scp ~/GestionDuSysteme.sh $user2:~
                    ssh -t $user1 "$Exe_script_System"
                    ;;
                 #gestions Répertoires 
                4)
                    scp ~/GestionDesRepertoires.sh $user2:~
                    ssh -t $user1 "$Exe_script_Repertoire"
                    ;;
                 #Prise en main CLI 
                5)
                    ssh -t $user2
                    ;;
                 #gestions logiciel 
                6)
                    scp ~/GestionLogiciel.sh $user2:~
                    ssh -t $user1 "$Exe_script_Logiciel"
                    ;;
                 #gestions Parefeu
                7)
                    scp ~/GestionParefeu.sh $user2:~
                    ssh -t $user1 "$Exe_script_Parefeu"
                    ;;
                 #Information Système
                8)
                    scp ~/InfoDuSysteme.sh $user2:~
                    ssh -t $user1 "$Exe_script_Systeme"
                    ;;
                 #sortie           
                9)
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
