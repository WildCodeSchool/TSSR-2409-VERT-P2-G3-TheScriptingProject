# Définir les couleurs des variables
$RED = "Red"
$GREEN = "Green"
$CYAN = "Yellow"
$CYAN = "Cyan"
$NC = "White" # Aucune couleur

# Boucle while true pour le menu information système
while ($true) {
    Write-Host "`n------ MENU INFORMATION SYSTEME ------`n" -f $GREEN
    Write-Host "[1] " -f $CYAN -nonewline; Write-Host "Type de CPU, nombre de coeurs, etc.." -f $NC
    Write-Host "[2] " -f $CYAN -nonewline; Write-Host "Mémoire RAM totale" -f $NC
    Write-Host "[3] " -f $CYAN -nonewline; Write-Host "Utilisation de la RAM" -f $NC
    Write-Host "[4] " -f $CYAN -nonewline; Write-Host "Utilisation du disque" -f $NC
    Write-Host "[5] " -f $CYAN -nonewline; Write-Host "Utilisation du processeur " -f $NC
    Write-Host "[6] " -f $CYAN -nonewline; Write-Host "Retour au menu principal`n" -f $NC
    $choix = Read-Host "Veuillez choisir une option  "
    
    # Switch pour les choix du menu 
    switch ($choix) {

       # Type de CPU, nombres de coeurs, etc..
       "1" {
            Write-Host ""
            Get-WmiObject -Class Win32_Processor | Select-Object -Property Name, NumberOfCores, NumberOfEnableCore, NumberOfLogicalProcessors, Manufacturer
            Write-Host ""
            }

        # Mémoire totale de la RAM
        "2" {
            $ramTotal = (Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory / 1GB
            "`nLa mémoire totale de la RAM est de {0:N1} Go`n" -f $ramTotal
            }

        # Utilisation de la RAM
        "3" {
             Get-CimInstance -ClassName Win32_OperatingSystem | ForEach-Object {
             $usedMemory = ($_.TotalVisibleMemorySize - $_.FreePhysicalMemory) / 1MB
             $totalMemory = $_.TotalVisibleMemorySize / 1MB
             "`nUtilisation de la mémoire : {0:N1} Go sur {1:N1} Go`n" -f $usedMemory, $totalMemory
             }
             }
            
        # Utilisation du disque
        "4" {
            Get-WmiObject Win32_LogicalDisk
            Write-Host ""
            }
            
        # Utilisation du processeur
        "5" {
             Get-CimInstance -ClassName Win32_Processor | ForEach-Object {
             "`nUtilisation du processeur : {0}%`n" -f $_.LoadPercentage
            }
            }
            
        # Retour au menu principal
        "6" {
            break
            }

        # Inique si erreur de saisie et relance le script
        default {
            Write-Host "[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED
            }
    }
} 
# Fin du script
