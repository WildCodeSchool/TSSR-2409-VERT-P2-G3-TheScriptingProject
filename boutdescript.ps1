function GroupRemove {
    # Obtenir l'utilisateur actuel
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    
    # Vérifier les groupes auxquels appartient l'utilisateur actuel
    $currentGroups = Get-LocalGroup | ForEach-Object {
        if (Get-LocalGroupMember -Group $_.Name -Member $currentUser -ErrorAction SilentlyContinue) {
            $_.Name
        }
    }
    
    # Sélectionner le premier groupe (ou spécifier le groupe cible si nécessaire)
    $currentGroup = $currentGroups | Select-Object -First 1

    if (-not $currentGroup) {
        Write-Host "Vous n'appartenez à aucun groupe local."
        return
    }

    # Demander confirmation à l'utilisateur pour quitter le groupe
    $response = Read-Host "Voulez-vous quitter votre groupe actuel ($currentGroup)? (oui ou non)"
    
    if ($response -eq "oui") {
        # Retirer l'utilisateur du groupe
        Remove-LocalGroupMember -Group $currentGroup -Member $currentUser
        Write-Host "Vous avez bien quitté votre groupe"
        
        # Vérifier si WriteLog est défini avant de l'appeler
        if (Get-Command -Name WriteLog -ErrorAction SilentlyContinue) {
            WriteLog "L'utilisateur $currentUser a quitté le groupe $currentGroup"
        } else {
            Write-Host "Log non enregistré : la fonction WriteLog est introuvable."
        }
    } else {
        Write-Host "Vous restez dans votre groupe actuel"
    }
}
