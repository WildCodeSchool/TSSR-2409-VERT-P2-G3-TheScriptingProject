# Creation des variables Couleurs
$Green = "Green"
$Yellow = "Yellow"
$White = "White"
$Red = "Red"
$Cyan= "Cyan"

$statut = $true

while ($statut) 
{
    Write-Host "`nMENU GESTION DU SYSTEME`n" -f $Green
    Write-Host "[1]" -f $Cyan -NoNewline ; Write-Host " Arreter le systeme" -f $White;
    Write-Host "[2]" -f $Cyan -NoNewline ; Write-Host " Redemarrer le systeme" -f $White;
    Write-Host "[3]" -f $Cyan -NoNewline ; Write-Host " Verrouiller le systeme" -f $White;
    Write-Host "[4]" -f $Cyan -NoNewline ; Write-Host " Mettre a jour le systeme" -f $White;
    Write-Host "[5]" -f $Cyan -NoNewline ; Write-Host " Retourner au menu principal`n" -f $White;
    $choix_option = Read-Host "Veuillez choisir une option"

    switch ($choix_option) 
	{
        
	"1" 
	{
            $reponse = Read-Host "`nVoulez-vous vraiment arreter le systeme? (oui/non)"
            while ($reponse -ne "non" -and $reponse -ne "n") 
            {
                if ($reponse -eq "oui" -or $reponse -eq "o") 
                {
                    Write-Host "`nLe systeme est en cours d'arret...`n"          
                    # Executer la commande d'arret du systeme
                    Stop-Computer -Force

                } 
                else 
                {
                    Write-Host -f $Red "`nErreur lors de la saisie"
                    $reponse = Read-Host "`nVoulez-vous vraiment arreter le systeme? (oui/non)"
                }
            }
            Write-Host "`nRetour au menu des options du systeme"
        }
		
        "2" 
	{
            $reponse = Read-Host "`nVoulez-vous vraiment redemarrer le systeme? (oui/non)"
            while ($reponse -ne "non" -and $reponse -ne "n") 
            {
                if ($reponse -eq "oui" -or $reponse -eq "o") 
                {
                    Write-Host "`nLe systeme est en cours de redemarrage..."
                    Start-Sleep -Seconds 3
                    # Executer la commande de redemarrage du systeme
                    Restart-Computer -Force
                } 
                else 
                {
                    Write-Host -f $Red "`nErreur lors de la saisie"
                    $reponse = Read-Host "`nVoulez-vous vraiment redemarrer le systeme? (oui/non)"
                }
            }
            Write-Host "`nRetour au menu des options du systeme"
        }
		
	"3" 
	{
            Write-Host "`nVerrouillage du systeme en cours..."
            # Utiliser psshutdown.exe pour verrouiller la session
            psshutdown /accepteula -l
        }
		
        "4" 
	{
            Write-Host "`nRecherche des mises a jour disponibles..."
	    Install-Module PSWindowsUpdate -Force -Scope CurrentUser
	    Write-Host "`nListe des mises a jour disponibles:"
            Get-WindowsUpdate
            $reponse = Read-Host "`nVoulez-vous installer les mises a jour? (oui/non)"
            while ($reponse -ne "non" -and $reponse -ne "n") 
            {
                if ($reponse -eq "oui" -or $reponse -eq "o") 
                {
                    # Executer la commande de mise a jour du systeme
                    Install-WindowsUpdate -AcceptAll -AutoReboot
                } 
                else 
                {
                    Write-Host -f $Red "`nErreur lors de la saisie"
                    $reponse = Read-Host "`nVoulez-vous installer les mises a jour? (oui/non)"
                }
            }
            Write-Host "`nRetour au menu des options du systeme"
        }
		
	"5" 
	{
            $statut = $false
        }
    }
}
