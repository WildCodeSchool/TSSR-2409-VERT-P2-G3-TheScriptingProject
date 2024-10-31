#!/bin/bash
#Le code dois:
#1- demander sur qu'elle machine on se connecte
#2- demander si on veut faire une action ou de la demande d'informations
#3- en fonction du script final on télécharge et on execute un script sur la machine distante

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


#Menu déroulement choix utilisateurs et type d'action:

PS3="Sur quelle machine voulez vous vous connecter? "
echo "Machines disponibles:"
options=("Ubuntu 1" "Ubuntu 2" "Quitter")

select choix in "${options[@]}"; do
    case $REPLY in
    
        1)              #Ubuntu 1=> on rajoute choix action ou info
            PS3="Que voulez vous faire sur Ubuntu 1? "
            echo "Choix disponibles:"
            choix1=("Actions Ubuntu 1" "Informations Ubuntu 1" "Retour Menu au principal" "Quitter")

            select choix in "${choix1[@]}"; do
                case $REPLY in

                    1)          #Actions 1
                        PS3="Que voulez vous gérer? "
                        echo "actions disponibles: "
                        actions1=("gestion utilisateurs" "gestions des groupes" "gestion du système" "Gestion des Répertoires" "Prise en main CLI" "Gestion Logiciel" "Gestion du Parefeu" "Information du Système" "Retour au menu précédent" "fin du script")

                        select choice in "${actions1[@]}"; do
                            case $REPLY in
                                 
                                1)      #gestions des utilisateurs
                                    scp ~/UserControl.sh $user1:~
                                    ssh -t $user1 "$Exe_script_User"
                                    ;;                                
                                2)         #gestions groupes (code a modifier)
                                    scp ~/GroupControl.sh $user1:~
                                    ssh -t $user1 "$Exe_script_Group"
                                    ;; 
                                3)          #gestions système
                                    scp ~/GestionDuSysteme.sh $user1:~
                                    ssh -t $user1 "$Exe_script_System"
                                    ;; 
                                4)          #gestions Répertoires
                                    scp ~/GestionDesRepertoires.sh $user1:~
                                    ssh -t $user1 "$Exe_script_Repertoire"
                                    ;; 
                                5)          #Prise en main CLI
                                    ssh -t $user1
                                    ;;
                                6)          #gestions logiciel 
                                    scp ~/GestionLogiciel.sh $user1:~
                                    ssh -t $user1 "$Exe_script_Logiciel"
                                    ;;
                                7)          #gestions Parefeu
                                    scp ~/GestionParefeu.sh $user1:~
                                    ssh -t $user1 "$Exe_script_Parefeu"
                                    ;;                                
                                8)          #Information Système => a mettre dans information
                                    scp ~/InfoDuSysteme.sh $user1:~
                                    ssh -t $user1 "$Exe_script_Systeme"
                                    ;;                                           
                                9)          #sortie  
                                    echo "Retour au menu précédent"
                                    break
                                    ;;
                                10)     # Fin du script
                                    echo "fin du script"
                                    exit 0
                                    ;;
                                *)
                                    echo "choix invalide, veuillez recommencer"
                                    ;; 
                            esac
                        done                                                       
                        ;;

                    2)          #Informations 1

                        ;;

                    3)          #Retour au Menu principal
                        echo "Retour au menu Principal"
                        break
                        ;;
                    4)          #Fin du script
                        echo "Fin du Script"
                        exit 0
                        ;;
                    *)          #Erreur 1
                        echo "choix invalide, veuillez recommencer"
                        ;;

                esac 
            done
            ;;
        2)              #Ubuntu 2=> on rajoute choix action ou info
            PS3="Que voulez vous faire sur Ubuntu 2? "
            echo "Choix disponibles:"
            choix2=("Actions Ubuntu 2" "Informations Ubuntu 2" "Retour au menu principal" "Fin du script")

            select choix in "${choix2[@]}"; do
                case $REPLY in

                    1)          #Actions 2
                        PS3="Que voulez vous gérer? "
                        echo "actions disponibles: "
                        actions2=("gestion utilisateurs" "gestions des groupes" "gestion du système" "Gestion des Répertoires" "Prise en main CLI" "Gestion Logiciel" "Gestion du Parefeu" "Information du Système" "Retour au menu précédent" "fin du script")

                        select choice in "${actions2[@]}"; do
                            case $REPLY in                                    
                                1)      #gestions des utilisateurs
                                    scp ~/UserControl.sh $user2:~
                                    ssh -t $user2 "$Exe_script_User"
                                    ;; 
                                2)      #gestions des Groupes 
                                    scp ~/GroupControl.sh $user2:~
                                    ssh -t $user2 "$Exe_script_Group"
                                    ;;                                    
                                3)      #gestions système
                                    scp ~/GestionDuSysteme.sh $user2:~
                                    ssh -t $user2 "$Exe_script_System"
                                    ;;                                     
                                4)      #gestions Répertoires
                                    scp ~/GestionDesRepertoires.sh $user2:~
                                    ssh -t $user2 "$Exe_script_Repertoire"
                                    ;;                                    
                                5)      #Prise en main CLI
                                    ssh -t $user2
                                    ;;
                                6)      #gestions logiciel
                                    scp ~/GestionLogiciel.sh $user2:~
                                    ssh -t $user2 "$Exe_script_Logiciel"
                                    ;;
                                7)      #gestions Parefeu
                                    scp ~/GestionParefeu.sh $user2:~
                                    ssh -t $user2 "$Exe_script_Parefeu"
                                    ;;
                                8)      #Information Système
                                    scp ~/InfoDuSysteme.sh $user2:~
                                    ssh -t $user2 "$Exe_script_Systeme"
                                    ;;          
                                9)      #Retour au menu précédent
                                    echo "Retour au menu précédent"
                                    break
                                    ;;
                                10)     #Fin du script
                                    echo "fin du script"
                                    exit 0
                                    ;;
                                *)
                                    echo "choix invalide, veuillez recommencer"
                                    ;; 
                            esac
                        done
                        ;;

                    2)          #Informations 2
                        ;;
                    3)          #Retour au menu principal 2
                        echo "Retour au menu principal"
                        break
                        ;;
                    4)          #Fin du script
                        echo "Fin du script"
                        exit 0
                        ;;
                    *)          #Erreur 2
                        echo "choix invalide, veuillez recommencer"
                        ;;
                esac 
            done
            ;;
        3)              #fin du script
            echo "fin du script"
            exit 0
            ;;
        *)      #erreur choix Ubuntu   
            echo "choix invalide, veuillez recommencer"
            ;;
    esac
done
  
