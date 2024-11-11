# Définition des couleurs avec ForegroundColor
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$NC = "White" # Aucune couleur

# Variables Utilisateurs
$user1 = "wilder@172.16.10.20"
$user2 = "lbartaire@10.0.0.21"

# Variables ACTION
$Exe_script_User = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\UserControl.ps1"'
$Delete_User = 'Remove-Item "C:\Windows\Temp\UserControl.ps1"'

$Exe_script_Group = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\GroupControl.ps1"'
$Delete_Group = 'Remove-Item "C:\Windows\Temp\GroupControl.ps1"'

$Exe_script_System = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\GestionDuSysteme.ps1"'
$Delete_System = 'Remove-Item "C:\Windows\Temp\GestionDuSysteme.ps1"'

$Exe_script_Logiciel = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\GestionLogiciel.ps1"'
$Delete_Logiciel = 'Remove-Item "C:\Windows\Temp\GestionLogiciel.ps1"'

$Exe_script_Parefeu = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\GestionParefeu.ps1"'
$Delete_Parefeu = 'Remove-Item "C:\Windows\Temp\GestionParefeu.ps1"'

$Exe_script_Repertoire = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\GestionDesRepertoires.ps1"'
$Delete_Repertoire = 'Remove-Item "C:\Windows\Temp\GestionDesRepertoires.ps1"'

$Exe_script_InfoUser = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\InfoUtilisateur.ps1"'
$Delete_InfoUser = 'Remove-Item "C:\Windows\Temp\InfoUtilisateur.ps1"'

$Exe_script_InfoSoftware = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\InfoDuSystemeSoftware.ps1"'
$Delete_InfoSoftware = 'Remove-Item "C:\Windows\Temp\InfoDuSystemeSoftware.ps1"'

$Exe_script_InfoHardware = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\InfoDuSystemeHardware.ps1"'
$Delete_InfoHardware = 'Remove-Item "C:\Windows\Temp\InfoDuSystemeHardware.ps1"'

# Variables COLLECTE INFORMATION
$Exe_script_InfoUser = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\InfoUtilisateur.ps1"'
$Delete_InfoUser = 'Remove-Item "C:\Windows\Temp\InfoUtilisateur.ps1"'

$Exe_script_InfoSoftware = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\InfoDuSystemeSoftware.ps1"'
$Delete_InfoSoftware = 'Remove-Item "C:\Windows\Temp\InfoDuSystemeSoftware.ps1"'

$Exe_script_InfoHardware = 'powershell -ExecutionPolicy Bypass -File "C:\Windows\Temp\InfoDuSystemeHardware.ps1"'
$Delete_InfoHardware = 'Remove-Item "C:\Windows\Temp\InfoDuSystemeHardware.ps1"'

# Fonction log
$Logfile = "C:\Windows\System32\LogFiles\log-evt.log"
function WriteLog
{
Param ([string]$LogString)
$Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
$User = $env:USERNAME
$LogMessage = "$Stamp-$User-$LogString"
Add-content $LogFile -value $LogMessage
}

# log lancement du script
WriteLog "********StartScript********"

# Menu principal
while ($true) {

    Write-Host "`nChoisissez la machine sur laquelle vous voulez vous connecter :`n" -f $GREEN
    Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "CLIWIN01" -f $NC
    Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "CLIWIN02" -f $NC
    Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Quitter`n" -f $NC

    $machine = Read-Host "Votre choix "

    switch ($machine) {

        # Menu pour CLIWIN01
        "1" {
            WriteLog "Connexion au client CLIWIN01"

            # Variable pour retourner au menu précédent
            $continueUbuntu1 = $true
            while ($continueUbuntu1) {

                Write-Host "`nMenu Client CLIWIN01 :`n" -f $GREEN
                Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Actions" -f $NC
                Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Informations" -f $NC
                Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Retour au menu principal" -f $NC
                Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Quitter le script`n" -f $NC
                $action = Read-Host "Choisissez une option "

                switch ($action) {

                    # Menu actions pour CLIWIN01
                    "1" {
                        WriteLog "Navigation dans le menu action du client CLIWIN01"

                        # Variable pour retourner au menu précédent
                        $continueActions = $true
                        while ($continueActions) {

                            Write-Host "`nMenu action Client CLIWIN01 :`n" -f $GREEN
                            Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Gestion utilisateurs" -f $NC
                            Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Gestion des groupes" -f $NC
                            Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Gestion du systeme" -f $NC
                            Write-Host "[4] " -f $YELLOW -NoNewline; Write-Host "Gestion des Repertoires" -f $NC
                            Write-Host "[5] " -f $YELLOW -NoNewline; Write-Host "Prise en main CLI" -f $NC
                            Write-Host "[6] " -f $YELLOW -NoNewline; Write-Host "Gestion Logiciel" -f $NC
                            Write-Host "[7] " -f $YELLOW -NoNewline; Write-Host "Gestion du Parefeu" -f $NC
                            Write-Host "[8] " -f $YELLOW -NoNewline; Write-Host "Retour au menu precedent" -f $NC
                            Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Fin du script`n" -f $NC
                            $gestion = Read-Host "Votre choix "

                            switch ($gestion) {
                                "1" { 
                                    WriteLog "Navigation dans le menu de Gestion uilisateurs"
                                    scp C:\script_action\UserControl.ps1 ${user1}:/C:/Windows/Temp/UserControl.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_User"
                                    ssh -t $user1 "powershell.exe -Command $Delete_User" 
                                }
                                "2" { 
                                    WriteLog "Navigation dans le menu de Gestion des groupes"
                                    scp C:\script_action\GroupControl.sh ${user1}:/C:/Windows/Temp/GroupControl.sh
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_Group"
                                    ssh -t $user1 "powershell.exe -Command $Delete_Group"
                                }
                                "3" { 
                                    WriteLog "Navigation dans le menu de Gestion du systeme"
                                    scp C:\script_action\GestionDuSysteme.ps1 ${user1}:/C:/Windows/Temp/GestionDuSysteme.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_System"
                                    ssh -t $user1 "powershell.exe -Command $Delete_System" 
                                }
                                "4" { 
                                    WriteLog "Navigation dans le menu de Gestion des repertoires"
                                    scp C:\script_action\GestionDesRepertoires.ps1 ${user1}:/C:/Windows/Temp/GestionDesRepertoires.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_Repertoire"
                                    ssh -t $user1 "powershell.exe -Command $Delete_Repertoire" 
                                }
                                "5" { 
                                    WriteLog "Prise de main à distance (CLI) du client CLIWIN01"
                                    ssh -t $user1 
                                }
                                "6" { 
                                    WriteLog "Navigation dans le menu de Gestion Logiciel"
                                    scp C:\script_action\GestionLogiciel.ps1 ${user1}:/C:/Windows/Temp/GestionLogiciel.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_Logiciel"
                                    ssh -t $user1 "powershell.exe -Command $Delete_Logiciel" 
                                }
                                "7" { 
                                    WriteLog "Navigation dans le menu de Gestion Parefeu"
                                    scp C:\script_action\GestionParefeu.ps1 ${user1}:/C:/Windows/Temp/GestionParefeu.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_Parefeu"
                                    ssh -t $user1 "powershell.exe -Command $Delete_Parefeu"
                                }

                                "8" { 
                                    $continueActions = $false
                                }
                                "x" { 
                                    WriteLog "********EndScript********"
                                    Write-Host "`nExit`n" -f $YELLOW
                                    exit 
                                }
                                default { 
                                    Write-Host "`n[Erreur]! Option invalide, veuillez reessayer !`n" -f $RED 
                                }
                            }
                        }
                    }

                    # Menu informations pour CLIWIN01
                    "2" {
                        WriteLog "Navigation dans le menu information du client CLIWIN01"

                        # Variable pour retourner au menu précédent
                        $continueInformations = $true
                        while ($continueInformations) {

                            Write-Host "`nMenu informations Client CLIWIN01 :`n" -f $GREEN
                            Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Informations Utilisateur" -f $NC
                            Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Informations Systeme Software" -f $NC
                            Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Informations Systeme Hardware" -f $NC
                            Write-Host "[4] " -f $YELLOW -NoNewline; Write-Host "Retour au menu precedent" -f $NC
                            Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Fin du script`n" -f $NC
                            $information = Read-Host "Votre choix "

                            switch ($information) {
                                "1" { 
                                    WriteLog "Navigation dans le menu des Infomations Utilisateur"
                                    scp C:\script_information\InfoUtilisateur.ps1 ${user1}:/C:/Windows/Temp/InfoUtilisateur.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_InfoUser "
                                    ssh -t $user1 "powershell.exe -Command $Delete_InfoUser"
                                }
                                "2" { 
                                    WriteLog "Navigation dans le menu des Informations Systeme Software"
                                    scp C:\script_information\InfoDuSystemeSoftware.ps1 ${user1}:/C:/Windows/Temp/InfoDuSystemeSoftware.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_InfoSoftware"
                                    ssh -t $user1 "powershell.exe -Command $Delete_InfoSoftware"
                                }
                                "3" { 
                                    WriteLog "Navigation dans le menu des Informations Systeme Hardware"
                                    scp C:\script_information\InfoDuSystemeHardware.ps1 ${user1}:/C:/Windows/Temp/InfoDuSystemeHardware.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_InfoHardware"
                                    ssh -t $user1 "powershell.exe -Command $Delete_InfoHardware"
                                }
                                "4" { 
                                    $continueInformations = $false
                                }
                                "x" { 
                                    WriteLog "********EndScript********"
                                    Write-Host "`nExit`n" -f $YELLOW
                                    exit 
                                }
                                default { 
                                    Write-Host "`n[Erreur]! Option invalide, veuillez reessayer !`n" -f $RED 
                                }
                            }
                        }
                    }

                    "3" {
                        $continueInformations = $false
                    }
                    "x" {
                        WriteLog "********EndScript********"
                        Write-Host "`nExit`n" -f $YELLOW
                        exit
                    }
                    default { 
                        Write-Host "`n[Erreur]! Option invalide, veuillez reessayer !`n" -f $RED 
                    }
                }
            }
        }

        # Menu pour CLIWIN02
        "2" {
            WriteLog "Connexion au client CLIWIN02"

            # Variable pour retourner au menu précédent
            $continueUbuntu2 = $true
            while ($continueUbuntu2) {

                Write-Host "`nMenu Client CLIWIN02 :`n" -f $GREEN
                Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Actions" -f $NC
                Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Informations" -f $NC
                Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Retour au menu principal" -f $NC
                Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Quitter le script`n" -f $NC
                $action = Read-Host "Choisissez une option "

                switch ($action) {

                     # Menu actions pour CLIWIN02
                    "1" {
                        WriteLog "Navigation dans le menu action du client CLIWIN02"

                        # Variable pour retourner au menu précédent
                        $continueActions = $true
                        while ($continueActions) {

                            Write-Host "`nMenu action Client CLIWIN02 :`n" -f $GREEN
                            Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Gestion utilisateurs" -f $NC
                            Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Gestion des groupes" -f $NC
                            Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Gestion du systeme" -f $NC
                            Write-Host "[4] " -f $YELLOW -NoNewline; Write-Host "Gestion des Répertoires" -f $NC
                            Write-Host "[5] " -f $YELLOW -NoNewline; Write-Host "Prise en main CLI" -f $NC
                            Write-Host "[6] " -f $YELLOW -NoNewline; Write-Host "Gestion Logiciel" -f $NC
                            Write-Host "[7] " -f $YELLOW -NoNewline; Write-Host "Gestion du Parefeu" -f $NC
                            Write-Host "[8] " -f $YELLOW -NoNewline; Write-Host "Retour au menu precedent" -f $NC
                            Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Fin du script`n" -f $NC
                            $gestion = Read-Host "Votre choix "

                            switch ($gestion) {
                                "1" { 
                                    WriteLog "Navigation dans le menu de Gestion uilisateurs"
                                    scp C:\script_action\UserControl.ps1 ${user1}:/C:/Windows/Temp/UserControl.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_User"
                                    ssh -t $user1 "powershell.exe -Command $Delete_User"
                                }
                                "2" { 
                                    WriteLog "Navigation dans le menu de Gestion des groupes"
                                    scp C:\script_action\GroupControl.ps1 ${user1}:/C:/Windows/Temp/GroupControl.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_Group"
                                    ssh -t $user1 "powershell.exe -Command $Delete_Group"
                                }
                                "3" { 
                                    WriteLog "Navigation dans le menu de Gestion du systeme"
                                    scp C:\script_action\GestionDuSysteme.ps1 ${user1}:/C:/Windows/Temp/GestionDuSysteme.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_System "
                                    ssh -t $user1 "powershell.exe -Command $Delete_System"
                                }
                                "4" { 
                                    WriteLog "Navigation dans le menu de Gestion des repertoires"
                                    scp C:\script_action\GestionDesRepertoires.ps1 ${user1}:/C:/Windows/Temp/GestionDesRepertoires.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_Repertoire"
                                    ssh -t $user1 "powershell.exe -Command $Delete_Repertoire"
                                }
                                "5" { 
                                    WriteLog "Prise de main à distance (CLI) du client CLIWIN02"
                                    ssh -t $user2 
                                }
                                "6" { 
                                    WriteLog "Navigation dans le menu de Gestion Logiciel"
                                    scp C:\script_action\GestionLogiciel.ps1 ${user1}:/C:/Windows/Temp/GestionLogiciel.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_Logiciel"
                                    ssh -t $user1 "powershell.exe -Command $Delete_Logiciel"
                                }
                                "7" { 
                                    WriteLog "Navigation dans le menu de Gestion Parefeu"
                                    scp C:\script_action\GestionParefeu.ps1 ${user1}:/C:/Windows/Temp/GestionParefeu.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_Parefeu"
                                    ssh -t $user1 "powershell.exe -Command $Delete_Parefeu"
                                }

                                "8" { 
                                    $continueActions = $false
                                }
                                "x" { 
                                    WriteLog "********EndScript********"
                                    Write-Host "`nExit`n" -f $YELLOW
                                    exit 
                                }
                                default { 
                                    Write-Host "`n[Erreur]! Option invalide, veuillez reessayer !`n" -f $RED 
                                }
                            }
                        }
                    }

                    # Menu informations pour CLIWIN02
                    "2" {
                        WriteLog "Navigation dans le menu information du client CLIWIN02"

                        # Variable pour retourner au menu précédent
                        $continueInformations = $true
                        while ($continueInformations) {

                            Write-Host "`nMenu informations Client CLIWIN02 :`n" -f $GREEN
                            Write-Host "[1] " -f $YELLOW -NoNewline; Write-Host "Informations Utilisateur" -f $NC
                            Write-Host "[2] " -f $YELLOW -NoNewline; Write-Host "Informations Systeme Software" -f $NC
                            Write-Host "[3] " -f $YELLOW -NoNewline; Write-Host "Informations Systeme Hardware" -f $NC
                            Write-Host "[4] " -f $YELLOW -NoNewline; Write-Host "Retour au menu precedent" -f $NC
                            Write-Host "[x] " -f $YELLOW -NoNewline; Write-Host "Fin du script`n" -f $NC
                            $information = Read-Host "Votre choix "

                            switch ($information) {
                                "1" { 
                                    WriteLog "Navigation dans le menu des Infomations Utilisateur"
                                    scp C:\script_information\InfoUtilisateur.ps1 ${user1}:/C:/Windows/Temp/InfoUtilisateur.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_InfoUser "
                                    ssh -t $user1 "powershell.exe -Command $Delete_InfoUser"
                                }
                                "2" {
                                    WriteLog "Navigation dans le menu des Informations Systeme Software"
                                    scp C:\script_information\InfoDuSystemeSoftware.ps1 ${user1}:/C:/Windows/Temp/InfoDuSystemeSoftware.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_InfoSoftware"
                                    ssh -t $user1 "powershell.exe -Command $Delete_InfoSoftware" 
                                }
                                "3" { 
                                    WriteLog "Navigation dans le menu des Informations Systeme Hardware"
                                    scp C:\script_information\InfoDuSystemeHardware.ps1 ${user1}:/C:/Windows/Temp/InfoDuSystemeHardware.ps1
                                    ssh -t $user1 "powershell.exe -Command $Exe_script_InfoHardware"
                                    ssh -t $user1 "powershell.exe -Command $Delete_InfoHardware"
                                }
                                "4" { 
                                    $continueInformations = $false
                                }
                                "x" { 
                                    WriteLog "********EndScript********"
                                    Write-Host "`nExit`n" -f $YELLOW
                                    exit 
                                }
                                default { 
                                    Write-Host "`n[Erreur]! Option invalide, veuillez reessayer !`n" -f $RED 
                                }
                            }
                        }
                    }

                    "3" {
                        $continueUbuntu2 = $false
                    }
                    
                    "x" {
                        WriteLog "********EndScript********"
                        Write-Host "`nExit`n" -f $YELLOW
                        exit
                    }
                    default { 
                        Write-Host "`n[Erreur]! Option invalide, veuillez reessayer !`n" -f $RED 
                    }
                }
            }
        }

        # Sortie du main script
        "x" {
            WriteLog "********EndScript********"
            Write-Host "`nExit`n" -f $YELLOW
            exit
        }

        default {
            Write-Host "`n[Erreur]! Option invalide, veuillez reessayer !`n" -f $RED
        }
    }
} 