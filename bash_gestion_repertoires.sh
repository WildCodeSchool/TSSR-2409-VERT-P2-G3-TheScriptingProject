#!/bin/bash

# MODULE GESTION DES REPERTOIRES

#couleur

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # Aucune couleur


function dirCreation()
{
    cheminActuel=$PWD
    userChoiceDirLocation="" # la variable qui stocke le choix d'emplacement de l'utilisateur
    echo -e " ${GREEN}<< CREER UN REPERTOIRE >>${NC} \n \n Souhaitez-vous créer votre dossier dans le répertoire courant ($cheminActuel) ou dans un autre emplacemcent? \n Choisir le chiffre correspondant à l'option: \n \n ${RED}[1]${NC} Emplacement actuel \n ${RED}[2]${NC} Autre emplacement \n ${RED}[x]${NC} Retour au menu précédent \n"



    read userChoiceDirLocation

    while [[ $userChoiceDirLocation != "x" ]]; do


        if [[ $userChoiceDirLocation == 1 ]]; then
            echo -e "\n Nom du répertoire :"
            read newDirectory
            if [[ ! -d $newDirectory ]]; then
                mkdir "$newDirectory"
                echo "Répertoire $newDirectory créé"
            else 
                echo -e "\n Ce répertoire existe déjà"
            fi

        elif [[ $userChoiceDirLocation == 2 ]]; then
            echo -e "\n Veuillez saisir l'emplacement :"
            read newLocationDir
            echo -e " \n Nom du répertoire :"
            read newDirectory

            # vérification de l'existence de l'emplacement nouvellement saisi. 
            if [[ ! -d $newLocationDir ]]; then
                echo -e "Cet emplacement n'existe pas, création du nouveau chemin"
                mkdir -p "$newLocationDir"/"$newDirectory"
                if [[ $? = 0 ]];then 
                    echo -e "répertoire créé à l'emplacement $newLocationDir/$newDirectory \n"
                else
                    echo "erreur lors de la création"
                fi

            else
                mkdir -p "$newLocationDir"/"$newDirectory"
                if [[ $? = 0 ]];then 
                    echo "répertoire créé à l'emplacement $newLocationDir/$newDirectory \n"
                else
                    echo "erreur lors de la création"
                fi

            fi
            
        else 
            echo -e "Veuillez saisir une option valide \n"

        fi

        # Relecture ici pour relancer la boucle
        echo -e " ${GREEN}<< CREER UN REPERTOIRE >>${NC} \n \n Souhaitez-vous créer votre dossier dans le répertoire courant ($cheminActuel) ou dans un autre emplacemcent? \n Choisir le chiffre correspondant à l'option: \n \n ${RED}[1]${NC} Emplacement actuel \n ${RED}[2]${NC} Autre emplacement \n ${RED}[x]${NC} Retour au menu précédent \n"

        read userChoiceDirLocation

    done
}

function dirModification()
{


    echo -e " ${GREEN}<< MODIFIER UN REPERTOIRE >>${NC} \n \n Entrez l'emplacemcent et le nom du répertoire que vous souhaitez modifier (chemin de destination complet) :"
    read userDirLocation
    if [[ ! -d "$userDirLocation" ]]; then
        echo -e " \n L'emplacement du répertoire à modifier est introuvable"
    else
        userDirPath=$(dirname "$userDirLocation")
        userDirName=$(basename "$userDirLocation")
        echo -e "\n Veuillez renommer le répertoire $userDirName situé dans $userDirPath : "
        read userModDir
        if [[ -z "$userModDir" ]]; then
            echo -e "\n Il ne peut y avoir de nom de répertoire vide"
        else
            if mv "$userDirLocation" "$userDirPath"/"$userModDir"; then
                echo -e "\n Le dossier $userDirName a été renommé $userModDir"
            else
                echo -e "\n Une erreur est survenue à la modification du répertoire"
            fi
        fi
    fi


}

function dirDeletion()
{
    echo -e " ${GREEN}<< SUPPRIMER UN REPERTOIRE >>${NC} \n \n Entrez l'emplacemcent et le nom du répertoire que vous souhaitez supprimer (chemin de destination complet) :"
    read userDirLocation
    if [[ ! -d "$userDirLocation" ]]; then
        echo -e " \n L'emplacement du répertoire à supprimer est introuvable"
    else
        userDirName=$(basename "$userDirLocation")
        echo -e " \n Voulez-vous vraiment supprimer $userDirName ? yes/no"
        read shortAnswer
        if [[ "$shortAnswer" == "yes" || "$shortAnswer" == "y" ]]; then
            rm -r "$userDirLocation"
            if [[ $? != 0 ]]; then
                echo -e "\n Erreur - La suppression n'a pas eu lieu"
            else 
                echo -e " \n $userDirName a été supprimé"
            fi
        else 
            echo -e "\n retour au menu précédent"
        fi
    fi
}    

# function BackTo()
#{
#    echo "Retour"
#}

userChoiceDir=""

while [[ $userChoiceDir != "x" ]]; do

    echo -e "\n ${GREEN}------GESTION DES REPERTOIRES------${NC} \n \n Choisir le chiffre correspondant à l'option: \n \n ${RED}[1]${NC} Création de répertoire \n ${RED}[2]${NC} Modification de répertoire \n ${RED}[3]${NC} Suppression de répertoire \n ${RED}[x]${NC} Retour au menu précédent" 
    read userChoiceDir

    case "$userChoiceDir" in 

        1)
            dirCreation
            ;;
        2)
            dirModification
            ;;
        3)
            dirDeletion
            ;;
        x)
            echo "Retour dans le menu précédent"
            ;;
        *)
            echo -e "\n Veuillez choisir une option valide \n"
            ;;
    esac
done
