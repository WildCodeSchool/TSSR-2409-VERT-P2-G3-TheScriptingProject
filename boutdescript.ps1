function UsersDesactivate {
    # Obtenir la liste des utilisateurs locaux
    $users = Get-LocalUser | Select-Object -ExpandProperty Name
    Write-Host "Liste des utilisateurs :"
    
    # Afficher chaque utilisateur
    $users | ForEach-Object { Write-Host $_ }
    
    # Demander à l'utilisateur quel compte désactiver
    $desactivate_user = Read-Host "Quel compte utilisateur souhaitez-vous désactiver ?"
    
    # Vérifier si le compte existe et désactiver l'utilisateur
    if ($users -contains $desactivate_user) {
        Disable-LocalUser -Name $desactivate_user
        Write-Host "Compte utilisateur $desactivate_user désactivé."
    } else {
        Write-Host "Utilisateur non trouvé."
    }
}
