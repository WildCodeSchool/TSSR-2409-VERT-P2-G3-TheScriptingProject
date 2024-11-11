﻿# Script PowerShell pour gérer les utilisateurs sous Windows
# Quelques tests à finir + ajouter couleurs

# Fonction pour lister les utilisateurs locaux
function UsersList {
    $users = Get-LocalUser | Where-Object { $_.Name -notlike "Administrator" }
    $users | ForEach-Object { $_.Name }
}

# Fonction pour créer un utilisateur
function UsersCreate {
    $new_user = Read-Host "Entrez le nom du compte utilisateur à créer"
    try {
        New-LocalUser -Name $new_user -Password (Read-Host "Entrez un mot de passe pour le compte" -AsSecureString)
        Write-Host "Utilisateur $new_user créé avec succès."
    } catch {
        Write-Host "Erreur lors de la création de l'utilisateur."
    }
}

# Fonction pour modifier un mot de passe
function ChangePasswd {
    $users = UsersList
    Write-Host "Liste des utilisateurs :"
    $users | ForEach-Object { Write-Host $_ }
    $userpassw_change = Read-Host "Pour quel utilisateur voulez-vous modifier le mot de passe ?"
    if ($users -contains $userpassw_change) {
        $new_password = Read-Host "Entrez le nouveau mot de passe" -AsSecureString
        Set-LocalUser -Name $userpassw_change -Password $new_password
        Write-Host "Mot de passe modifié pour l'utilisateur $userpassw_change."
    } else {
        Write-Host "Utilisateur non trouvé."
    }
}

# Fonction pour supprimer un utilisateur
function UsersDelete {
    $users = UsersList
    Write-Host "Liste des utilisateurs :"
    $users | ForEach-Object { Write-Host $_ }
    $delete_user = Read-Host "Quel compte utilisateur voulez-vous supprimer ?"
    if ($users -contains $delete_user) {
        try {
            Remove-LocalUser -Name $delete_user
            Write-Host "Compte utilisateur $delete_user supprimé."
        } catch {
            Write-Host "Erreur lors de la suppression de l'utilisateur."
        }
    } else {
        Write-Host "Utilisateur non trouvé."
    }
}

# Fonction pour désactiver un utilisateur
function UsersDesactivate {
    $users = UsersList
    Write-Host "Liste des utilisateurs :"
    $users | ForEach-Object { Write-Host $_ }
    $desactivate_user = Read-Host "Quel compte utilisateur souhaitez-vous désactiver ?"
    if ($users -contains $desactivate_user) {
        Disable-LocalUser -Name $desactivate_user
        Write-Host "Compte utilisateur $desactivate_user désactivé."
    } else {
        Write-Host "Utilisateur non trouvé."
    }
}

# Menu principal avec boucle
while ($true) {
    Write-Host "Menu :"
    Write-Host "[1] Créer un compte utilisateur"
    Write-Host "[2] Modifier un mot de passe"
    Write-Host "[3] Supprimer un compte utilisateur"
    Write-Host "[4] Désactiver un compte utilisateur"
    Write-Host "[5] Retour au menu précédent"
    Write-Host "[x] Fin du script"
    
    $choix = Read-Host "Choisissez une option"
    
    switch ($choix) {
        "1" {
            UsersCreate
        
        }
        "2" {
            ChangePasswd
        }
        "3" {
            UsersDelete
        }
        "4" {
            Desactiver-Utilisateur
        }
        "5" {
            Write-Host "Retour au menu précédent"
            break
        }
        "x" {
            Write-Host "Fin du script"
            exit
        }
        default {
            Write-Host "Choix invalide, veuillez recommencer."
        }
    }
}