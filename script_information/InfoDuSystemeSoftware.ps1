# MODULE INFO SYSTEME, STOCKAGE, SERVICE, UTILISATEURS

# Définition des couleurs avec ForegroundColor
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$CYAN = "Cyan"
$NC = "White" # Aucune couleur

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
WriteLog "********StartScriptInfoDuSystemeSoftware********"
WriteLog "Navigation dans le menu informations software du systeme"

# fonction récupération de la version du système d'exploitation
function showOsVersion {

    Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property Caption, Version, BuildNumber
     WriteLog "Consultation de la version du systeme d'exploitation"
}
# fonction de récupération du nombre de disques présents
function showNbDisks {

    Get-PhysicalDisk | Measure-Object | Select-Object -ExpandProperty Count
    WriteLog "Consultation du nombre de disques presents"

}

# fonction de récupération des partitions par disques présents
function showPartsByDisks {

    Get-Partition
    WriteLog "Consultation des partitions par disque"
}

# fonction de récupération des paquets ou des applications installés
function showInstalledAppPackages {

    WriteLog "Navigation dans le menu d'affichage des executables"
    Write-Host "<< AFFICHER DES EXECUTABLES >>" -f $GREEN
    Write-Host "`nSouhaitez-vous afficher les paquets installes ou les applications installees" -f $GREEN
    
    Write-Host "[1]" -f $CYAN -NoNewline; Write-Host "Paquets installes" -f $NC
    Write-Host "[2]" -f $CYAN -NoNewline; Write-Host "Applications installees" -f $NC
    Write-Host "[3]" -f $CYAN -NoNewline; Write-Host "Retour au menu precedent" -f $NC
    Write-Host "Choisir le chiffre correspondant à l'option:" -f $GREEN
    
    $userChoiceInfoApp = Read-Host

    while ($userChoiceInfoApp -ne "x") {
        
        if ($userChoiceInfoApp -eq "1") {
            # Liste uniquement les paquets installés
            Write-Host "Liste des paquets installes :"
            Get-Package
            WriteLog "Consultation de la liste des paquets installes"
            
        } elseif ($userChoiceInfoApp -eq "2") {
            # Liste les applications graphiques
            Write-Host "Liste des applications installees :"
            Get-StartApps | Select-Object Name
            WriteLog "Consultation de la liste des applications installees"
            
        } else {
            Write-Host "`nVeuillez saisir une option valide"
        }

        Write-Host "`nSouhaitez-vous afficher a nouveau les paquets ou applications ?" -f $GREEN
        Write-Host "[1]" -f $CYAN -NoNewline; Write-Host "Paquets installes" -f $NC
        Write-Host "[2]" -f $CYAN -NoNewline; Write-Host "Applications installees" -f $NC
        Write-Host "[3]" -f $CYAN -NoNewline; Write-Host "Retour au menu precedent" -f $NC
        
        $userChoiceInfoApp = Read-Host
    }

    Write-Host "Retour au menu precedent"
}

# fonction de récupération des services en cours
function showRunningServices {

    Get-Service | Where-Object { $_.Status -eq 'Running' } | Select-Object Name
    WriteLog "Consultation de la liste des services en cours d'execution"
}

# fonction de récupération des utilisateurs locaux
function showLocalUsers {

    $users = Get-LocalUser | Select-Object Name, Enabled, Description
    $users
    WriteLog "Consultation de la liste des utilisateurs locaux"
}

# menu de sélection des informations relatives à la couche OS - software

$userChoiceDir = ""

while ($userChoiceDir -ne "x") {
    Write-Host "`n------INFORMATIONS OS , DISKS, APP & LOCALUSERS------" -f $GREEN
    Write-Host "[1]" -f $CYAN -NoNewline; Write-Host "Afficher la version de l'OS" -f $NC
    Write-Host "[2]" -f $CYAN -NoNewline; Write-Host "Afficher le nombre de disques" -f $NC
    Write-Host "[3]" -f $CYAN -NoNewline; Write-Host "Afficher les partitions par disque" -f $NC
    Write-Host "[4]" -f $CYAN -NoNewline; Write-Host "Afficher la liste des applications/paquets installes" -f $NC
    Write-Host "[5]" -f $CYAN -NoNewline; Write-Host "Afficher la liste des services en cours d'execution" -f $NC
    Write-Host "[6]" -f $CYAN -NoNewline; Write-Host "Afficher la liste des utilisateurs locaux" -f $NC
    Write-Host "[7]" -f $CYAN -NoNewline; Write-Host "Retour au menu precedent" -f $NC
    Write-Host "Choisir le chiffre correspondant a l'option:" -f $GREEN
    $userChoiceDir = Read-Host

    switch ($userChoiceDir) {
        "1" { showOsVersion }
        "2" { showNbDisks }
        "3" { showPartsByDisks }
        "4" { showInstalledAppPackages }
        "5" { showRunningServices }
        "6" { showLocalUsers
            Write-Host "`nAppuyez sur [Entrée] pour afficher la liste d'utilisateurs..."
            Read-Host         
            }
        "7" { Write-Host "Retour au menu precedent"; WriteLog "********EndScriptInfoDuSystemeSoftware********" }
        default { Write-Host "`nVeuillez choisir une option valide`n" }
    }
}
