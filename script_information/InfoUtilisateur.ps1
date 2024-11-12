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


$statut = $true

while ($statut) 
{
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
        
		"1" 
		{
			Write-Host "`nDate de derniere connexion :"	
			$lastLogin = (Get-LocalUser -Name $user).LastLogon
            if ($lastLogin) 
			{
                Write-Host $lastLogin
            } 
			else
			{
                Write-Host "Aucune connexion enregistrée pour cet utilisateur."
            }
		}
		
        "2" 
		{
			Write-Host "`nDate de derniere modification du mot de passe :"
			 $passwordLastSet = (Get-LocalUser -Name $user).PasswordLastSet
            if ($passwordLastSet) 
			{
                Write-Host $passwordLastSet
            } 
			else
			{
                Write-Host "Date de dernière modification du mot de passe non disponible."
            }
		}
		
		"3" 
		{
			Write-Host "`nSessions ouvertes par l'utilisateur :"
			$sessions = query user | Select-String $user
            if ($sessions) 
			{
                $sessions | ForEach-Object { Write-Host $_ }
            } 
			else 
			{
                Write-Host "Aucune session ouverte pour cet utilisateur."
            }
		}

		"4"
		{
			Write-Host "`nGroupes d'appartenance :"
			$groups = Get-LocalGroup | Where-Object {(Get-LocalGroupMember -Group $_.Name -ErrorAction SilentlyContinue) -contains $user} | Select-Object -ExpandProperty Name

			if ($groups) 
			{
				$groups -join ", " | Write-Host
			} 
			else 
			{
				Write-Host "Aucun groupe trouve pour cet utilisateur."	
			}
		}

		"5" 
		{
			Write-Host "`nHistorique des commandes :"
			#L'historique des commandes est stocké dans un fichier, par exemple : C:\Users\<NomUtilisateur>\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
			$historyPath = "C:\Users\$user\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt"
			if (Test-Path $historyPath) 
			{
            Get-Content $historyPath 
			} 
			else 
			{
            Write-Host "Aucun historique des commandes trouve pour l'utilisateur."
			}
		}
		
		"6" 
		{
			Write-Host "`nDroits sur le dossier :"
			$folderPath = Read-Host "Entrez le chemin du dossier"
			Get-Acl -Path $folderPath | ForEach-Object { $_.Access | Where-Object { $_.IdentityReference -match $user } }
		}
		
		"7" 
		{
			Write-Host "`nDroits sur le fichier :"
			$filePath = Read-Host "Entrez le chemin du fichier"
			Get-Acl -Path $filePath | ForEach-Object { $_.Access | Where-Object { $_.IdentityReference -match $user } }
		}
		
		"8" 
		{
			$statut = $false
		}
	}
}		