# Définir les couleurs des variables
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$NC= " White" # Aucune couleur

# Boucle while true pour faire un menu sur la gestion du pare-feu
while ($true) {
    Write-Host "------ MENU GESTION PARE-FEU ------`n" -f $GREEN
    Write-Host "[1] " -f $YELLOW -nonewline; Write-Host "Définir les règles de pare-feu" -f $NC
    Write-Host "[2] " -f $YELLOW -nonewline; Write-Host "Activer le pare-feu" -f $NC
    Write-Host "[3] " -f $YELLOW -nonewline; Write-Host "Désactiver le pare-feu" -f $NC
    Write-Host "[4]  -f $YELLOW -nonewline; Write-Host "Retour au menu principal" -f $NC
    Write-Host "[x] " -f $YELLOW -nonewline; Write-Host "Quitter`n" -f $NC
    $choix = Read-Host "Veuillez choisir une option  "

    # Switch pour faire un sous-menu pour les règles du pare-feu
    switch ($choix) { 
        
         # Boucle while true pour faire un menu sur les règles du pare-feu
         "1"
    while ($true) {
      Write-Host "------ MENU DES RÈGLES PARE-FEU ------`n" -f $GREEN
      Write-Host "[1] " -f $YELLOW -nonewline; Write-Host "Ajouter une règle" -f $NC
      Write-Host "[2] " -f $YELLOW -nonewline; Write-Host "Supprimer une règle" -f $NC
      Write-Host "[3] " -f $YELLOW -nonewline; Write-Host "Afficher les règles actuelles" -f $NC
      Write-Host "[4] " -f $YELLOW -nonewline; Write-Host "Retour au menu principal" -f $NC
      Write-Host "[x] " -f $YELLOW -nonewline; Write-Host "Quitter`n" -f $NC
      $choix_regles = Read-Host "Veuillez choisir une option  "
    
    switch ($choix_regles) {

    		       # Ajouter une règles de pare-feu
                 "1" {    
                        Write-Host "Entrer la règle à ajouter (ex: allow 22/tcp) : " -f $GREEN
                        read regle
                        sudo ufw $regle
                        Write-Host "Règle ajoutée : " -f $GREEN
			Write-Host ""
                        }

                   # Supprimer une règle de pare-feu     
                   "2" {
                        Write-Host "Entrer la règle à supprimer (ex: allow 22/tcp) : " -f $GREEN
                        read regle
                        sudo ufw delete $regle
                        Write-Host "Règle supprimée : $regle" -f $GREEN
		        Write-Host ""
                        }

                   # Voir les règles de pare-feu actuelle     
                   "3" {
                        Write-Host "Règles de pare-feu actuelles :`n" -f $GREEN
                        sudo ufw status
		        Write-Host ""
                        }

                   # Retour au menu principal     
                   "4" {
                        break
                        }

                   # Quitter le script    
                   "x" {
                        Write-Host "Exit" -f $YELLOW
                        exit 0
                        }

                   # Indique une erreur de saisie et demande de réessayer une saisie valide     
                   default {
                        Write-Host "[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED
                        }
                }
             }
            }
            # Fin de la case                 	 	
            	            
           # Activation du pare-feu          
           "2"
	          # Activation du pare-feu
               Write-Host "Voulez-vous activer le pare-feu ? : oui/non" -f $GREEN
               read oui

                # Tant que l'entrée n'est pas "oui" ou "non", on redemande une saisie valide
                while ($oui -ne "oui" -and $oui -ne "non") {
                      Write-Host "[ERREUR] Option invalide, veuillez entrer 'oui' ou 'non'." -f $RED
                      $oui = Read-Host "Entrer votre choix  "
                }
                # Fin de la boucle

                # Si la valeur saisie est "oui" alors le pare-feu s'active sinon si la saisie est "non" alors rien ne se passe
                if ($oui -eq "oui") {
                   sudo ufw enable
                   Write-Host "Le pare-feu a bien été activé.`n" -f $YELLOW
                   }
                else {
                   Write-Host "Le pare-feu n'a pas été activé.`n" -f $YELLOW
                } 

           "3"
	        # Désactivation du pare-feu
                Write-Host "Voulez-vous désactiver le pare-feu ? : oui/non " -f $GREEN
                $oui = Read Host

                # Boucle pour que tant que l'entrée n'est pas "oui" ou "non", on redemande une saisie valide
                while ($oui -ne "oui" -and $oui -ne "non") {
                      Write-Host "[ERREUR] Option invalide, veuillez entrer 'oui' ou 'non'." -f $RED
                      $oui = Read-Host "Entrer votre choix  " 
                      }
                # Fin de la boucle

                # Si la valeur saisie est "oui" alors le pare-feu se désactive sinon si la saisie est "non" alors rien ne se passe
                if ($oui -eq "oui" ) {
                   sudo ufw disable
                   Write-Host "Le pare-feu a bien été désactivé.`n" -f $YELLOW
                   }
                   
                else {
                    Write-Host "Le pare-feu n'a pas été désactivé.`n" -f $YELLOW
                }   
		
           # Retour au menu principal  
           "4"
               break
	        }
	 
           # Sortir du script   
           "x"
              Write-Host "Exit"
	        exit
	        }
        
           # Inique si erreur de saisie et relance le script
           default {
            Write-Host "[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED
            }
   }
} 
# Fin du script
