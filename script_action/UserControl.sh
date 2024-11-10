#!/bin/bash
######################################################################################
# Script de création d'utilisateur
######################################################################################

# Définition des couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Aucune couleur

# Fonction pour afficher la liste de tous les utilisateurs
lister_utilisateurs() {
    echo -e "\n${CYAN}Liste des utilisateurs existants :${NC}"
    # On suppose que les utilisateurs humains ont des shells comme /bin/bash, /bin/zsh, etc.
    awk -F: '{ if ($7 == "/bin/bash" || $7 == "/bin/zsh") print $1 }' /etc/passwd
    echo -e "\n"
}

# choix des sections avec boucle while
while true; do
    echo -e "${GREEN}\n------ MENU COMPTE UTILISATEUR ------\n"
    echo -e "${CYAN}[1]${NC} Créer un compte utilisateur"
    echo -e "${CYAN}[2]${NC} Modifier un MDP"
    echo -e "${CYAN}[3]${NC} Supprimer un compte utilisateur"
    echo -e "${CYAN}[4]${NC} Désactiver un compte utilisateur"
    echo -e "${CYAN}[5]${NC} Retour au menu précédent\n"
    echo -e "Choisissez une option: "
    read choix
    
    # A chaque choix correspond une commande qui execute l'action demandée et boucle tant que l'utilisateur ne choisit pas quitter
    case $choix in
        1)
            lister_utilisateurs  # Afficher la liste de tous les utilisateurs avant de créer un nouvel utilisateur
            echo ""
            read -p "Quel est le nom du compte utilisateur à créer? " new_user
            sudo adduser $new_user
            ;;
        2)
            lister_utilisateurs  # Afficher la liste de tous les utilisateurs avant de modifier un mot de passe
            echo ""
            read -p "Le mdp de quel utilisateur voulez-vous modifier? " userpasswd_change
            sudo passwd $userpasswd_change
            ;;
        3)
            lister_utilisateurs  # Afficher la liste de tous les utilisateurs avant de supprimer un utilisateur
            echo ""
            read -p "Quel compte utilisateur voulez-vous supprimer? " delete_user
            sudo userdel $delete_user
            ;;
        4)
            lister_utilisateurs  # Afficher la liste de tous les utilisateurs avant de désactiver un utilisateur
            echo ""
            read -p "Quel compte utilisateur souhaitez-vous désactiver? " desactivate_user
            sudo chage -E 0 $desactivate_user
            ;;
        5) # Retour au menu précédent
            echo -e "\nRetour au menu précédent"
            break
            ;;
        *)  # Erreur
            echo -e "${RED}\nErreur: choix invalide, veuillez recommencer${NC}"
            ;;
    esac
done