# Creation des variables Couleurs
$Green = "Green"
$Yellow = "Yellow"
$White = "White"
$Red = "Red"

$statut = $true

while ($statut) 
{
    Write-Host "MENU GESTION DU SYSTEME" -f $Green
    Write-Host "[1]" -f $Yellow -NoNewline ; Write-Host " Arreter le systeme" -f $White;
    Write-Host "[2]" -f $Yellow -NoNewline ; Write-Host " Redemarrer le systeme" -f $White;
    Write-Host "[3]" -f $Yellow -NoNewline ; Write-Host " Verrouiller le systeme" -f $White;
    Write-Host "[4]" -f $Yellow -NoNewline ; Write-Host " Mettre a jour le systeme" -f $White;
    Write-Host "[5]" -f $Yellow -NoNewline ; Write-Host " Retourner au menu principal" -f $White;
    Write-Host "[X]" -f $Yellow -NoNewline ; Write-Host "Quitter" -f $White;
    $choix_option = Read-Host "Veuillez choisir une option"

    switch ($choix_option) 
	{
        
		"1" 
		{
            $reponse = Read-Host "Voulez-vous vraiment arreter le systeme? (oui/non)"
            while ($reponse -ne "non" -and $reponse -ne "n") 
            {
                if ($reponse -eq "oui" -or $reponse -eq "o") 
                {
                    Write-Host "Le systeme est en cours d'arret..."
                    Start-Sleep -Seconds 3
                    # Executer la commande d'arret du systeme
                    Stop-Computer -Force
                } 
                else 
                {
                    Write-Host -f $Red "Erreur lors de la saisie"
                    $reponse = Read-Host "Voulez-vous vraiment arreter le systeme? (oui/non)"
                }
            }
            Write-Host "Retour au menu des options du systeme"
        }
		
        "2" 
		{
            $reponse = Read-Host "Voulez-vous vraiment redemarrer le systeme? (oui/non)"
            while ($reponse -ne "non" -and $reponse -ne "n") 
            {
                if ($reponse -eq "oui" -or $reponse -eq "o") 
                {
                    Write-Host "Le systeme est en cours de redemarrage..."
                    Start-Sleep -Seconds 3
                    # Executer la commande de redemarrage du systeme
                    Restart-Computer -Force
                } 
                else 
                {
                    Write-Host -f $Red "Erreur lors de la saisie"
                    $reponse = Read-Host "Voulez-vous vraiment redemarrer le systeme? (oui/non)"
                }
            }
            Write-Host "Retour au menu des options du systeme"
        }
		
		"3" 
		{
            Write-Host "Verrouillage du systeme en cours..."
            Start-Sleep -Seconds 3
            # Executer la commande de verrouillage
            rundll32.exe user32.dll,LockWorkStation
        }
		
        "4" 
		{
            Write-Host "Recherche des mises a jour disponibles..."
			Install-Module PSWindowsUpdate -Force -Scope CurrentUser
			Write-Host "Liste des mises a jour disponibles:"
            Get-WindowsUpdate
            $reponse = Read-Host "Voulez-vous installer les mises a jour? (oui/non)"
            while ($reponse -ne "non" -and $reponse -ne "n") 
            {
                if ($reponse -eq "oui" -or $reponse -eq "o") 
                {
                    # Executer la commande de mise a jour du systeme
                    Install-WindowsUpdate -AcceptAll -AutoReboot
                } 
                else 
                {
                    Write-Host -f $Red "Erreur lors de la saisie"
                    $reponse = Read-Host "Voulez-vous installer les mises a jour? (oui/non)"
                }
            }
            Write-Host "Retour au menu des options du systeme"
        }
		
		"5" 
		{
            $statut = $false
        }
		
		"X" 
		{
			exit 0
		}
    }
}
