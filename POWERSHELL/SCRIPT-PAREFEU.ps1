# Définir les couleurs des variables
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$NC = "White" # Aucune couleur

function Menu-ReglesPareFeu {
    while ($true) {
        Write-Host "------ MENU DES RÈGLES PARE-FEU ------`n" -f $GREEN
        Write-Host "[1] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Ajouter une règle" -f $NC
        Write-Host "[2] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Supprimer une règle" -f $NC
        Write-Host "[3] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Afficher les règles actuelles" -f $NC
        Write-Host "[4] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Retour au menu principal" -f $NC
        Write-Host "[x] " -ForegroundColor $RED -NoNewline; Write-Host "Quitter`n" -f $NC
        $choix_regles = Read-Host "Veuillez choisir une option"

        switch ($choix_regles) {
            "1" {
                $regle = Read-Host "Entrer la règle à ajouter (ex: allow 22/tcp) : " -f $GREEN
                Write-Host "Règle ajoutée : $regle`n" -f $GREEN
            }
            "2" {
                $regle = Read-Host "Entrer la règle à supprimer (ex: allow 22/tcp) : " -f $GREEN
                Write-Host "Règle supprimée : $regle`n" -f $GREEN
            }
            "3" {
                Write-Host "Règles de pare-feu actuelles :`n" -f $GREEN
                # Afficher les règles ici
            }
            "4" {
                return  # Retourne au menu principal
            }
            "x" {
                Write-Host "Exit" -f $YELLOW
                exit
            }
            default {
                Write-Host "[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED
            }
        }
    }
}

# Boucle principale pour la gestion du pare-feu
while ($true) {
    Write-Host "------ MENU GESTION PARE-FEU ------`n" -f $GREEN
    Write-Host "[1] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Définir les règles de pare-feu" -f $NC
    Write-Host "[2] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Activer le pare-feu" -f $NC
    Write-Host "[3] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Désactiver le pare-feu" -f $NC
    Write-Host "[x] " -ForegroundColor $RED -NoNewline; Write-Host "Quitter`n" -f $NC
    $choix = Read-Host "Veuillez choisir une option"

    switch ($choix) {
        "1" {
            Menu-ReglesPareFeu  # Appelle la fonction pour les règles de pare-feu
        }
        "2" {
            $oui = Read-Host "Voulez-vous activer le pare-feu ? oui/non "
            while ($oui -ne "oui" -and $oui -ne "non") {
                Write-Host "[ERREUR] Option invalide, veuillez entrer 'oui' ou 'non'." -f $RED
                $oui = Read-Host "Entrer votre choix  "
            }
            if ($oui -eq "oui") {
                Set-NetFirewallProfile -Profile * -Enabled True
                Write-Host "Le pare-feu a bien été activé.`n" -f $GREEN
            } else {
                Write-Host "Le pare-feu n'a pas été activé.`n" -f $RED
            }
        }
        "3" {
            $oui = Read-Host "Voulez-vous désactiver le pare-feu ? : oui/non "
            while ($oui -ne "oui" -and $oui -ne "non") {
                Write-Host "[ERREUR] Option invalide, veuillez entrer 'oui' ou 'non'." -f $RED
                $oui = Read-Host "Entrer votre choix  "
            }
            if ($oui -eq "oui") {
                Set-NetFirewallProfile -Profile * -Enabled False
                Write-Host "Le pare-feu a bien été désactivé.`n" -f $GREEN
            } else {
                Write-Host "Le pare-feu n'a pas été désactivé.`n" -f $RED
            }
        }
        "x" {
            Write-Host "Exit" -f $YELLOW
            exit
        }
        default {
            Write-Host "[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED
        }
    }
}
# Fin du script
