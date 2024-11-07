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

auto eth0 iface eth0 inet static 
            address 172.16.10.x # Remplacer x par l'IP de la machine 
            netmask 255.255.255.0


Activer le démarrage automatique du service SSH :

`sudo systemctl enable ssh` # Activation au démarrage 
`sudo systemctl start ssh` # Démarrage du service SSH 
`sudo systemctl status ssh` # Vérification du statut


### Déploiement des Clés SSH pour un Accès Sans Mot de Passe

#### Sur le Serveur Linux
Générer une Clé SSH sur le Serveur :

ssh-keygen -t ecdsa # Accepter les options par défaut

arduino
Copier le code

Copier la Clé Publique vers le Client :

ssh-copy-id -i ~/.ssh/id_ecdsa.pub client@172.16.10.x # Remplacer x par l’IP du client

Copier le code

Connexion de Vérification :

ssh client@172.16.10.x # Vérifier l'accès sans mot de passe

yaml
Copier le code

### Configuration SSH sur Windows (Client et Serveur Windows)

Vérification des Services SSH :

Le client SSH est présent par défaut dans les Fonctionnalités facultatives.
Serveur SSH : Installer via Paramètres > Applications > Fonctionnalités facultatives si non installé.

Activation du Service OpenSSH sur le Client Windows :

get-service sshd | Set-Service -StartupType Automatic # Démarrage automatique Restart-Service sshd # Redémarrage du service

shell
Copier le code

### Déploiement des Clés SSH sur Windows

Génération d’une Clé SSH sur le Serveur Windows :

ssh-keygen -t ecdsa

arduino
Copier le code

Copie de la Clé Publique vers le Client Windows :

get-content -path ..ssh\id_ecdsa.pub | ssh client@172.16.10.x "echo $(cat ~/.ssh/id_ecdsa.pub) >> ~/.ssh/authorized_keys"

r
Copier le code

Désactivation de la Demande de Mot de Passe sur le Client Windows :

Ouvrir le fichier `C:\ProgramData\ssh\sshd_config` et commenter la ligne :

Match Group administrators
mathematica
Copier le code

Redémarrer le service pour appliquer les changements :

Restart-Service sshd

shell
Copier le code

### Connexions SSH Inter-Systèmes (Linux ↔ Windows)

#### Vérification des Connexions SSH pour Toutes les Combinaisons Serveur-Client

Testez la connexion SSH pour chaque combinaison de serveur et client :

ssh client@172.16.10.x

perl
Copier le code

Si la configuration est correcte, aucune demande de mot de passe ne devrait apparaître.

### Gestion des Clés entre Ubuntu et Windows

Pour déployer une clé SSH de Windows vers Ubuntu :

get-content -path ..ssh\id_ecdsa.pub | ssh client@172.16.10.30 "echo $(cat ~/.ssh/id_ecdsa.pub) >> ~/.ssh/authorized_keys"
