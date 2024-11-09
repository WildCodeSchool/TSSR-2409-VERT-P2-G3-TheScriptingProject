# Projet : Script d'Automatisation Multiplateformes

Ce projet a pour but de créer un script d'automatisation multi-plateformes, capable d'exécuter des tâches sur différents environnements. Voici les combinaisons principales :

1. **Windows Server 2022 vers Windows 10 Pro**
2. **Debian 12 vers Ubuntu**
3. **Options supplémentaires** :
   - Debian 12 vers Windows 10 Pro
   - Windows Server 2022 vers Ubuntu

---

## Objectifs du Projet

- **Mise en place d'une architecture client/serveur** : Configurer les serveurs et les clients pour la communication et l'exécution de tâches à distance.
- **Développement et gestion de scripts Bash et PowerShell** : Créer des scripts pour automatiser des tâches sur Windows et Linux.
- **Création d'un dossier dédié pour l'export des informations** : Centraliser les données générées par chaque script dans un dossier spécifique pour une meilleure organisation.
- **Ajout de logs** : Assurer un suivi des activités utilisateur dans les scripts pour garantir la traçabilité des actions.
- **Collaboration en équipe** : Travailler en équipe avec gestion des rôles, des tâches et des responsabilités.
- **Documentation complète** : Produire des guides d'installation, d'utilisation et de configuration pour faciliter la prise en main du script.
- **Démonstration de la solution** : Présenter les fonctionnalités et cas d'utilisation du script sur différents environnements.

---

## Présentation de l'Équipe

| Semaine       | Camille          | Lionel          | François         | Julien          |
|---------------|------------------|-----------------|------------------|-----------------|
| **Semaine 1** | SCRUM MASTER     | Technicien      | Technicien       | Product Owner   |
| **Semaine 2** | Technicienne     | Product Owner   | SCRUM MASTER     | Technicien      |
| **Semaine 3** | Product Owner    | Technicien      | Technicien       | SCRUM MASTER    |
| **Semaine 4** | Technicienne     | SCRUM MASTER    | Product Owner    | Technicien      |

---

## Fonctionnalités

- **Commandes à distance** : Exécution de scripts et de commandes sur des machines clientes depuis un serveur centralisé.
- **Automatisation des tâches système** : Installation de logiciels, gestion des utilisateurs, configurations réseau, et autres tâches administratives.
- **Surveillance et rapports** : Suivi de l'exécution des tâches et génération de logs pour garantir la traçabilité et la supervision.

---

## Prérequis

- **Machines nécessaires** :
  - **Serveur Debian** : 2 Go de RAM, 2 cœurs de processeur, 25 Go de stockage.
  - **Client Ubuntu** : 2 Go de RAM, 2 cœurs de processeur, 25 Go de stockage.
  - **Serveur Windows** : 2 Go de RAM, 2 cœurs de processeur, 25 Go de stockage.
  - **Client Windows** : 2 Go de RAM, 2 cœurs de processeur, 25 Go de stockage.

- **Configuration réseau** :
  - Chaque machine doit disposer d'une **carte réseau en pont** pour l'accès internet et d'une **carte réseau interne** pour la communication entre serveurs et clients.
  - Configurer correctement les adresses IP sur chaque carte pour permettre :
    - L’accès internet (mise à jour des systèmes et accès aux ressources en ligne).
    - La communication interne entre les serveurs et les clients.

- **Services requis** :
  - **SSH Server** activé sur les clients (Windows et Linux) pour les connexions à distance.

 ---

## Liens direct vers la documentation Admin et Utilisateur :

 - [Guide d'installation](https://github.com/WildCodeSchool/TSSR-2409-VERT-P2-G3-TheScriptingProject/blob/main/INSTALL.md)
 - [Guide utilisateur](https://github.com/WildCodeSchool/TSSR-2409-VERT-P2-G3-TheScriptingProject/blob/main/USER_GUIDE.md)
