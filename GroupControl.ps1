# Script PowerShell pour gérer les utilisateurs sous Windows
# Quelques tests à finir + ajouter couleurs

# Fonction pour lister les groupes
function GroupsList {
    Get-LocalGroup | Select-Object -ExpandProperty Name
}

# Fonction pour ajouter un utilisateur à un groupe
function GroupAdd {
    $group = Read-Host "Dans quel groupe voulez-vous ajouter l'utilisateur?"
    $username = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    Add-LocalGroupMember -Group $group -Member $username
}

# Fonction pour quitter un groupe
function GroupRemove {
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $currentGroup = (Get-LocalUser $currentUser).Group | Select-Object -First 1

    $response = Read-Host "Voulez-vous quitter votre groupe actuel ($currentGroup)? (oui ou non)"
    
    if ($response -eq "oui") {
        Remove-LocalGroupMember -Group $currentGroup -Member $currentUser
        Write-Host "Vous avez bien quitté votre groupe"
    } else {
        Write-Host "Vous restez dans votre groupe actuel"
    }
}

# Boucle du menu
while ($true) {
    Write-Host "Menu:"
    Write-Host "[1] Ajouter à un groupe"
    Write-Host "[2] Quitter le groupe"
    Write-Host "[3] Retour au menu précédent"
    Write-Host "[x] Fin du script"
    
    $choix = Read-Host "Choisissez une option"

    switch ($choix) {
        "1" {
            Write-Host "Liste des groupes :"
            GroupsList
            GroupAdd
        }
        "2" {
            GroupRemove
        }
        "3" {
            Write-Host "Retour au menu précédent"
            break
        }
        "x" {
            Write-Host "Fin du script"
            exit
        }
        default {
            Write-Host "Choix invalide, veuillez recommencer"
        }
    }
}