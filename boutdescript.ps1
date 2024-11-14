# Fonction pour ajouter un utilisateur à un groupe
function GroupAdd {
    # Demander le nom du groupe
    $group = Read-Host "Dans quel groupe voulez-vous ajouter l'utilisateur ?"
    
    # Vérifier si le groupe existe
    if (Get-LocalGroup -Name $group -ErrorAction SilentlyContinue) {
        # Obtenir le nom de l'utilisateur actuel
        $username = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
        
        # Ajouter l'utilisateur au groupe
        try {
            Add-LocalGroupMember -Group $group -Member $username
            Write-Host "Ajout de $username au groupe $group réussi."
            
            # Vérifier si la fonction WriteLog est définie, puis appeler WriteLog si elle existe
            if (Get-Command -Name WriteLog -ErrorAction SilentlyContinue) {
                WriteLog "Ajout de $username au groupe $group"
            } else {
                Write-Host "Log non enregistré : la fonction WriteLog est introuvable."
            }
        } catch {
            Write-Host "Erreur lors de l'ajout de l'utilisateur au groupe : $_"
        }
    } else {
        Write-Host "Le groupe '$group' n'existe pas."
    }
}
