#!/bin/bash


#couleur

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Aucune couleur




function showOsVersion {

    # filtre en conservant la première ligne du fichier os-release, puis sed s'occupe de traiter le texte d'affichage et supprime le texte corrsponsant à PRETTY_NAME et aux guillements

    grep '^PRETTY_NAME=' /etc/os-release | sed 's/^PRETTY_NAME="//;s/"$//'

}

function showNbDisks {

    # lsblk liste les périphériques de stockage, ces options ne retiennent que les disques en affichant le path complet sur lequel on applique un filtre pour ne conserver que les "disk", ensuite wc compte son apparition.
    lsblk -d -n -p | grep ' disk ' | wc -l
}

function showPartsByDisks {

    # même principe, mais le filtre conserve les partitions relatives au ou aux disque(s)
    lsblk -o NAME,SIZE,TYPE,MOUNTPOINT | grep -E 'disk|part'
}

function showInstalledAppPackages {

    echo -e " ${GREEN}<< AFFICHER DES EXECUTABLES >>${NC} \n \n Souhaitez-vous afficher les paquets installés ou les applications installées \n Choisir le chiffre correspondant à l'option: \n \n ${CYAN}[1]${NC} paquets installés \n ${CYAN}[2]${NC} applications installées \n ${CYAN}[3]${NC} Retour au menu précédent \n"

    read userChoiceInfoApp

    while [[ $userChoiceInfoApp != "3" ]]; do

        if [[ $userChoiceInfoApp == "1" ]]; then

            # liste uniquement les paquets installés en excluant ceux prêts à être désinstallés.
            dpkg --get-selections | grep -v deinstall
            if [[ $? = 0 ]]; then
                break
            else
                echo -e "une erreur est survenue"
                break
            fi

        elif [[ $userChoiceInfoApp == "2" ]]; then

            # liste les applications avec interface graphique (exécutables à destination d'utilisateur) tout en retirant la partie texte de l'extension de fichier .desktop
            ls /usr/share/applications/ | sed 's/\.desktop$//'
            if [[ $? = 0 ]]; then
                break
            else
                echo -e "une erreur est survenue"
                break
            fi

        else 
            echo -e "Veuillez saisir une option valide \n"

        fi
    done

}

function showRunningServices {

    # récupère la liste des type services, état en cours, désactive la pagination de sortie, quiet pour ne conserver que l'essentiel des lignes, plain pour enlever le formatage de sortie. Enfin awk ne conserve que la première colonne de sortie correspondant au nom dans les résultats de systemctl
    systemctl list-units --type=service --state=running --no-pager --quiet --plain | awk '{print $1}'

    #systemctl list-units --type=service --state=running
}

function showLocalUsers {

    # on récupère le champ 3 de la liste dans /etc/passwd, qui correspond à l'UID de l'utilisateur. Comme les utilisateurs dont l'UID est supérieur ou égal à 1000 ne sont pas des utilisateurs "système" mais plutôt ceux nécessitant d'ouvrir une session, ou en d'autres termes des humains, pour les distinguer d'une autre liste. En champ 6 on filtre ceux disposant d'un répertoire /home et on finit par récupérer uniquement le début de la ligne pour obtenir uniquement le nom de l'utilisateur. Le filtre de l'UID permet d'éviter d'obtenir des utilisateurs tels que "syslog" ou "cups-pk-helper" qui ne seraient pas pertinents.
    awk -F: '$3 >= 1000 && $6 ~ /^\/home/ {print $1}' /etc/passwd


}


userChoiceDir=""

while [[ $userChoiceDir != "x" ]]; do

    echo -e "\n ${GREEN}------INFORMATION SYSTEME------${NC} \n \n Choisir le chiffre correspondant à l'option: \n \n ${CYAN}[1]${NC} Afficher la version de l'OS \n ${CYAN}[2]${NC} Afficher le nombre de disques \n ${CYAN}[3]${NC} Afficher les partitions par disque \n ${CYAN}[4]${NC} Afficher la liste des applications/paquets installés \n ${CYAN}[5]${NC} Afficher la liste des services en cours d'exécution \n ${CYAN}[6]${NC} Afficher la liste des utilisateurs locaux \n ${CYAN}[7]${NC} Revenir au menu précédent" 
    read userChoiceDir

    case "$userChoiceDir" in 

        1)
            showOsVersion
            ;;
        2)
            showNbDisks
            ;;
        3)
            showPartsByDisks
            ;;
        4)
            showInstalledAppPackages
            ;;
        5)
            showRunningServices
            ;;
        6)
            showLocalUsers
            ;;
        7)
            echo "Retour au menu précédent"
            break
            ;;
        *)
            echo -e "\n Veuillez choisir une option valide \n"
            ;;
    esac
done
