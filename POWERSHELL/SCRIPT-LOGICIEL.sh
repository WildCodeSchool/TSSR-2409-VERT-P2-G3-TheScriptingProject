# Définir les couleurs des variables
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$NC = "White" # Aucune couleur

# Boucle while true pour la gestion de logiciel
while ($true) {
    Write-Host "------ MENU GESTION LOGICIEL ------`n"
    Write-Host "[1]" -f $GREEN -nonewline; Write-Host " Installer un logiciel" -f $NC
    Write-Host "[2]" -f $GREEN -nonewline; Write-Host " Désinstaller un logiciel" -f $NC
    Write-Host "[3]" -f $GREEN -nonewline; Write-Host " Quitter" -f $NC
    $choix = Read-Host "Veuillez choisir une option : "

    # Bloc pour choix installation ou désinstallation logiciel
    switch ($choix) {
        "1" {
            Write-Host "Entrer le nom du logiciel à installer : " -f $GREEN 
            $logiciel = Read-Host "Nom du logiciel"
            Start-Process -FilePath "winget" -ArgumentList "install", $logiciel, "-y" -NoNewWindow -Wait
        }
        "2" {
            Write-Host "Entrer le nom du logiciel à désinstaller : " -f $GREEN
            $logiciel = Read-Host "Nom du logiciel"
            Start-Process -FilePath "winget" -ArgumentList "remove", $logiciel, "-y" -NoNewWindow -Wait
        }
        # Sortir du script 
        "3" {
            Write-Host "Exit" -f $YELLOW
            Exit
        }
        # Indique si erreur de saisie et relance le script    
        default {
            Write-Host "[ERREUR]! Option invalide, veuillez réessayer !" -f $RED
        }
    }
}
