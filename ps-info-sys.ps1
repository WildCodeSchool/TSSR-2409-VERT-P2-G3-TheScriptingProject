# MODULE INFO SYSTEME, STOCKAGE, SERVICE, UTILISATEURS


function showOsVersion {

    Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property Caption, Version, BuildNumber

}

function showNbDisks {

    Get-PhysicalDisk | Measure-Object | Select-Object -ExpandProperty Count

}

function showPartsByDisks {

    Get-Partition
}


function showInstalledAppPackages {


    Write-Host "<< AFFICHER DES EXECUTABLES >>"
    Write-Host "`nSouhaitez-vous afficher les paquets installes ou les applications installees"
    Write-Host "Choisir le chiffre correspondant à l'option:"
    Write-Host "[1] Paquets installes"
    Write-Host "[2] Applications installees"
    Write-Host "[x] Retour au menu precedent"
    
    $userChoiceInfoApp = Read-Host

    while ($userChoiceInfoApp -ne "x") {
        
        if ($userChoiceInfoApp -eq "1") {
            # Liste uniquement les paquets installés
            Write-Host "Liste des paquets installes :"
            Get-Package
            
        } elseif ($userChoiceInfoApp -eq "2") {
            # Liste les applications graphiques
            Write-Host "Liste des applications installees :"
            Get-StartApps | Select-Object Name
            
        } else {
            Write-Host "`nVeuillez saisir une option valide"
        }

        Write-Host "`nSouhaitez-vous afficher a nouveau les paquets ou applications ?"
        Write-Host "[1] Paquets installes"
        Write-Host "[2] Applications installees"
        Write-Host "[x] Retour au menu precedent"
        
        $userChoiceInfoApp = Read-Host
    }

    Write-Host "Retour au menu precedent"
}


function showRunningServices {

    Get-Service | Where-Object { $_.Status -eq 'Running' } | Select-Object Name
}

function showLocalUsers {

    $users = Get-LocalUser | Select-Object Name, Enabled, Description
    $users
}


$userChoiceDir = ""

while ($userChoiceDir -ne "x") {
    Write-Host "`n------INFORMATIONS SYSTEME------"
    Write-Host "Choisir le chiffre correspondant a l'option:"
    Write-Host "[1] Afficher la version de l'OS"
    Write-Host "[2] Afficher le nombre de disques"
    Write-Host "[3] Afficher les partitions par disque"
    Write-Host "[4] Afficher la liste des applications/paquets installes"
    Write-Host "[5] Afficher la liste des services en cours d'execution"
    Write-Host "[6] Afficher la liste des utilisateurs locaux"
    Write-Host "[x] Retour au menu precedent"
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
        "x" { Write-Host "Retour au menu precedent" }
        default { Write-Host "`nVeuillez choisir une option valide`n" }
    }
}

