# Projet : Script d'Automatisation Multiplateformes

Ce projet vise à créer un script permettant d'exécuter des tâches d'automatisation sur plusieurs environnements : **Windows Server 2022 vers Windows 10 Pro**, **Debian 12 vers Ubuntu**, ainsi que des options supplémentaires comme **Debian 12 vers Windows 10 Pro** et **Windows Server 2022 vers Ubuntu**.

### Objectifs du Projet

- **Mettre en place une architecture client/serveur** : Configurer et gérer les serveurs et les clients pour la communication et l'exécution de tâches à distance.
- **Créer et gérer des scripts Bash et PowerShell** : Développer des scripts permettant l'automatisation de diverses tâches sur Windows et Linux.
- **Création d'un dossier spécifique pour l'export des informations pour chaque script** : Centraliser les données générées par chaque script dans un répertoire dédié pour une meilleure organisation.
- **Ajouter des logs** : Suivre les activités utilisateur dans les deux types de scripts (Bash et PowerShell) pour assurer la traçabilité des actions.
- **Réaliser un projet en équipe** : Collaborer en équipe avec une gestion des rôles, des tâches et des responsabilités.
- **Documenter toutes les étapes** : Créer des guides d'installation, d'utilisation et de configuration pour les utilisateurs.
- **Faire une démonstration de la réalisation finale** : Présenter les fonctionnalités du script et son utilisation sur différents environnements.

### Présentation de l'Équipe

| Semaine    | Membre     | Rôle          |
|------------|------------|---------------|
| **Semaine 1** | Camille    | SCRUM MASTER  |
|            | Lionel     | Technicien    |
|            | François   | Technicien    |
|            | Julien     | Product Owner |
| **Semaine 2** | Camille    | Technicienne  |
|            | Lionel     | Product Owner |
|            | François   | SCRUM MASTER  |
|            | Julien     | Technicien    |
| **Semaine 3** | Camille    | Product Owner |
|            | Lionel     | Technicien    |
|            | François   | Technicien    |
|            | Julien     | SCRUM MASTER  |
| **Semaine 4** | Camille    | Technicienne  |
|            | Lionel     | SCRUM MASTER  |
|            | François   | Product Owner |
|            | Julien     | Technicien    |

### Fonctionnalités

- **Commandes à distance** : Exécution de scripts et de commandes sur des machines clientes à partir d'un serveur.
- **Automatisation des tâches système** : Installation de logiciels, gestion des utilisateurs, configurations réseau, et autres tâches administratives.
- **Surveillance et rapports** : Suivi de l'exécution des tâches et génération de logs pour garantir la traçabilité et la supervision.

### Prérequis

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
