#!/bin/bash

statut=1

while [ $statut = 1 ]
do
	echo "MENU GESTION DU SYSTEME"
	echo "1- Arreter le systeme"
	echo "2- Redemarrer le systeme"
	echo "3- Verrouiller le systeme"
	echo "4- Mettre à jour le systeme"
	echo "5- Retourner au menu principal"
	echo "Veuillez choisir une option:"
	read choix_option

	case $choix_option in
	
		"1")
		read -p "Voulez-vous vraiment arreter le systeme? (oui/non)": reponse
		while [ $reponse != "non" ] && [ $reponse != "n" ];
		do
			if [ $reponse = "oui" ] || [ $reponse = "o" ]
			then 
				echo "Le systeme est en cours d'arret..."
				sleep 3
				#Executer la commande d'arret du systeme
				sudo shutdown now	
				exit 1
			else 
				echo "Erreur lors de la saisie"
				read -p "Voulez-vous vraiment arreter le systeme? (oui/non)": reponse
			fi
		done
		# Dans le cas ou reponse= non ou n, on retourne au menu précédent
		echo "Retour au menu des options du systeme"
		;;
		
		"2") 
		read -p "Voulez-vous vraiment redemarrer le systeme? (oui/non)": reponse
		while [ $reponse != "non" ] && [ $reponse != "n" ];
		do
			if [ $reponse = "oui" ] || [ $reponse = "o" ]
			then 
				echo "Le systeme est en cours de redemarrage..."
				sleep 3
				#Executer la commande de redemarrage du systeme
				sudo reboot
				exit 1
			else 
				echo "Erreur lors de la saisie"
				read -p "Voulez-vous vraiment redemarrer le systeme? (oui/non)": reponse
			fi
		done
		# Dans le cas ou reponse= non ou n, on retourne au menu précédent
		echo "Retour au menu des options du systeme"
		;;
		
		"3")
		echo "Verouillage du systeme en cours..."
		sleep 3
		loginctl lock-session
		exit 1
		;;
		
		"4")
		echo "Recherche des mises a jour disponibles..."
		sudo apt update
		echo "Liste des mises a jour disponibles:"
		apt list --upgradable
		read -p "Voulez-vous installer les mises a jour? (oui/non)": reponse
		while [ $reponse != "non" ] && [ $reponse != "n" ];
		do
			if [ $reponse = "oui" ] || [ $reponse = "o" ]
			then 
				#Executer la commande de mise à jour du systeme
				sudo apt upgrade -y
			else 
				echo "Erreur lors de la saisie"
				read -p "Voulez-vous installer les mises a jour? (oui/non)": reponse
			fi
		done
		# Dans le cas ou reponse= non ou n, on retourne au menu précédent
		echo "Retour au menu des options du systeme"
		;;
		
		"5")
		statut=0
		;;
		
	esac	
done
