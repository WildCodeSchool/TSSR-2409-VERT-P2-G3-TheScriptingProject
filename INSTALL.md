# INSTALL.md

## Machines Virtuelles Requises

- **Serveur Debian 12**
- **Client Ubuntu**
- **Serveur Windows Server 2022**
- **Client Windows 10 Pro**

### Configuration Réseau
Toutes les machines virtuelles (VM) doivent être configurées avec une carte réseau "PONT" et une carte réseau "interne" pour permettre les mises à jours potentielle et la communication entre les systèmes.

---

## Étape 1 : Création des Machines Virtuelles

### 1.1 Serveur Debian 12
Créez une nouvelle VM avec les paramètres suivants :

| **Paramètre**       | **Valeur**               |
|---------------------|--------------------------|
| **Nom**             | `SRVLX01`                |
| **OS**              | Linux (Debian 64-bit)    |
| **PROC**            | 2 coeurs                 |
| **RAM**             | 2 Go                     |
| **Disque**          | 25 Go                    |
| **Carte réseau 1**  | PONT                     |
| **Carte réseau 2**  | Interne (nom : `Intnet`) |

Une fois la machine créée, configurez les éléments suivants :
- **Compte utilisateur** : `root`
- **Mot de passe** : `Azerty1***`
- **Adresse IP fixe** : `172.16.10.10/24`

Démarrez la VM avec l’ISO de Debian 12 et suivez les étapes d’installation. Configurez l’adresse IP statique :
- **IP** : `172.16.10.10`
- **Masque** : `255.255.255.0`

---

### 1.2 Client Ubuntu
Créez une nouvelle VM avec les paramètres suivants :

| **Paramètre**       | **Valeur**               |
|---------------------|--------------------------|
| **Nom**             | `CLILIN01`               |
| **OS**              | Linux (Ubuntu 64-bit)    |
| **PROC**            | 2 coeurs                 |
| **RAM**             | 2 Go                     |
| **Disque**          | 25 Go                    |
| **Carte réseau 1**  | PONT                     |
| **Carte réseau 2**  | Interne (nom : `Intnet`) |

Une fois la machine créée, configurez les éléments suivants :
- **Compte utilisateur** : `wilder` (dans le groupe des admins locaux)
- **Mot de passe** : `Azerty1***`
- **Adresse IP fixe** : `172.16.10.30/24`

Démarrez la VM avec l’ISO d’Ubuntu et suivez les étapes d’installation. Configurez l’adresse IP statique :
- **IP** : `172.16.10.30`
- **Masque** : `255.255.255.0`

---

### 1.3 Serveur Windows Server 2022
Créez une nouvelle VM avec les paramètres suivants :

| **Paramètre**       | **Valeur**               |
|---------------------|--------------------------|
| **Nom**             | `SRVWIN01`               |
| **OS**              | Windows Server 2022      |
| **PROC**            | 2 coeurs                 |
| **RAM**             | 2 Go                     |
| **Disque**          | 25 Go                    |
| **Carte réseau 1**  | PONT                     |
| **Carte réseau 2**  | Interne (nom : `Intnet`) |

Une fois la machine créée, configurez les éléments suivants :
- **Compte utilisateur** : `Administrator` (dans le groupe des admins locaux)
- **Mot de passe** : `Azerty1***`
- **Adresse IP fixe** : `172.16.10.5/24`

Démarrez la VM avec l’ISO de Windows Server 2022 et suivez les étapes d’installation. Configurez l’adresse IP statique :
- **IP** : `172.16.10.5`
- **Masque** : `255.255.255.0`

---

## Étape 2 : Configuration des IPs Statiques

### Configuration des IPs sous Debian et Ubuntu
1. **Ouvrir le fichier de configuration réseau :**

`sudo nano /etc/network/interfaces`

Modifier les paramètres IP en ajoutant :

`auto eth0 iface eth0 inet static`<br> 
`address 172.16.10.x` # Remplacer x par l'IP de la machine<br> 
`netmask 255.255.255.0`


---

# Étape 3 : Configuration SSH et Accès Sans Mot de Passe

## 3.1 Configuration SSH sur les Machines Linux (Debian et Ubuntu)

### Vérification de l'installation de SSH
1. Vérifiez si OpenSSH est installé :<br>
   `sshd -V ` # Vérifier la version SSH<br>
   `sudo apt install openssh-server`  # Installer OpenSSH si nécessaire

2. Activez le démarrage automatique du service SSH :<br>
   `sudo systemctl enable ssh`  # Activation au démarrage<br>
   `sudo systemctl start ssh`   # Démarrage du service SSH<br>
   `sudo systemctl status ssh`  # Vérification du statut du service

### Déploiement des Clés SSH pour un Accès Sans Mot de Passe

#### Sur le Serveur Linux
1. Générer une clé SSH sur le serveur :<br>
   `ssh-keygen -t ecdsa`  # Acceptez les options par défaut

2. Copier la clé publique vers le client :<br>
   `ssh-copy-id -i ~/.ssh/id_ecdsa.pub client@172.16.10.x`  # Remplacer x par l’IP du client

3. Vérification de la connexion SSH sans mot de passe :<br>
   `cat /home/wcs/.ssh/id_ecdsa.pub` # Sur le serveur<br>
   `cat .ssh/auhorized-keys` # Sur le client<br>
   `ssh client@172.16.10.x`  # Vérifier l'accès sans mot de passe

---

## 3.2 Configuration SSH sur Windows (Client et Serveur Windows)

### Vérification des Services SSH
1. Le client SSH est présent par défaut dans les Fonctionnalités facultatives de Windows.
2. Si le serveur SSH n'est pas installé, installez-le via **Paramètres > Applications > Fonctionnalités facultatives**.

### Activation du Service OpenSSH sur le Client Windows
1. Pour activer OpenSSH sur le client Windows, ouvrez PowerShell en tant qu'administrateur et exécutez les commandes suivantes :<br>
   `Get-Service sshd | Set-Service -StartupType Automatic`  # Activation au démarrage<br>
   `Restart-Service sshd`  # Redémarrage du service SSH

---

## 3.3 Déploiement des Clés SSH sur Windows

### Génération d’une Clé SSH sur le Serveur Windows
1. Ouvrez PowerShell sur le serveur Windows et générez une clé SSH :<br>
   `ssh-keygen -t ecdsa` # Génére la clé SSH<br>
   `Set-Location c:\Users\client\.ssh\` # On va vérifier ou est la clé et si tout est ok<br>
   `Get ChildItem` # On vérifie la clé
   
### Copie de la Clé Publique vers le Client Windows
1. Copiez la clé publique vers le client Windows en exécutant cette commande :<br>
   `Get-Content -path .\.ssh\id_ecdsa.pub
   ssh client@172.16.10.x
   "echo $(cat ~/.ssh/id_ecdsa.pub) >> ~/.ssh/authorized_keys"`

### Désactivation de la Demande de Mot de Passe sur le Client Windows
1. Ouvrez le fichier `C:\ProgramData\ssh\sshd_config` et commentez la ligne suivante :<br>
`Match Group administrators`

2. Redémarrez le service SSH pour appliquer les changements :<br>
   `Restart-Service sshd`

---

## 3.4 Connexions SSH Inter-Systèmes (Linux ↔ Windows)

### Vérification des Connexions SSH pour Toutes les Combinaisons Serveur-Client
1. Testez la connexion SSH pour chaque combinaison de serveur et client. Par exemple, pour tester une connexion client vers serveur :<br>
  `ssh client@172.16.10.x`

2. Si la configuration est correcte, aucune demande de mot de passe ne devrait apparaître.

### Gestion des Clés entre Ubuntu et Windows
1. Pour déployer une clé SSH d'Ubuntu vers Windows :<br>
   `ssh-copy-id -i ~/.ssh/id_ecdsa.pub client@172.16.10.x`  # Remplacer x par l'IP du client Windows
   
2. Pour déployer une clé SSH de Windows vers Ubuntu :<br>
   `Get-Content -path .\.ssh\id_ecdsa.pub | ssh client@172.16.10.30 "echo $(cat ~/.ssh/id_ecdsa.pub) >> ~/.ssh/authorized_keys"`

