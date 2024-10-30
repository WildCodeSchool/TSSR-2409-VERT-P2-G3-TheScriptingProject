#!/bin/bash

# Définir les couleurs des variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # Aucune couleur

# Boucle while true pour la gestion de pare-feu
while true; do
    echo -e "${YELLOW}MENU GESTION PARE-FEU :"
    echo -e "${GREEN}1) Définir les règles de pare-feu"
    echo -e "${GREEN}2) Activer le pare-feu"
    echo -e "${GREEN}3) Désactiver le pare-feu"
    echo -e "${GREEN}4) Quitter"
    echo -e "${YELLOW}Veuillez choisir une option : ${NC}"
    read choix

    case $choix in 
        
         
         # Boucle while true pour les règles de pare-feu
         1) 
while true; do
    echo -e "${YELLOW}MENU DES RÈGLES PARE-FEU :"
    echo -e "${GREEN}1) Ajouter une règle"
    echo -e "${GREEN}2) Supprimer une règle"
    echo -e "${GREEN}3) Afficher les règles actuelles"
    echo -e "${GREEN}4) Retour au menu principal"
    echo -e "${YELLOW}Veuillez choisir une option : ${NC}"
    read choix_regles
    
    case $choix_regles in

    		1)      # Règles de pare-feu
                        echo -e "${GREEN}Entrer la règle à ajouter (ex: allow 22/tcp) : ${NC}"
                        read regle
                        sudo ufw $regle
                        echo -e "${GREEN}Règle ajoutée : $regle${NC}"
                        ;;
                    2)
                        echo -e "${GREEN}Entrer la règle à supprimer (ex: allow 22/tcp) : ${NC}"
                        read regle
                        sudo ufw delete $regle
                        echo -e "${GREEN}Règle supprimée : $regle${NC}"
                        ;;
                    3)
                        echo -e "${GREEN}Règles de pare-feu actuelles :${NC}"
                        sudo ufw status
                        ;;
                    4)
                        echo -e "${YELLOW}Retour au menu principal.${NC}"
                        break
                        ;;
                    *)
                        echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
                        ;;
                esac
            done
            ;;              	 	
            	            
         # Activation du pare-feu          
         2)
            echo -e "${GREEN}Voulez-vous activer le pare-feu ? : oui/non ${NC}"
	    read oui
            
	    if [ $oui = "oui" ];
	    then
	    	sudo ufw enable
		echo "Le pare-feu a bien été activer."
	    else
	     	echo "Le pare-feu n'a pas été activer."
 	    fi
            ;;
         
        # Désactivation du pare-feu    
        3)
            echo -e "${GREEN}Voulez-vous désactiver le pare-feu ? : oui/non ${NC}"
	    read oui
            
	    if [ $oui = "oui" ];
	    then
	    	sudo ufw disable
		echo "Le pare-feu a bien été désactiver."
	    else
	     	echo "Le pare-feu n'a pas été désactiver."
 	    fi
            ;;    
        
        # Quitter le script
        4)
            echo "Exit"
	    break
	    ;;
        
        # Inique si erreur de saisie et relance le script
        *)
            echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
            ;;
    esac
done 
