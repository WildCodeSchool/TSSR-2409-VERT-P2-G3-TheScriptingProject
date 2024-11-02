# Définir les couleurs des variables
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$NC = "White" # Aucune couleur

# Boucle while true pour faire un menu sur les informations systèmes
while ($true) {
    Write-Host "------ MENU INFORMATION SYSTEME ------`n" -f $GREEN
    Write-Host "[1] " -f $YELLOW -nonewline; Write-Host "Type de CPU, nombre de coeurs, etc.." -f $NC
    Write-Host "[2] " -f $YELLOW -nonewline; Write-Host "Mémoire RAM totale" -f $NC
    Write-Host "[3] " -f $YELLOW -nonewline; Write-Host "Utilisation de la RAM" -f $NC
    Write-Host "[4] " -f $YELLOW -nonewline; Write-Host "Utilisation du disque" -f $NC
    Write-Host "[5] " -f $YELLOW -nonewline; Write-Host "Utilisation du processeur " -f $NC
    Write-Host "[6] " -f $YELLOW -nonewline; Write-Host "Retour au menu principal" -f $NC
    Write-Host "[x] " -f $RED -nonewline; Write-Host "Quitter`n" -f $NC
    $choix = Read-Host "Veuillez choisir une option  "
    
    # Bloc pour faire un bloc avec les choix correspondants au menu 
    switch ($choix) {

       # Type de CPU, nombres de coeurs, etc..
       "1" {
            Get-WmiObject -Class Win32_Processor | Select-Object -Property Name, NumberOfCores, NumberOfEnableCore, NumberOfLogicalProcessors, Manufacturer
            Write-Host ""
            }

        # Mémoire totale de la RAM
        "2" {
            $ramTotal = [math]::Floor((Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory / 1GB * 10) / 10
            "La mémoire totale de la RAM est de {0} Go" -f $ramTotal

            Write-Host ""
            }

        # Utilisation de la RAM
        "3" {
             Get-CimInstance -ClassName Win32_OperatingSystem | ForEach-Object {
             $usedMemory = ($_.TotalVisibleMemorySize - $_.FreePhysicalMemory) / 1MB
             $totalMemory = $_.TotalVisibleMemorySize / 1MB
             "Utilisation de la mémoire : {0:N1} Go sur {1:N1} Go" -f $usedMemory, $totalMemory
             Start-Sleep -Seconds 1
             }

             Write-Host ""
             }
            
        # Utilisation du disque
        "4" {
            Get-WmiObject Win32_LogicalDisk | Select-Object DeviceID, FreeSpace, Size, VolumeName
            Write-Host ""
            }
            
        # Utilisation du processeur
        "5" {
             Get-CimInstance -ClassName Win32_Processor | ForEach-Object {
             "Utilisation du processeur : {0}%" -f $_.LoadPercentage
             Start-Sleep -Seconds 1
            }

            Write-Host ""
            }
            
        # Retour au menu principal
        "6" {
            break
            }

        # Quitter le script
        "x" {
            Write-Host "Exit" -f $YELLOW
            exit
            }

        # Inique si erreur de saisie et relance le script
        default {
            Write-Host "[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED
            }
    }
} 
# Fin du script
