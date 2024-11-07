# Définir les couleurs des variables
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$NC = "White" # Aucune couleur

# Boucle while true pour la gestion de logiciel
while ($true) {
    Write-Host "------ MENU GESTION LOGICIEL ------`n" -f $GREEN
    Write-Host "[1] " -f $YELLOW -nonewline; Write-Host " Installer un logiciel" -f $NC
    Write-Host "[2] " -f $YELLOW -nonewline; Write-Host " Désinstaller un logiciel" -f $NC
    Write-Host "[3] " -f $YELLOW -nonewline; Write-Host " Retour au menu principal" -f $NC
    Write-Host "[x] " -f $RED -nonewline; Write-Host " Quitter`n" -f $NC
    $choix = Read-Host "Veuillez choisir une option  "

    # Switch pour faire un bloc pour choix installation ou désinstallation logiciel
    switch ($choix) {
    
        # Installer un logiciel
        "1" {
            Write-Host "Entrer le nom du logiciel à installer : `n" -f $GREEN 
            $logiciel = Read-Host "Nom du logiciel"

            Write-Host ""

            $chocoPath = "C:\ProgramData\chocolatey\bin\choco.exe"
            $process = Start-Process -FilePath $chocoPath -ArgumentList "install", $logiciel, "-y" -NoNewWindow -Wait -PassThru

            if ($process.ExitCode -eq 0) {
            Write-Host "$logiciel a été installé avec succès.`n" -f $GREEN
            } 
              else {
                   Write-Host "Erreur lors de l'installation de $logiciel.`n" -f $RED
            }
        }

        # Désinstaller un logiciel
        "2" {
            Write-Host "Entrer le nom du logiciel à désinstaller : `n" -f $GREEN
            $logiciel = Read-Host "Nom du logiciel"

            Write-Host ""

            $chocoPath = "C:\ProgramData\chocolatey\bin\choco.exe"
            $process = Start-Process -FilePath "$chocoPath" -ArgumentList "uninstall", $logiciel, "-y" -NoNewWindow -Wait -PassThru


            if ($process.ExitCode -eq 0) {
            Write-Host "$logiciel a été désinstallé avec succès.`n" -f $GREEN
            }
                else {
                Write-Host "Erreur lors de la désinstallation de $logiciel.`n" -f $RED
            }
        }
        
        # Retour au menu principal 
        "3" {
            Write-Host "Exit" -f $YELLOW
            break
        }
        
        # Sortir du script 
        "x" {
            Write-Host "Exit" -f $YELLOW
            exit
        }
        # Indique si erreur de saisie et relance le script    
        default {
            Write-Host "[ERREUR]! Option invalide, veuillez réessayer !`n" -f $RED
        }
    }
}
