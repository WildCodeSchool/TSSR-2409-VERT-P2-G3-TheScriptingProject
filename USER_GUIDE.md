# Documentation Utilisateur

## 1. Actions sur les utilisateurs

### 1.1 Création de compte utilisateur local
- **Description** : Créer un nouveau compte utilisateur local sur la machine.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo adduser $new_user`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran du processus)*

- **Windows** : *(espace pour capture d’écran)*

---

### 1.2 Changement de mot de passe
- **Description** : Modifier le mot de passe d’un utilisateur.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo passwd $userpasswd_change`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran du changement de mot de passe)*

- **Windows** : *(espace pour capture d’écran)*

---

### 1.3 Suppression de compte utilisateur local
- **Description** : Supprimer un utilisateur local du système.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo userdel $delete_user`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de la suppression du compte)*

- **Windows** : *(espace pour capture d’écran)*

---

### 1.4 Désactivation de compte utilisateur local
- **Description** : Désactiver un compte utilisateur local (empêche la connexion sans le supprimer).
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo chage -E 0 $desactivate_user`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de la désactivation)*

- **Windows** : *(espace pour capture d’écran)*
---

### 1.5 Ajout à un groupe local
- **Description** : Ajouter un utilisateur à un groupe local.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo usermod -aG add_group $USER`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de l’ajout au groupe)*

- **Windows** : *(espace pour capture d’écran)*

---

### 1.6 Sortie d’un groupe local
- **Description** : Retirer un utilisateur d’un groupe local.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo gpasswd -d $USER $(id -gn)`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de la sortie du groupe)*

- **Windows** : *(espace pour capture d’écran)*

---

## 2. Actions sur les ordinateurs clients

### 2.1 Arrêt
- **Description** : Éteindre l'ordinateur client.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo shutdown now`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de l’arrêt)*

- **Windows** : *(espace pour capture d’écran)*

---

### 2.2 Redémarrage
- **Description** : Redémarrer l'ordinateur client.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo reboot`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran du redémarrage)*

- **Windows** : *(espace pour capture d’écran)*

---

### 2.3 Verrouillage
- **Description** : Verrouiller l'ordinateur client (empêche l'accès sans mot de passe).
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `loginctl lock-session`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran du verrouillage)*

- **Windows** : *(espace pour capture d’écran)*

---

### 2.4 Mise-à-jour du système
- **Description** : Mettre à jour le système avec les derniers correctifs et paquets.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo apt upgrade -y`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de la mise à jour)*

- **Windows** : *(espace pour capture d’écran)*

---

### 2.5 Création de répertoire
- **Description** : Créer un répertoire (dossier) dans le système de fichiers.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `mkdir "$newDirectory"`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de la création du répertoire)*

- **Windows** : *(espace pour capture d’écran)*

---

### 2.5 Modification de répertoire
- **Description** : Modification de répertoire (dossier).
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `mv "$userDirLocation" "$userDirPath"/"$userModDir"`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de la modification de répertoire)*

- **Windows** : *(espace pour capture d’écran)*
  
---

### 2.6 Suppression de répertoire
- **Description** : Supprimer un répertoire (dossier).
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `rm -r "$userDirLocation"`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de la suppression)*

- **Windows** : *(espace pour capture d’écran)*


---

### 2.7 Prise de main à distance (CLI)
- **Description** : Prendre le contrôle d'une machine distante via la ligne de commande (CLI).
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `ssh -t $user1`

  - **Windows** :  
    `commande à mettre` 

- **Illustration** : *(espace pour capture d’écran de connexion distante)*

- **Windows** : *(espace pour capture d’écran)*

---

### 2.8 Définition de règles de pare-feu
- **Description** : Configurer des règles de pare-feu pour autoriser ou bloquer des connexions réseau.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `commande à mettre` 

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de configuration du pare-feu)*

- **Windows** : *(espace pour capture d’écran)*

---

### 2.9 Activation du pare-feu
- **Description** : Activer le pare-feu pour protéger la machine des connexions non autorisées.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo ufw enable`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de l'activation du pare-feu)*

- **Windows** : *(espace pour capture d’écran)*

---

### 2.10 Désactivation du pare-feu
- **Description** : Désactiver temporairement le pare-feu pour des tests ou diagnostics.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo ufw disable`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran de la désactivation du pare-feu)*

- **Windows** : *(espace pour capture d’écran)*

---

### 2.11 Installation de logiciel
- **Description** : Installer un logiciel ou une application sur la machine.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo apt install $logiciel -y`

  - **Windows** :  
    `commande à mettre` 

- **Ubuntu/Debian** :
 
![MENU-GESTION-LOGICIEL](https://github.com/user-attachments/assets/3dbfc696-ad1e-436c-9d47-496a5ad633c1)<br>
![INSTALL-LOGICIEL1](https://github.com/user-attachments/assets/a1b64f17-0c34-442c-9a15-d547e561af05)<br>
![INSTALL-LOGICIEL2](https://github.com/user-attachments/assets/2b9de809-5799-4bfb-9047-bbf601cc533d)

- **Windows** : *(espace pour capture d’écran)*

---

### 2.12 Désinstallation de logiciel
- **Description** : Désinstaller un logiciel ou une application de la machine.
- **Système** : Linux, Windows(
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `sudo apt remove "$logiciel*" -y`

  - **Windows** :  
    `commande à mettre` 

- **Ubuntu/Debian** :

![MENU-GESTION-LOGICIEL](https://github.com/user-attachments/assets/f2634f0a-149a-45a9-a654-c9ccd737add1)<br>
![DELETE-LOGICIEL1](https://github.com/user-attachments/assets/89bcf57c-ad5a-4523-b68e-bb199afb8cc9)<br>
![DELETE-LOGICIEL2](https://github.com/user-attachments/assets/a30ff1ab-0ec5-48d8-b07f-3fdaff70b0a6)


- **Windows** : *(espace pour capture d’écran)*

---

### 2.13 Exécution de script sur la machine distante
- **Description** : Lancer un script ou une commande spécifique sur une machine distante.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `scp ~/script_action/UserControl.sh $user1:/tmp`<br>
    `ssh -t $user1 "$Exe_script_User"`

  - **Windows** :  
    `commande à mettre` 

- **Illustration** : *(espace pour capture d’écran de l'exécution du script à distance)*

- **Windows** : *(espace pour capture d’écran)*

---

# Informations sur l'utilisateur et l'ordinateur client

## 1. Date de dernière connexion d’un utilisateur
- **Description** : Cette information montre la date et l'heure de la dernière connexion d'un utilisateur sur le système. Cela permet de savoir quand un utilisateur s'est connecté pour la dernière fois.
  
  - **Linux (Ubuntu/Debian)** :  
    `lastlog -u "$Utilisateur"`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant la date et l'heure de la dernière connexion de l'utilisateur)*

- **Windows** : *(espace pour capture d’écran)*

---

## 2. Date de dernière modification du mot de passe
- **Description** : Cette information permet de connaître la dernière fois qu'un utilisateur a modifié son mot de passe.
  
  - **Linux (Ubuntu/Debian)** :  
    `chage -l "$Utilisateur" | grep "Last password change"`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant la dernière modification du mot de passe de l'utilisateur)*

- **Windows** : *(espace pour capture d’écran)*

---

## 3. Liste des sessions ouvertes par l'utilisateur
- **Description** : Affiche toutes les sessions actuellement ouvertes par un utilisateur donné.
  
  - **Linux (Ubuntu/Debian)** :  
    `who | grep "$Utilisateur" || echo "Aucune session ouverte."`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant les sessions ouvertes par l'utilisateur)*

- **Windows** : *(espace pour capture d’écran)*

---

## 4. Groupe d’appartenance d’un utilisateur
- **Description** : Indique à quels groupes appartient un utilisateur donné.
  
  - **Linux (Ubuntu/Debian)** :  
    `groups "$Utilisateur"`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant les groupes auxquels l'utilisateur appartient)*

- **Windows** : *(espace pour capture d’écran)*

---

## 5. Historique des commandes exécutées par l'utilisateur
- **Description** : Affiche un historique des commandes exécutées par un utilisateur dans le terminal.
  
  - **Linux (Ubuntu/Debian)** :  
    `tail -n 20 "$HIST_FILE"`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant l'historique des commandes de l'utilisateur)*

- **Windows** : *(espace pour capture d’écran)*

---

## 6. Droits/permissions de l’utilisateur sur un dossier
- **Description** : Permet de voir les permissions d'un utilisateur sur un dossier spécifique.
  
  - **Linux (Ubuntu/Debian)** :  
    `sudo -u "$Utilisateur" [ -r "$CHEMIN_DOSSIER" ] && echo "Lecture : Oui" || echo "Lecture : Non" `<br>
    `sudo -u "$Utilisateur" [ -w "$CHEMIN_DOSSIER" ] && echo "Écriture : Oui" || echo "Écriture : Non" `<br>
    `sudo -u "$Utilisateur" [ -x "$CHEMIN_DOSSIER" ] && echo "Exécution : Oui" || echo "Exécution : Non"`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant les permissions de l'utilisateur sur un dossier)*

- **Windows** : *(espace pour capture d’écran)*

---

## 7. Droits/permissions de l’utilisateur sur un fichier
- **Description** : Affiche les permissions d'un utilisateur sur un fichier donné.
  
  - **Linux (Ubuntu/Debian)** :  
    `sudo -u "$Utilisateur" [ -r "$CHEMIN_FICHIER" ] && echo "Lecture : Oui" || echo "Lecture : Non"`<br>
		`sudo -u "$Utilisateur" [ -w "$CHEMIN_FICHIER" ] && echo "Écriture : Oui" || echo "Écriture : Non"`<br>
		`sudo -u "$Utilisateur" [ -x "$CHEMIN_FICHIER" ] && echo "Exécution : Oui" || echo "Exécution : Non"`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant les permissions de l'utilisateur sur un fichier)*

- **Windows** : *(espace pour capture d’écran)*

---

# Informations sur l'ordinateur client

## 1. Version de l'OS
- **Description** : Affiche la version du système d'exploitation en cours d'exécution.
  
  - **Linux (Ubuntu/Debian)** :  
    `grep '^PRETTY_NAME=' /etc/os-release | sed 's/^PRETTY_NAME="//;s/"$//'`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant la version de l'OS)*

- **Windows** : *(espace pour capture d’écran)*

---

## 2. Nombre de disques
- **Description** : Affiche le nombre de disques physiques présents sur le système.
  
  - **Linux (Ubuntu/Debian)** :  
    `lsblk -d -n -p | grep ' disk ' | wc -l`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant le nombre de disques présents)*

- **Windows** : *(espace pour capture d’écran)*

---

## 3. Partition (nombre, nom, système de fichiers, taille) par disque
- **Description** : Affiche les partitions d'un disque avec leur nom, type de système de fichiers et leur taille.
  
  - **Linux (Ubuntu/Debian)** :  
    `lsblk -o NAME,SIZE,TYPE,MOUNTPOINT | grep -E 'disk|part'`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant les partitions d'un disque avec leurs détails)*

- **Windows** : *(espace pour capture d’écran)*

---

## 4. Liste des applications/paquets installées
- **Description** : Affiche toutes les applications ou paquets installés sur le système.
  
  - **Linux (Ubuntu/Debian)** :  
    ` dpkg --get-selections | grep -v deinstall`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant les applications ou paquets installés)*

- **Windows** : *(espace pour capture d’écran)*

---

## 5. Liste des services en cours d'exécution
- **Description** : Affiche tous les services actuellement en cours d'exécution sur l'ordinateur.
  
  - **Linux (Ubuntu/Debian)** :  
    ` systemctl list-units --type=service --state=running --no-pager --quiet --plain | awk '{print $1}'`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant les services en cours d'exécution sur le système)*

- **Windows** : *(espace pour capture d’écran)*

---

## 6. Liste des utilisateurs locaux
- **Description** : Affiche tous les utilisateurs locaux sur l'ordinateur.
  
  - **Linux (Ubuntu/Debian)** :  
    `awk -F: '$3 >= 1000 && $6 ~ /^\/home/ {print $1}' /etc/passwd`
  
  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(Espace pour capture d’écran montrant la liste des utilisateurs locaux)*

- **Windows** : *(espace pour capture d’écran)*

---

## 7. Type de CPU, nombre de cœurs, etc.
- **Description** : Donne des informations sur le processeur de l'ordinateur, notamment le type et le nombre de cœurs.
  
  - **Linux (Ubuntu/Debian)** :  
    `commande à mettre`
  
  - **Windows** :  
    `commande à mettre`

- **Ubuntu/Debian** :

![MENU-INFO-SYSTEME](https://github.com/user-attachments/assets/868377df-f7f0-4107-92f4-1d161aede583)

- **Windows** : *(Espace pour capture d’écran montrant l'utilisation du disque et l'espace disponible)*

---

## 8. Mémoire RAM totale
- **Description** : Affiche la quantité totale de mémoire RAM sur l'ordinateur.
  
  - **Linux (Ubuntu/Debian)** :  
    `free -h | grep Mem | awk '{print $2}'`
  
  - **Windows** :  
    `commande à mettre`

- **Ubuntu/Debian** :
  
![MENU-INFO-SYSTEME](https://github.com/user-attachments/assets/ecca50a9-e8c8-453e-8d41-2faf458bc26e)<br>
![MEMORY-RAM](https://github.com/user-attachments/assets/f7a90a03-608b-4664-a11a-cd92c6fc04e1)


- **Windows** : *(Espace pour capture d’écran montrant l'utilisation du disque et l'espace disponible)*

---

## 9. Utilisation de la RAM
- **Description** : Affiche l'utilisation actuelle de la mémoire RAM.
  
  - **Linux (Ubuntu/Debian)** :  
    `commande à mettre`
  
  - **Windows** :  
    `commande à mettre`

- **Ubuntu/Debian** :
  
![MENU-INFO-SYSTEME](https://github.com/user-attachments/assets/3cfa1bcf-904c-422b-8ebd-27bf9042d4d9)

- **Windows** : *(Espace pour capture d’écran montrant l'utilisation du disque et l'espace disponible)*

---

## 10. Utilisation du disque
- **Description** : Affiche l'utilisation actuelle du disque, y compris l'espace libre et utilisé.
  
  - **Linux (Ubuntu/Debian)** :  
    `commande à mettre`
  
  - **Windows** :  
    `commande à mettre`

- **Ubuntu/Debian** :
  
![MENU-INFO-SYSTEME](https://github.com/user-attachments/assets/f050f447-9199-491b-9cba-af5fdfc45530)<br>
![USE-DISK](https://github.com/user-attachments/assets/fd2b05f1-ee67-4861-b2b1-b4a68d41b1cb)


- **Windows** : *(Espace pour capture d’écran montrant l'utilisation du disque et l'espace disponible)*

---

## 11. Utilisation du processeur
- **Description** : Affiche l'utilisation actuelle du processeur.
  
  - **Linux (Ubuntu/Debian)** :  
    `commande à mettre`
  
  - **Windows** :  
    `commande à mettre`

- **Ubuntu/Debian** :
  
![MENU-INFO-SYSTEME](https://github.com/user-attachments/assets/ec2ba3d7-6a98-4aa4-87b4-94de327ab6db)

- **Windows** : *(Espace pour capture d’écran montrant l'utilisation du processeur)*
  
---

## 4. Recherche d'événements dans le fichier log

### 4.1 Recherche des événements dans le fichier log_evt.log pour un utilisateur
- **Description** : Recherche des événements relatifs à un utilisateur dans le fichier `log_evt.log`.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `commande à mettre`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran des résultats de recherche)*

- **Windows** : *(espace pour capture d’écran)*

---

### 4.2 Recherche des événements dans le fichier log_evt.log pour un ordinateur
- **Description** : Recherche des événements relatifs à un ordinateur dans le fichier `log_evt.log`.
- **Système** : Linux, Windows
- **Exemples de commandes** :

  - **Linux (Ubuntu/Debian)** :  
    `commande à mettre`

  - **Windows** :  
    `commande à mettre`

- **Illustration** : *(espace pour capture d’écran des résultats de recherche)*

- **Windows** : *(espace pour capture d’écran)*
