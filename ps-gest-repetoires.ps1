# MODULE GESTION DES REPERTOIRES



function dirCreation {

    $cheminActuel = Get-Location
    $userChoiceDirLocation = "" # Variable pour le choix d'emplacement
    Write-Host "`n<< CREER UN REPERTOIRE >>"
    Write-Host "Souhaitez-vous creer votre dossier dans le repertoire courant ($cheminActuel) ou dans un autre emplacement?"
    Write-Host "[1] Emplacement actuel"
    Write-Host "[2] Autre emplacement"
    Write-Host "[x] Retour au menu precedent"

    $userChoiceDirLocation = Read-Host

    while ($userChoiceDirLocation -ne "x") {
        if ($userChoiceDirLocation -eq "1") {
            $newDirectory = Read-Host "`nNom du repertoire :"
            if (-Not (Test-Path $newDirectory)) {
                New-Item -ItemType Directory -Name $newDirectory
                Write-Host "Repertoire $newDirectory cree"
            } else {
                Write-Host "`nCe repertoire existe deja"
            }
        } elseif ($userChoiceDirLocation -eq "2") {
            $newLocationDir = Read-Host "`nVeuillez saisir l'emplacement :"
            $newDirectory = Read-Host "`nNom du repertoire :"

            if (-Not (Test-Path $newLocationDir)) {
                Write-Host "Cet emplacement n'existe pas, creation du nouveau chemin"
                New-Item -ItemType Directory -Path "$newLocationDir\$newDirectory" -Force
                Write-Host "Repertoire cree à l'emplacement $newLocationDir\$newDirectory`n"
            } else {
                New-Item -ItemType Directory -Path "$newLocationDir\$newDirectory" -Force
                Write-Host "Repertoire cree à l'emplacement $newLocationDir\$newDirectory`n"
            }
        } else {
            Write-Host "Veuillez saisir une option valide`n"
        }

        # Relecture ici pour relancer la boucle
        Write-Host "`n<< CREER UN REPERTOIRE >>"
        Write-Host "Souhaitez-vous creer votre dossier dans le repertoire courant ($cheminActuel) ou dans un autre emplacement?"
        Write-Host "[1] Emplacement actuel"
        Write-Host "[2] Autre emplacement"
        Write-Host "[x] Retour au menu precedent"

        $userChoiceDirLocation = Read-Host
    }

}

function dirModification {

    Write-Host "`n<< MODIFIER UN REPERTOIRE >>"
    $userDirLocation = Read-Host "Entrez l'emplacement et le nom du répertoire à modifier (chemin complet) :"

    if (-Not (Test-Path $userDirLocation)) {
        Write-Host "`nL'emplacement du répertoire a modifier est introuvable"
    } else {
        $userDirPath = Split-Path $userDirLocation -Parent
        $userDirName = Split-Path $userDirLocation -Leaf
        $userModDir = Read-Host "`nVeuillez renommer le repertoire $userDirName situee dans $userDirPath :"

        if ([string]::IsNullOrEmpty($userModDir)) {
            Write-Host "`nIl ne peut y avoir de nom de répertoire vide"
        } else {
            Rename-Item -Path $userDirLocation -NewName "$userDirPath\$userModDir" -ErrorAction Stop
            Write-Host "`nLe dossier $userDirName a ete renomme en $userModDir"
        }
    }
}

function dirDeletion {
    
    Write-Host "`n<< SUPPRIMER UN REPERTOIRE >>"
    $userDirLocation = Read-Host "Entrez l'emplacement et le nom du repertoire a supprimer (chemin complet) :"

    if (-Not (Test-Path $userDirLocation)) {
        Write-Host "`nL'emplacement du repertoire a supprimer est introuvable"
    } else {
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


$userChoiceDir = ""

while ($userChoiceDir -ne "x") {
    Write-Host "`n------GESTION DES REPERTOIRES------"
    Write-Host "Choisir le chiffre correspondant a l'option:"
    Write-Host "[1] Creation de repertoire"
    Write-Host "[2] Modification de repertoire"
    Write-Host "[3] Suppression de repertoire"
    Write-Host "[x] Retour au menu precédent"

    $userChoiceDir = Read-Host

    switch ($userChoiceDir) {
        "1" { dirCreation }
        "2" { dirModification }
        "3" { dirDeletion }
        "x" { Write-Host "Retour dans le menu precedent" }
        default { Write-Host "`nVeuillez choisir une option valide`n" }
    }
}


