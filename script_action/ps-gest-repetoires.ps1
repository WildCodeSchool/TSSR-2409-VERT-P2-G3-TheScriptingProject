# MODULE GESTION DES REPERTOIRES

# Définition des couleurs avec ForegroundColor
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$NC = "White" # Aucune couleur


# fonction de création de répertoires
function dirCreation {

    $cheminActuel = Get-Location
    $userChoiceDirLocation = "" # Variable pour le choix d'emplacement
    Write-Host "`n<< CREER UN REPERTOIRE >>" -f $GREEN
    Write-Host "`nSouhaitez-vous creer votre dossier dans le repertoire courant ($cheminActuel) ou dans un autre emplacement?" -f $GREEN
    Write-Host "[1]" -f $YELLOW -NoNewline; Write-Host "Emplacement actuel" -f $NC
    Write-Host "[2]" -f $YELLOW -NoNewline; Write-Host "Autre emplacement" -f $NC
    Write-Host "[3]" -f $YELLOW -NoNewline; Write-Host "Retour au menu precedent" -f $NC
    Write-Host "`nChoisir le chiffre correspondant à l'option :" -f $GREEN

    $userChoiceDirLocation = Read-Host

    # tant que l'option 3 n'est pas choisie, proposer les options

    while ($userChoiceDirLocation -ne "3") {
        if ($userChoiceDirLocation -eq "1") {
            $newDirectory = Read-Host "`nNom du repertoire :"
            # si le répertoire n'existe pas encore dans le dossier courant, on crée le répertoire
            if (-Not (Test-Path $newDirectory)) {
                New-Item -ItemType Directory -Name $newDirectory
                Write-Host "Repertoire $newDirectory cree"
            } else {
                Write-Host "`nCe repertoire existe deja"
            }
        } elseif ($userChoiceDirLocation -eq "2") {
            $newLocationDir = Read-Host "`nVeuillez saisir l'emplacement :"
            $newDirectory = Read-Host "`nNom du repertoire :"

            # vérifie si le chemin de l'emplacement est valide, et si non, création des répertoires intermédiaires
            if (-Not (Test-Path $newLocationDir)) {
                Write-Host "Cet emplacement n'existe pas, creation du nouveau chemin"
                New-Item -ItemType Directory -Path "$newLocationDir\$newDirectory" -Force
                Write-Host "Repertoire cree à l'emplacement $newLocationDir\$newDirectory`n"
            # dans le cas où l'emplacement existe, création du nouveau répertoire
            } else {
                New-Item -ItemType Directory -Path "$newLocationDir\$newDirectory" -Force
                Write-Host "Repertoire cree à l'emplacement $newLocationDir\$newDirectory`n"
            }
        } else {
            Write-Host "Veuillez saisir une option valide`n"
        }

        # Relecture ici pour relancer la boucle
        Write-Host "`n<< CREER UN REPERTOIRE >>" -f $GREEN
        Write-Host "`nSouhaitez-vous creer votre dossier dans le repertoire courant ($cheminActuel) ou dans un autre emplacement?" -f $GREEN
        Write-Host "[1]" -f $YELLOW -NoNewline; Write-Host "Emplacement actuel" -f $NC
        Write-Host "[2]" -f $YELLOW -NoNewline; Write-Host "Autre emplacement" -f $NC
        Write-Host "[3]" -f $YELLOW -NoNewline; Write-Host "Retour au menu precedent" -f $NC
        Write-Host "`nChoisir le chiffre correspondant à l'option :" -f $GREEN

        $userChoiceDirLocation = Read-Host
    }

}

# fonction de modification des répertoires
function dirModification {

    Write-Host "`n<< MODIFIER UN REPERTOIRE >>" -f $GREEN
    $userDirLocation = Read-Host "`nEntrez l'emplacement et le nom du repertoire a modifier (chemin complet) :"

    # vérification de l'existence de l'emplacement/du répertoire
    if (-Not (Test-Path $userDirLocation)) {
        Write-Host "`nL'emplacement du repertoire a modifier est introuvable"
    } else {
        # récupération en deux variables, emplacement et nom du répertoire et récupération du nouveau nom dans une nouvelle variable
        $userDirPath = Split-Path $userDirLocation -Parent
        $userDirName = Split-Path $userDirLocation -Leaf
        $userModDir = Read-Host "`nVeuillez renommer le repertoire $userDirName situee dans $userDirPath :"

        # vérification si l'entrée utilisateur est vide
        if ([string]::IsNullOrEmpty($userModDir)) {
            Write-Host "`nIl ne peut y avoir de nom de repertoire vide"
        } else {
            Rename-Item -Path $userDirLocation -NewName "$userDirPath\$userModDir" -ErrorAction Stop
            Write-Host "`nLe dossier $userDirName a ete renomme en $userModDir"
        }
    }
}


# fonction de suppression des répertoires
function dirDeletion {
    
    Write-Host "`n<< SUPPRIMER UN REPERTOIRE >>" -f $GREEN
    $userDirLocation = Read-Host "`nEntrez l'emplacement et le nom du repertoire a supprimer (chemin complet) :"

    # vérification de l'existence du répertoire
    if (-Not (Test-Path $userDirLocation)) {
        Write-Host "`nL'emplacement du repertoire a supprimer est introuvable"
    } else {
        # confirmation avant choix de suppression. Ici on récupère le nom du répertoire depuis le chemin complet.
        $userDirName = Split-Path $userDirLocation -Leaf
        $shortAnswer = Read-Host "`nVoulez-vous vraiment supprimer $userDirName ? yes/no"

        if ($shortAnswer -eq "yes" -or $shortAnswer -eq "y") {
            Remove-Item -Path $userDirLocation -Recurse -Force -ErrorAction Stop
            Write-Host "`n$userDirName a ete supprime"
        } else {
            Write-Host "`nRetour au menu precedent"
        }
    }
}

# Options de gestion de répertoires
# tant que l'option 4 n'est pas choisie, proposer les options

$userChoiceDir = ""

while ($userChoiceDir -ne "4") {
    Write-Host "`n------GESTION DES REPERTOIRES------" -f $GREEN
    Write-Host "`n[1]" -f $YELLOW -NoNewline; Write-Host " Creation de repertoire" -f $NC
    Write-Host "[2]" -f $YELLOW -NoNewline; Write-Host " Modification de repertoire" -f $NC
    Write-Host "[3]" -f $YELLOW -NoNewline; Write-Host " Suppression de repertoire" -f $NC
    Write-Host "[4]" -f $YELLOW -NoNewline; Write-Host " Retour au menu precédent" -f $NC
    Write-Host "`nChoisir le chiffre correspondant a l'option:" -f $GREEN

    $userChoiceDir = Read-Host

    # appel des fonctions en fonction des options choisies
    switch ($userChoiceDir) {
        "1" { dirCreation }
        "2" { dirModification }
        "3" { dirDeletion }
        "4" { Write-Host "Retour dans le menu precedent" }
        default { Write-Host "`nVeuillez choisir une option valide`n" }
    }
}


