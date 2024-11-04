#!/bin/bash

# Attribution des variables de couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # Aucune couleur

# Demande le nom d'utilisateur
read -p "Entrez le nom de l'utilisateur : " Utilisateur

# Vérifie qu'un nom d'utilisateur a été fourni
if [ -z "$USER" ]; then
    echo -e "${RED}Erreur: Aucun nom d'utilisateur saisie${NC}"
    read -p "Entrez le nom de l'utilisateur : " Utilisateur
fi

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # Aucune couleur

statut=1

# Boucle pour afficher le menu et gérer les choix de l'utilisateur
while [ $statut = 1 ]
do
    echo -e "\n${GREEN}----- MENU INFORMATIONS UTILISATEUR -----\n"
    echo -e "${YELLOW}[1]${NC} Date de dernière connexion"
    echo -e "${YELLOW}[2]${NC} Date de dernière modification du mot de passe"
    echo -e "${YELLOW}[3]${NC} Liste des sessions ouvertes"
    echo -e "${YELLOW}[4]${NC} Groupes d'appartenance"
    echo -e "${YELLOW}[5]${NC} Historique des commandes"
    echo -e "${YELLOW}[6]${NC} Droits sur un dossier"
    echo -e "${YELLOW}[7]${NC} Droits sur un fichier"
    echo -e "${YELLOW}[8]${NC} Retour au menu precedent"
    echo -e "${YELLOW}[X]${NC} Quitter\n"
    read -p "Veuillez choisir une option: " CHOIX

	case $CHOIX in

		# Date de dernière connexion d’un utilisateur
		"1")
		 echo -e "\nDate de dernière connexion de $Utilisateur:"
        	 lastlog -u "$Utilisateur"
		;;
		
		# Date de dernière modification du mot de passe
		"2")
		echo -e "\nDate de dernière modification du mot de passe :"
        	chage -l "$Utilisateur" | grep "Last password change"
		;;

		# Liste des sessions ouvertes par l'utilisateur
		"3")
		echo -e "\nSessions ouvertes par l'utilisateur $Utilisateur:"
		who | grep "$Utilisateur" || echo "Aucune session ouverte."
		;;

		# Groupe d’appartenance d’un utilisateur
		"4")
		echo -e "\nGroupes d'appartenance:"
		groups "$Utilisateur"
		;;

		# Historique des commandes exécutées par l'utilisateur
		"5")
		
		HIST_FILE="/home/$Utilisateur/.bash_history"
		if [ -f "$HIST_FILE" ]; 
		then
			echo -e "\nHistorique des 20 dernières commandes :"
			tail -n 20 "$HIST_FILE" # Affiche les 20 dernières commandes pour limiter la sortie
		else
			echo "Historique indisponible ou l'utilisateur $Utilisateur n'a pas de fichier .bash_history."
		fi
		;;

		# Droits/permissions de l’utilisateur sur un dossier
		"6")
		echo -e "\nDroits sur un dossier spécifique :"
      		read -p "Entrez le chemin complet du dossier : " CHEMIN_DOSSIER
        	if [ -d "$CHEMIN_DOSSIER" ]; 
		then
           		 sudo -u "$Utilisateur" [ -r "$CHEMIN_DOSSIER" ] && echo "Lecture : Oui" || echo "Lecture : Non"
           		 sudo -u "$Utilisateur" [ -w "$CHEMIN_DOSSIER" ] && echo "Écriture : Oui" || echo "Écriture : Non"
            		sudo -u "$Utilisateur" [ -x "$CHEMIN_DOSSIER" ] && echo "Exécution : Oui" || echo "Exécution : Non"
        	else
            		echo "Le dossier n'existe pas."
        	fi
		;;

		# Droits/permissions de l’utilisateur sur un fichier
		"7")
		echo -e "\nDroits sur un fichier spécifique :"
       		read -p "Entrez le chemin complet du fichier : " CHEMIN_FICHIER
		if [ -f "$CHEMIN_FICHIER" ]; then
			sudo -u "$Utilisateur" [ -r "$CHEMIN_FICHIER" ] && echo "Lecture : Oui" || echo "Lecture : Non"
			sudo -u "$Utilisateur" [ -w "$CHEMIN_FICHIER" ] && echo "Écriture : Oui" || echo "Écriture : Non"
			sudo -u "$Utilisateur" [ -x "$CHEMIN_FICHIER" ] && echo "Exécution : Oui" || echo "Exécution : Non"
		else
			echo "Le fichier n'existe pas."
		fi
		;;
		
		# Retour au menu precedent
		"8")
		statut=0
		;;
		
		# Quitter le script
		"X")
		echo "A bientot"
		exit 0
		;;
		
		*)
		echo -e "\n${RED}Erreur: Veuillez choisir une des options suivantes"
		;;
			
	esac	
done
