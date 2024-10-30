#!/bin/bash

# Définir les couleurs des variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # Aucune couleur

# Boucle while true pour la gestion de pare-feu
while true; do
    echo -e "${GREEN}------ MENU GESTION LOGICIEL ------\n"
    echo -e "${GREEN}[1]${NC} Définir les règles de pare-feu"
    echo -e "${GREEN}[2]${NC} Activer le pare-feu"
    echo -e "${GREEN}[3]${NC} Désactiver le pare-feu"
    echo -e "${GREEN}[4]${NC} Quitter"
    echo -e "${GREEN}Veuillez choisir une option : ${NC}"
    read choix

    case $choix in 
        
         
         # Boucle while true pour les règles de pare-feu
         1) 
while true; do
    echo -e "${GREEN}------ MENU DES RÈGLES PARE-FEU ------\n"
    echo -e "${GREEN}[1]${NC} Ajouter une règle"
    echo -e "${GREEN}[2]${NC} Supprimer une règle"
    echo -e "${GREEN}[3]${NC} Afficher les règles actuelles"
    echo -e "${GREEN}[4]${NC} Retour au menu principal"
    echo -e "${GREEN}Veuillez choisir une option : ${NC}"
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
	       # Bloc pour activer le pare-feu
               echo -e "${GREEN}Voulez-vous activer le pare-feu ? : oui/non ${NC}"
               read oui

                # Tant que l'entrée n'est pas "oui" ou "non", on redemande une saisie valide
                while [[ "$oui" != "oui" && "$oui" != "non" ]]; do
                      echo -e "${RED}[ERREUR] Option invalide, veuillez entrer 'oui' ou 'non'.${NC}"
                      read -p "Entrer votre choix : " oui
                done

                if [ "$oui" = "oui" ]; then
                   sudo ufw enable
                   echo "Le pare-feu a bien été activé."
                else
                    echo "Le pare-feu n'a pas été activé."
                fi
                ;; 
            3)
	        # Bloc pour désactiver le pare-feu
                echo -e "${GREEN}Voulez-vous désactiver le pare-feu ? : oui/non ${NC}"
                read oui

                # Tant que l'entrée n'est pas "oui" ou "non", on redemande une saisie valide
                while [[ "$oui" != "oui" && "$oui" != "non" ]]; do
                      echo -e "${RED}[ERREUR] Option invalide, veuillez entrer 'oui' ou 'non'.${NC}"
                      read - p "Entrer votre choix : " oui
                done

                if [ "$oui" = "oui" ]; then
                   sudo ufw disable
                   echo "Le pare-feu a bien été désactivé."
                else
                    echo "Le pare-feu n'a pas été désactivé."
                fi
                ;;    
        
        # Quitter le script
        4)
            echo -e "${YELLOW}Exit${NC}"
	    break
	    ;;
        
        # Inique si erreur de saisie et relance le script
        *)
            echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
            ;;
    esac
done 
