# **Product Backlog & Organisation - Semaine 3 / Semaine 4**

**Scrum Master** : Julien  
**Product Owner** : Camille  

---

## **Sprint Backlog - Semaine 3**

### **Objectifs Généraux**
1. **Développement du Script** : 
   - Création des scripts BASH (Information).
   - Création des scripts PowerShell (Action).
   - Création des scripts PowerShell (Information).
   - Mise en commun des scripts Bash (Action et Information) et des scripts PowerShell (en fonction des avancées).

2. **Documentation** :
   - Commencer la documentation utilisateur (USER_GUIDE.md).
   - Continuer la documentation admin (INSTALL.md).
   - Peaufiner le README.md.

---

#### **Tâches de Développement** :
| Tâche | Description | Détails |
|-------|-------------|---------|
| **Création Script Bash (Information)** | Écrire un script Bash sous Ubuntu pour afficher des informations. | - Utiliser des commandes système pour extraire des informations (ex. `uname`, `df`, `top`, etc.)<br> - Permettre une interaction utilisateur avec des options.
| **Création Script PowerShell (Action)** | Écrire un script PowerShell sous Windows pour exécuter des actions spécifiques. | - Automatiser une tâche courante.<br> - Rendre les actions personnalisables pour l'utilisateur. |
| **Création Script PowerShell (Information)** | Écrire un script PowerShell sous Windows pour afficher des informations système. | - Utiliser des cmdlets PowerShell pour récupérer des infos sur le système (ex. `Get-Process`, `Get-ComputerInfo`).<br>
| **Mise en Commun des Scripts** | Fusionner les scripts écrit dans un script principal intégrant les différentes plateformes (Debian / Windows). | - Assurer une compatibilité multiplateforme et effectuer des tests basiques sur chaque OS. |

---

### **Documentation**

| Tâche | Description | Détails |
|-------|-------------|---------|
| **USER_GUIDE.md** | Créer un guide utilisateur détaillé pour l'utilisation du script. | - Débuter par des captures d'écran de l'interface, des étapes d'utilisation de chaque fonctionnalité.<br> - Explication détaillée des options proposées dans le menu, avec des exemples concrets pour chaque OS |
| **INSTALL.md** | Rédiger un guide d'installation pour les environnements Ubuntu et Windows. | - Lister les prérequis système.<br> - Instructions étape par étape pour installer et exécuter les scripts.<br> - Préciser les autorisations requises, chemins d'installation recommandés et éventuels problèmes de compatibilité. |
| **README.md** | Finaliser le README pour la présentation du projet sur GitHub. | - Brève description du projet, ses objectifs et ses fonctionnalités.<br> - Liens vers les autres documents (USER_GUIDE.md et INSTALL.md) |

---

## **Sprint Review - Semaine 3**

### **État des Livrables**

1. **Développement du Script**
   - **Scripts Bash et PowerShell** : Premières versions des scripts créées pour chaque plateforme, avec les fonctionnalités de base fonctionnelles.
   - **Fusion des Scripts** : Mise en commun avec tests initiaux pour vérifier la compatibilité et les performances.

2. **Documentation**
   - **USER_GUIDE.md** : Première version avec captures d'écran pour la présentation des options, introduction et guide utilisateur en cours d'élaboration.
   - **INSTALL.md** : Liste de prérequis et instructions générales prêtes ; sections spécifiques pour les plateformes Ubuntu et Windows à compléter.
   - **README.md** : Structure de base et introduction rédigées ainsi que des liens vers les guides d’utilisation et d’installation.

---

## **Sprint Retrospective**

- **Développement** :
   - Implémenter dans les scripts: l'**enregistrement des informations** dans un dossier spécifique et la **journalisation**
   - Finaliser la mise en page des scripts: couleurs... 
   - Améliorer la clarté des scripts avec l'**ajout de commentaires**
   - Réaliser l'objectif secondaire: lancer et exécuter le script finale **BASH depuis un serveur Windows** et le script finale **PowerShell depuis un serveur Debian**.
   
- **Documentation** :
   - Terminer les 3 livrables (README.md / INSTALL.md / USER_GUIDE.md)
