# INSTALL.md
---
### Machines virtuelles requises :
- **Serveur Debian 12**
- **Client Ubuntu**
- **Serveur Windows Server 2022**
- **Client Windows 10 Pro**

### Configuration réseau :
Toutes les VM sont configurées avec une carte réseau interne.

---

## Étape 1 : Création des Machines Virtuelles

### 1.1 Serveur Debian 12

1. Créez une nouvelle machine virtuelle avec les paramètres suivants :
   - **Nom :** `SRVLX01r`
   - **Système d'exploitation :** Linux (Debian 64-bit)
   - **Mémoire RAM :** 2 Go (recommandé)
   - **Disque dur :** 20 Go
   - **Carte réseau :** Mode réseau interne (nom de réseau interne : `Intnet`)

2. Démarrez la VM avec l'ISO de Debian 12 et suivez les étapes d'installation.

3. Pendant l'installation, configurez l'adresse IP statique :
   - **Adresse IP :** `172.16.10.10`
   - **Masque de sous-réseau :** `255.255.255.0`

### 1.2 Client Ubuntu

1. Créez une nouvelle machine virtuelle avec les paramètres suivants :
   - **Nom :** `CLILIN01`
   - **Système d'exploitation :** Linux (Ubuntu 64-bit)
   - **Mémoire RAM :** 1 Go (recommandé)
   - **Disque dur :** 10 Go
   - **Carte réseau :** Mode réseau interne (nom de réseau interne : `Intnet`)

2. Démarrez la VM avec l'ISO d'Ubuntu et suivez les étapes d'installation.

3. Configurez l'adresse IP statique :
   - **Adresse IP :** `172.16.10.30`
   - **Masque de sous-réseau :** `255.255.255.0`


### 1.3 Serveur Windows Server 2022

1. Créez une nouvelle machine virtuelle avec les paramètres suivants :
   - **Nom :** `SRVWIN01`
   - **Système d'exploitation :** Windows Server 2022
   - **Mémoire RAM :** 4 Go (recommandé)
   - **Disque dur :** 40 Go
   - **Carte réseau :** Mode réseau interne (nom de réseau interne : `Intnet`)

2. Démarrez la VM avec l'ISO de Windows Server 2022 et suivez les étapes d'installation.

3. Configurez l'adresse IP statique :
   - **Adresse IP :** `172.16.10.5`
   - **Masque de sous-réseau :** `255.255.255.0`


### 1.4 Client Windows 10 Pro

1. Créez une nouvelle machine virtuelle avec les paramètres suivants :
   - **Nom :** `CLIWIN01`
   - **Système d'exploitation :** Windows 10 Pro
   - **Mémoire RAM :** 2 Go (recommandé)
   - **Disque dur :** 20 Go
   - **Carte réseau :** Mode réseau interne (nom de réseau interne : `Intnet`)

2. Démarrez la VM avec l'ISO de Windows 10 Pro et suivez les étapes d'installation.

3. Configurez l'adresse IP statique :
   - **Adresse IP :** `172.16.10.20`
   - **Masque de sous-réseau :** `255.255.255.0`


---

### 2. Configurer les IPs statiques

- **Debian :** Modifier `/etc/network/interfaces` et redémarrer le réseau.
- **Windows :** Paramètres réseau via **Panneau de configuration**.



