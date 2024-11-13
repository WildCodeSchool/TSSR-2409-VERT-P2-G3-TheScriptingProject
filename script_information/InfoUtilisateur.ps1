# Creation des variables Couleurs
$Green = "Green"
$Yellow = "Yellow"
$White = "White"
$Red = "Red"
$Cyan= "Cyan"

# Demande le nom de l'utilisateur
$user = Read-Host -Prompt "Entrez le nom de l'utilisateur"

# Vérifie qu'un nom d'utilisateur a été fourni
if (-not $user) 
{
    Write-Host "Vous devez entrer un nom d'utilisateur."
    exit
}

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
WriteLog "********StartScriptInfoUtilisateur********"

$statut = $true

while ($statut) 
{
    WriteLog "Navigation dans le menu informations de $User"
    Write-Host "`nMENU INFORMATIONS UTILISATEUR`n" -f $Green
    Write-Host "[1]" -f $Cyan -NoNewline ; Write-Host " Date de derniere connexion" -f $White;
    Write-Host "[2]" -f $Cyan -NoNewline ; Write-Host " Date de derniere modification du mot de passe" -f $White;
    Write-Host "[3]" -f $Cyan -NoNewline ; Write-Host " Liste des sessions ouvertes" -f $White;
    Write-Host "[4]" -f $Cyan -NoNewline ; Write-Host " Groupes d'appartenance" -f $White;
    Write-Host "[5]" -f $Cyan -NoNewline ; Write-Host " Historique des commandes" -f $White;
    Write-Host "[6]" -f $Cyan -NoNewline ; Write-Host " Droits sur un dossier" -f $White;
    Write-Host "[7]" -f $Cyan -NoNewline ; Write-Host " Droits sur un fichier" -f $White;
    Write-Host "[8]" -f $Cyan -NoNewline ; Write-Host " Retour au menu precedent`n" -f $White;
    $choix_option = Read-Host "Veuillez choisir une option"

 switch ($choix_option) 
 {	
        
	1" 
	{
 	    WriteLog "Consultation de la date de dernier connexion de $User"
	    Write-Host "`nDate de derniere connexion :"	
	    $lastLogin = (Get-LocalUser -Name $user).LastLogon
            if ($lastLogin) 
	    {
                Write-Host $lastLogin
            } 
	    else
	    {
                Write-Host "Aucune connexion enregistrée pour cet utilisateur"
            }
	}
		
        "2" 
	{
 	    WriteLog "Consultation de la date de derniere modification du mot de passe de $User"
	    Write-Host "`nDate de derniere modification du mot de passe :"
	    $passwordLastSet = (Get-LocalUser -Name $user).PasswordLastSet
            if ($passwordLastSet) 
	    {
                Write-Host $passwordLastSet
            } 
	    else
	    {
                Write-Host "`nDate de dernière modification du mot de passe non disponible"
            }
	}
		
	"3" 
	{
 	    WriteLog "Consultation des sessions ouvertes par $User"
	    Write-Host "`nSessions ouvertes par l'utilisateur :"
	    $sessions = query user | Select-String $user
            if ($sessions) 
	    {
                $sessions | ForEach-Object { Write-Host $_ }
            } 
	    else 
	    {
                Write-Host "`nAucune session ouverte pour cet utilisateur"
            }
	}

	"4"
	{
		WriteLog "Consultation des groupes d'appartenance de $user"
		Write-Host "`nGroupes d'appartenance de $user :"
		$groups = Get-LocalGroup | Where-Object {
   		(Get-LocalGroupMember -Group $_.Name | Where-Object { $_.Name -like "*$user" })
		} | Select-Object -ExpandProperty Name

		if ($groups) 
		{
			$groups -join ", " | Write-Host
		} 
		else 
		{
			Write-Host "Aucun groupe trouvé pour l'utilisateur $user"
		}
	}

	"5" 
	{
 		WriteLog "Consultation de l'historique des commandes de $User"
		Write-Host "`nHistorique des commandes hors script:"
		#L'historique des commandes est stocké dans un fichier, par exemple : C:\Users\<NomUtilisateur>\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
		$historyPath = "C:\Users\$user\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt"
		if (Test-Path $historyPath) 
		{
            		Get-Content $historyPath 
	      		Write-Host "`nEn cours de developpement: Historique Complete des commandes" -f $Yellow
		} 
		else 
		{
         		Write-Host "`nAucun historique des commandes trouve pour l'utilisateur"
		}
	}
		
	6" 
	{
		$folderPath = Read-Host "`nEntrez le chemin du dossier"
		Write-Host "`nDroits sur le dossier :`n"
		Get-Acl -Path $folderPath | ForEach-Object { $_.Access | Where-Object { $_.IdentityReference -match $user } }
		WriteLog "Consultation des Droits de $User sur le dossier $folderPath"
	}
		
	"7" 
	{
		$filePath = Read-Host "`nEntrez le chemin du fichier"
		Write-Host "`nDroits sur le fichier :`n"
		Get-Acl -Path $filePath | ForEach-Object { $_.Access | Where-Object { $_.IdentityReference -match $user } }
		WriteLog "Consultation des Droits de $User sur le fichier $filePath"
	}
		
	"8" 
	{
		WriteLog "********EndScriptInfoUtilisateur********"
  		$statut = $false
	}
    }	
}		