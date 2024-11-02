# Définir les couleurs des variables
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$NC = "White" # Aucune couleur

# Boucle while true pour faire un menu sur les informations systèmes
while ($true) {
    Write-Host "------ MENU INFORMATION SYSTEME ------`n" -f $NC
    Write-Host "[1]" -f $YELLOW -nonewline; Write-Host "Type de CPU, nombre de coeurs, etc.." -f $NC
    Write-Host "[2]" -f $YELLOW -nonewline; Write-Host "Mémoire RAM totale" -f $NC
    Write-Host "[3]" -f $YELLOW -nonewline; Write-Host "Utilisation de la RAM" -f $NC
    Write-Host "[4]" -f $YELLOW -nonewline; Write-Host "Utilisation du disque" -f $NC
    Write-Host "[5]" -f $YELLOW -nonewline; Write-Host "Utilisation du processeur " -f $NC
    Write-Host "[6]" -f $YELLOW -nonewline; Write-Host "Retour au menu principal" -f $NC
    Write-Host "[x]" -f $RED -nonewline; Write-Host "Quitter`n" -f $NC
    $choix = Read-Host "Veuillez choisir une option  "
    
    # Bloc pour faire un bloc avec les choix correspondants au menu 
    switch ($choix) {

       # Type de CPU, nombres de coeurs, etc..
       "1" {
            lscpu
            Write-Host ""
            }

        # Mémoire totale de la RAM
        "2" {
            free -h | grep Mem | awk '{print $2}'
            Write-Host ""
            }

        # Utilisation de la RAM
        "3" {
            free -h
            Write-Host ""
            }
            
        # Utilisation du disque
        "4" {
            df -h
            Write-Host ""
            }
            
        # Utilisation du processeur
        "5" {
            top -b -n 1
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
