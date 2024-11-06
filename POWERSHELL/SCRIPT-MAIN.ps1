# Définition des couleurs avec ForegroundColor
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$NC = "White" # Aucune couleur

# Variables Utilisateurs
$user1 = "lbartaire@10.0.0.20"
$user2 = "lbartaire@10.0.0.21"

# Variables ACTION
$Exe_script_User = "chmod +x /tmp/UserControl.sh && /tmp/UserControl.sh && rm /tmp/UserControl.sh"
$Exe_script_Group = "chmod +x /tmp/GroupControl.sh && /tmp/GroupControl.sh && rm /tmp/GroupControl.sh"
$Exe_script_System = "chmod +x /tmp/GestionDuSysteme.sh && /tmp/GestionDuSysteme.sh && rm /tmp/GestionDuSysteme.sh"
$Exe_script_Logiciel = "chmod +x /tmp/GestionLogiciel.sh && /tmp/GestionLogiciel.sh && rm /tmp/GestionLogiciel.sh"
$Exe_script_Parefeu = "chmod +x /tmp/GestionParefeu.sh && /tmp/GestionParefeu.sh && rm /tmp/GestionParefeu.sh"
$Exe_script_Systeme = "chmod +x /tmp/InfoDuSysteme.sh && /tmp/InfoDuSysteme.sh && rm /tmp/InfoDuSysteme.sh"
$Exe_script_Repertoire = "chmod +x /tmp/GestionDesRepertoires.sh && /tmp/GestionDesRepertoires.sh && rm /tmp/GestionDesRepertoires.sh"
$Exe_script_InfoUser = "chmod +x /tmp/InfoUtilisateur.sh && /tmp/InfoUtilisateur.sh && rm /tmp/InfoUtilisateur.sh"
$Exe_script_InfoSoftware = "chmod +x /tmp/InfoDuSystemeSoftware.sh && /tmp/InfoDuSystemeSoftware.sh && rm /tmp/InfoDuSystemeSoftware.sh"
$Exe_script_InfoHardware = "chmod +x /tmp/InfoDuSystemeHardware.sh && /tmp/InfoDuSystemeHardware.sh && rm /tmp/InfoDuSystemeHardware.sh"

# Variables COLLECTE INFORMATION
$Exe_script_InfoUser = "chmod +x /tmp/InfoUtilisateur.sh && ./InfoUtilisateur.sh && rm /tmp/InfoUtilisateur.sh"
$Exe_script_InfoSoftware = "chmod +x /tmp/InfoDuSystemeSoftware.sh && ./InfoDuSystemeSoftware.sh && rm /tmp/InfoDuSystemeSoftware.sh"
$Exe_script_InfoHardware = "chmod +x /tmp/InfoDuSystemeHardware.sh && ./InfoDuSystemeHardware.sh && rm /tmp/InfoDuSystemeHardware.sh"


# Menu principal
while ($true) {

    Write-Host "Choisissez la machine sur laquelle vous voulez vous connecter :`n" -f $GREEN
    Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Client UBUNTU 1" -f $NC
    Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Client UBUNTU 2" -f $NC
    Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Quitter`n" -f $NC

    $machine = Read-Host "Votre choix "

    switch ($machine) {

        "1" {
            # Menu pour Ubuntu 1
            while ($true) {

                Write-Host "`nMenu Client UBUNTU 1 :`n" -f $GREEN
                Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Actions" -f $NC
                Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Informations" -f $NC
                Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Retour au menu principal" -f $NC
                Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Quitter le script`n" -f $NC
                $action = Read-Host "Choisissez une option "

                switch ($action) {

                    "1" {
                        # Menu actions pour Ubuntu 1
                        while ($true) {

                            Write-Host "`nMenu action Client UBUNTU 1 :`n" -f $GREEN
                            Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Gestion utilisateurs" -f $NC
                            Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Gestion des groupes" -f $NC
                            Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Gestion du système" -f $NC
                            Write-Host "[4] " -f $YELLOW -NoNewline; Write-Host "Gestion des Répertoires" -f $NC
                            Write-Host "[5] " -f $YELLOW -NoNewline; Write-Host "Prise en main CLI" -f $NC
                            Write-Host "[6] " -f $YELLOW -NoNewline; Write-Host "Gestion Logiciel" -f $NC
                            Write-Host "[7] " -f $YELLOW -NoNewline; Write-Host "Gestion du Parefeu" -f $NC
                            Write-Host "[8] " -f $YELLOW -NoNewline; Write-Host "Information du Système" -f $NC
                            Write-Host "[9] " -f $YELLOW -NoNewline; Write-Host "Retour au menu précédent" -f $NC
                            Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Fin du script`n" -f $NC
                            $gestion = Read-Host "Votre choix "

                            switch ($gestion) {
                                "1" { 
                                    scp ~/script_action/UserControl.sh $user1
                                    ssh -t $user1 $Exe_script_User 
                                }
                                "2" { 
                                    scp ~/script_action/GroupControl.sh $user1
                                    ssh -t $user1 $Exe_script_Group
                                }
                                "3" { 
                                    scp ~/script_action/GestionDuSysteme.sh $user1
                                    ssh -t $user1 $Exe_script_System 
                                }
                                "4" { 
                                    scp ~/script_action/GestionDesRepertoires.sh $user1
                                    ssh -t $user1 $Exe_script_Repertoire 
                                }
                                "5" { 
                                    ssh -t $user1 
                                }
                                "6" { 
                                    scp ~/script_action/GestionLogiciel.sh $user1
                                    ssh -t $user1 $Exe_script_Logiciel 
                                }
                                "7" { 
                                    scp ~/script_action/GestionParefeu.sh $user1
                                    ssh -t $user1 $Exe_script_Parefeu 
                                }
                                "8" { 
                                    scp ~/script_action/InfoDuSysteme.sh $user1
                                    ssh -t $user1 $Exe_script_Systeme 
                                }
                                "9" { 
                                    Write-Host "Retour au menu précédent"
                                    break 
                                }
                                "x" { 
                                    Write-Host "`nExit`n" -f $YELLOW
                                    exit 
                                }
                                default { 
                                    Write-Host "`n[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED 
                                }
                            }
                        }
                    }

                    # Menu informations pour Ubuntu 1
                    "2" {

                        while ($true) {

                            Write-Host "`nMenu informations Client UBUNTU 1 :`n" -f $GREEN
                            Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Informations Utilisateur" -f $NC
                            Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Informations Système Software" -f $NC
                            Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Informations Système Hardware" -f $NC
                            Write-Host "[4] " -f $YELLOW -NoNewline; Write-Host "Retour au menu précédent" -f $NC
                            Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Fin du script`n" -f $NC
                            $information = Read-Host "Votre choix "

                            switch ($information) {
                                "1" { 
                                    scp ~/script_information/InfoUtilisateur.sh $user1
                                    ssh -t $user1 $Exe_script_InfoUser 
                                }
                                "2" { 
                                    scp ~/script_information/InfoDuSystemeSoftware.sh $user1
                                    ssh -t $user1 $Exe_script_InfoSoftware
                                }
                                "3" { 
                                    scp ~/script_information/InfoDuSystemeHardware.sh $user1
                                    ssh -t $user1 $Exe_script_InfoHardware 
                                }
                                "4" { 
                                    Write-Host "Retour au menu précédent"
                                    break 
                                }
                                "x" { 
                                    Write-Host "`nExit`n" -f $YELLOW
                                    exit 
                                }
                                default { 
                                    Write-Host "`n[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED 
                                }
                            }
                        }
                    }

                    "3" {
                        Write-Host "`nRetour au menu principal`n" -f $YELLOW
                        break
                    }
                    "x" {
                        Write-Host "`nExit`n" -f $YELLOW
                        exit
                    }
                    default { 
                        Write-Host "`n[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED 
                    }
                }
            }
        }

        "2" {
            # Menu pour Ubuntu 2
            while ($true) {

                Write-Host "`nMenu Client UBUNTU 2 :`n" -f $GREEN
                Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Actions" -f $NC
                Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Informations" -f $NC
                Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Retour au menu principal" -f $NC
                Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Quitter le script`n" -f $NC
                $action = Read-Host "Choisissez une option "

                switch ($action) {

                    "1" {
                        # Menu actions pour Ubuntu 2
                        while ($true) {

                            Write-Host "`nMenu action Client UBUNTU 2 :`n" -f $GREEN
                            Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Gestion utilisateurs" -f $NC
                            Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Gestion des groupes" -f $NC
                            Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Gestion du système" -f $NC
                            Write-Host "[4] " -f $YELLOW -NoNewline; Write-Host "Gestion des Répertoires" -f $NC
                            Write-Host "[5] " -f $YELLOW -NoNewline; Write-Host "Prise en main CLI" -f $NC
                            Write-Host "[6] " -f $YELLOW -NoNewline; Write-Host "Gestion Logiciel" -f $NC
                            Write-Host "[7] " -f $YELLOW -NoNewline; Write-Host "Gestion du Parefeu" -f $NC
                            Write-Host "[8] " -f $YELLOW -NoNewline; Write-Host "Information du Système" -f $NC
                            Write-Host "[9] " -f $YELLOW -NoNewline; Write-Host "Retour au menu précédent" -f $NC
                            Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Fin du script`n" -f $NC
                            $gestion = Read-Host "Votre choix "

                            switch ($gestion) {
                                "1" { 
                                    scp ~/script_action/UserControl.sh $user2
                                    ssh -t $user2 $Exe_script_User 
                                }
                                "2" { 
                                    scp ~/script_action/GroupControl.sh $user2
                                    ssh -t $user2 $Exe_script_Group 
                                }
                                "3" { 
                                    scp ~/script_action/GestionDuSysteme.sh $user2
                                    ssh -t $user2 $Exe_script_System 
                                }
                                "4" { 
                                    scp ~/script_action/GestionDesRepertoires.sh $user2
                                    ssh -t $user2 $Exe_script_Repertoire 
                                }
                                "5" { 
                                    ssh -t $user2 
                                }
                                "6" { 
                                    scp ~/script_action/GestionLogiciel.sh $user2
                                    ssh -t $user2 $Exe_script_Logiciel 
                                }
                                "7" { 
                                    scp ~/script_action/GestionParefeu.sh $user2
                                    ssh -t $user2 $Exe_script_Parefeu 
                                }
                                "8" { 
                                    scp ~/script_action/InfoDuSysteme.sh $user2
                                    ssh -t $user2 $Exe_script_Systeme 
                                }
                                "9" { 
                                    Write-Host "Retour au menu précédent"
                                    break 
                                }
                                "x" { 
                                    Write-Host "`nExit`n" -f $YELLOW
                                    exit 
                                }
                                default { 
                                    Write-Host "`n[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED 
                                }
                            }
                        }
                    }

                    # Menu informations pour Ubuntu 2
                    "2" {

                        while ($true) {

                            Write-Host "`nMenu informations Client UBUNTU 2 :`n" -f $GREEN
                            Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Informations Utilisateur" -f $NC
                            Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Informations Système Software" -f $NC
                            Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Informations Système Hardware" -f $NC
                            Write-Host "[4] " -f $YELLOW -NoNewline; Write-Host "Retour au menu précédent" -f $NC
                            Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Fin du script`n" -f $NC
                            $information = Read-Host "Votre choix "

                            switch ($information) {
                                "1" { 
                                    scp ~/script_information/InfoUtilisateur.sh $user2
                                    ssh -t $user2 $Exe_script_InfoUser 
                                }
                                "2" { 
                                    scp ~/script_information/InfoDuSystemeSoftware.sh $user2
                                    ssh -t $user2 $Exe_script_InfoSoftware 
                                }
                                "3" { 
                                    scp ~/script_information/InfoDuSystemeHardware.sh $user2
                                    ssh -t $user2 $Exe_script_InfoHardware 
                                }
                                "4" { 
                                    Write-Host "Retour au menu précédent"
                                    break 
                                }
                                "x" { 
                                    Write-Host "`nExit`n" -f $YELLOW
                                    exit 
                                }
                                default { 
                                    Write-Host "`n[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED 
                                }
                            }
                        }
                    }

                    "3" {
                        Write-Host "`nRetour au menu principal`n" -f $YELLOW
                        break
                    }
                    "x" {
                        Write-Host "`nExit`n" -f $YELLOW
                        exit
                    }
                    default { 
                        Write-Host "`n[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED 
                    }
                }
            }
        }
        "x" {
            Write-Host "`nExit`n" -f $YELLOW
            exit
        }
        default {
            Write-Host "`n[Erreur]! Option invalide, veuillez réessayer !`n" -f $RED
        }
    }
} 
