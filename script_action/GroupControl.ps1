# Script PowerShell pour gérer les utilisateurs sous Windows
# Quelques tests à finir + ajouter couleurs

# Creation des variables Couleurs
$Green = "Green"
$Yellow = "Yellow"
$White = "White"
$Red = "Red"
$Cyan= "Cyan"

# Fonction log
$Logfile = "C:\Windows\Temp\log-remote.log"
function WriteLog
{
Param ([string]$LogString)
$Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
$User = $env:USERNAME
$LogMessage = "$Stamp-$User-$LogString"
Add-content $LogFile -value $LogMessage
}

# log lancement du script
WriteLog "********StartScriptGroupControl********"
WriteLog "Navigation dans le menu de gestion des groupes"

# Fonction pour lister les groupes
function GroupsList {
    Get-LocalGroup | Select-Object -ExpandProperty Name
    WriteLog "Consultation de la liste des groupes"
}

# Fonction pour ajouter un utilisateur à un groupe
function GroupAdd {
    $group = Read-Host "Dans quel groupe voulez-vous ajouter l'utilisateur?"
    $username = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    Add-LocalGroupMember -Group $group -Member $username
    WriteLog "Ajout de $username au groupe $group"
}

# Fonction pour quitter un groupe
function GroupRemove {
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $currentGroup = (Get-LocalUser $currentUser).Group | Select-Object -First 1

    $response = Read-Host "Voulez-vous quitter votre groupe actuel ($currentGroup)? (oui ou non)"
    
    if ($response -eq "oui") {
        Remove-LocalGroupMember -Group $currentGroup -Member $currentUser
        Write-Host "Vous avez bien quitté votre groupe"
        WriteLog " L'utilisateur $currentUser a quitté le groupe $currentGroup"
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
            WriteLog "********EndScriptGroupControl********"
            break
        }
        "x" {
            Write-Host "Fin du script"
            WriteLog "********EndScriptGroupControl********"
            exit
        }
        default {
            Write-Host "Choix invalide, veuillez recommencer"
        }
    }
}
