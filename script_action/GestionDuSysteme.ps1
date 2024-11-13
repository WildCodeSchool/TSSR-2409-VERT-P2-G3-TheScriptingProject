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

$statut = $true

# log lancement du script
WriteLog "********StartScriptGestionDuSysteme********"

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
            WriteLog "Action d'arret du systeme"
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
            WriteLog "Action de redemarrer du systeme"
	    $reponse = Read-Host "`nVoulez-vous vraiment redemarrer le systeme? (oui/non)"
            while ($reponse -ne "non" -and $reponse -ne "n") 
            {
                if ($reponse -eq "oui" -or $reponse -eq "o") 
                {
                    Write-Host "`nLe systeme est en cours de redemarrage..."
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
            WriteLog "Action de verrouillage du systeme"
            Write-Host "`nFonctionnalite en cours de developpement" -f $Yellow
            #Write-Host "`nVerrouillage du systeme en cours..."
            # Utiliser psshutdown.exe pour verrouiller la session           
            #psshutdown /accepteula -l
        }
		
        "4" 
	{
            WriteLog "Action de recherche de mises a jour"
	    Write-Host "`nRecherche des mises a jour disponibles..."
	    Install-Module PSWindowsUpdate -Force -Scope CurrentUser
	    Write-Host "`nListe des mises a jour disponibles:"
            Get-WindowsUpdate
            $reponse = Read-Host "`nVoulez-vous installer les mises a jour? (oui/non)"
            while ($reponse -ne "non" -and $reponse -ne "n") 
            {
                if ($reponse -eq "oui" -or $reponse -eq "o") 
                {
                    WriteLog "Installation des mises a jour"
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
            WriteLog "********EndScriptGestionDuSysteme********"
	    $statut = $false
        }
    }
}
