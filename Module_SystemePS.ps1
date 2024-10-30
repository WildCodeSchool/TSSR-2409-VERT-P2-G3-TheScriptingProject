$statut = $true

while ($statut) 
{
    Write-Host "MENU GESTION DU SYSTEME"
    Write-Host "1- Arreter le systeme"
    Write-Host "2- Redemarrer le systeme"
    Write-Host "3- Verrouiller le systeme"
    Write-Host "4- Mettre à jour le systeme"
    Write-Host "5- Retourner au menu principal"
    $choix_option = Read-Host "Veuillez choisir une option"

    switch ($choix_option) 
    {
        
	"1" {
            $reponse = Read-Host "Voulez-vous vraiment arreter le systeme? (oui/non)"
            while ($reponse -ne "non" -and $reponse -ne "n") 
	    {
                if ($reponse -eq "oui" -or $reponse -eq "o") 
		{
                    Write-Host "Le systeme est en cours d'arret..."
                    Start-Sleep -Seconds 3
                    # Executer la commande d'arrêt du systeme
                    Stop-Computer -Force
                } 
		else 
  		{
                    Write-Host "Erreur lors de la saisie"
                    $reponse = Read-Host "Voulez-vous vraiment arreter le systeme? (oui/non)"
                }
            }
            Write-Host "Retour au menu des options du systeme"
        }
		
        "2" {
            $reponse = Read-Host "Voulez-vous vraiment redémarrer le systeme? (oui/non)"
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
                    Write-Host "Erreur lors de la saisie"
                    $reponse = Read-Host "Voulez-vous vraiment redemarrer le systeme? (oui/non)"
                }
            }
            Write-Host "Retour au menu des options du systeme"
        }
		
	"3" {
            Write-Host "Verrouillage du systeme en cours..."
            Start-Sleep -Seconds 3
            # Executer la commande de verrouillage
            rundll32.exe user32.dll,LockWorkStation
        }
		
        "4" {
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
                    Write-Host "Erreur lors de la saisie"
                    $reponse = Read-Host "Voulez-vous installer les mises a jour? (oui/non)"
                }
            }
            Write-Host "Retour au menu des options du systeme"
        }
		
	"5" {
            $statut = $false
        }
    }
}
