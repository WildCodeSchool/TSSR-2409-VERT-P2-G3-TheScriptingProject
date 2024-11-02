# Définir les couleurs des variables
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$NC = "White" # Aucune couleur

# Boucle while true pour faire un menu sur la gestion du pare-feu
while ($true) {
    Write-Host "------ MENU GESTION PARE-FEU ------`n" -f $GREEN
    Write-Host "[1] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Définir les règles de pare-feu" -f $NC
    Write-Host "[2] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Activer le pare-feu" -f $NC
    Write-Host "[3] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Désactiver le pare-feu" -f $NC
    Write-Host "[4] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Retour au menu principal" -f $NC
    Write-Host "[x] " -ForegroundColor $RED -NoNewline; Write-Host "Quitter`n" -f $NC
    $choix = Read-Host "Veuillez choisir une option"

    # Bloc pour faire un sous-menu pour les règles du pare-feu
    switch ($choix) { 
        # Boucle while true pour faire un menu sur les règles du pare-feu
        "1" {
            while ($true) {
                Write-Host "------ MENU DES RÈGLES PARE-FEU ------`n" -f $GREEN
                Write-Host "[1] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Ajouter une règle" -f $NC
                Write-Host "[2] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Supprimer une règle" -f $NC
                Write-Host "[3] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Afficher les règles actuelles" -f $NC
                Write-Host "[4] " -ForegroundColor $YELLOW -NoNewline; Write-Host "Retour au menu principal" -f $NC
                Write-Host "[x] " -ForegroundColor $RED -NoNewline; Write-Host "Quitter`n" -f $NC
                $choix_regles = Read-Host "Veuillez choisir une option"

                switch ($choix_regles) {
                    # Ajouter une règle de pare-feu
                    "1" {   
                        $regle = Read-Host "Entrer la règle à ajouter (ex: allow 22/tcp) : " -f $GREEN
                        # Ajouter la règle ici
                        Write-Host "Règle ajoutée : $regle`n" -f $GREEN
                    }

                    # Supprimer une règle de pare-feu     
                    "2" {
                        $regle = Read-Host "Entrer la règle à supprimer (ex: allow 22/tcp) : " -f $GREEN
                        # Supprimer la règle ici
                        Write-Host "Règle supprimée : $regle`n" -f $GREEN
                    }

                    # Voir les règles de pare-feu actuelle     
                    "3" {
                        Write-Host "Règles de pare-feu actuelles :`n" -f $GREEN
                        # Afficher les règles ici
                    }

                    # Retour au menu principal     
                    "4" {
                        break
                    }

                    # Quitter le script    
                    "x" {
                        Write-Host "Exit" -f $YELLOW
                        exit 
                    }

                    # Indique une erreur de saisie et demande de réessayer une saisie valide     
                    default {
                        Write-Host "[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED
                    }
                }
            }
        }

        # Activation du pare-feu          
        "2" {
            $oui = Read-Host "Voulez-vous activer le pare-feu ? : oui/non "

            while ($oui -ne "oui" -and $oui -ne "non") {
                Write-Host "[ERREUR] Option invalide, veuillez entrer 'oui' ou 'non'." -f $RED
                $oui = Read-Host "Entrer votre choix  "
            }

            if ($oui -eq "oui") {
                # Activer le pare-feu ici
                Write-Host "$Le pare-feu a bien été activé.`n" -f $GREEN
            } else {
                Write-Host "Le pare-feu n'a pas été activé.`n" -f $RED
            }
        }

        # Désactivation du pare-feu
        "3" {
            $oui = Read-Host "Voulez-vous désactiver le pare-feu ? : oui/non "

            while ($oui -ne "oui" -and $oui -ne "non") {
                Write-Host "[ERREUR] Option invalide, veuillez entrer 'oui' ou 'non'." -f $RED
                $oui = Read-Host "Entrer votre choix  "
            }

            if ($oui -eq "oui") {
                # Désactiver le pare-feu ici
                Write-Host "Le pare-feu a bien été désactivé.`n" -f $GREEN
            } else {
                Write-Host "Le pare-feu n'a pas été désactivé.`n" -f $RED
            }
        }

        # Retour au menu principal  
        "4" {
            break
        }

        # Sortir du script   
        "x" {
            Write-Host "Exit" -f $YELLOW
            exit
        }

        # Indique si erreur de saisie et relance le script
        default {
            Write-Host "[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED
        }
    }
}
# Fin du script
