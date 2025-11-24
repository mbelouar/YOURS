# Guide d'Utilisation - Module Partenaire

## Table des Matières
1. [Vue d'ensemble](#vue-densemble)
2. [Prérequis et Installation](#prérequis-et-installation)
3. [Architecture Technique](#architecture-technique)
4. [Authentification Partenaire](#authentification-partenaire)
5. [Navigation et Interface](#navigation-et-interface)
6. [Gestion des Matériels](#gestion-des-matériels)
7. [Gestion des Réservations](#gestion-des-réservations)
8. [Fichiers et Structure](#fichiers-et-structure)
9. [API et Endpoints](#api-et-endpoints)

---

## Vue d'ensemble

Le module **Partenaire** permet aux propriétaires de matériel de :
- S'authentifier et gérer leur compte
- Ajouter, modifier et supprimer des matériels
- Gérer les photos de leurs équipements
- Consulter et gérer les réservations (accepter/refuser)
- Suivre l'état de leurs matériels

---

## Prérequis et Installation

### Technologies Utilisées
- **Backend** : Java 17, Servlets (Jakarta EE), Maven
- **Frontend** : JSP, JavaScript (ES6+), Bootstrap 5, CSS3
- **Base de données** : MySQL 8.0
- **Conteneurisation** : Docker, Docker Compose
- **Serveur** : Apache Tomcat 10.1

### Prérequis
- Docker et Docker Compose installés
- Maven 3.6+ (pour la compilation)
- Git (pour cloner le projet)

### Installation et Démarrage

1. **Cloner le projet** (si nécessaire)
```bash
git clone <repository-url>
cd YOURS-main
```

2. **Configurer les variables d'environnement**
Éditer le fichier `.env` :
```env
TOMCAT_PORT=8083
MYSQL_ROOT_PASSWORD=imane2002
MYSQL_PASSWORD=imane2002
MYSQL_DATABASE=yours_db
```

3. **Démarrer l'application**
```bash
# Mode développement (avec hot-reload pour JSP/CSS/JS)
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d

# Ou utiliser le Makefile (si disponible)
make dev
```

4. **Accéder à l'application**
- Application : http://localhost:8083
- phpMyAdmin : http://localhost:8080

5. **Recompiler après modification Java**
```bash
cd java-app
mvn clean package -DskipTests
cd ..
# Redémarrer Tomcat
docker-compose -f docker-compose.yml -f docker-compose.dev.yml restart tomcat
```

---

## Architecture Technique

### Structure du Projet
```
YOURS-main/
├── java-app/
│   ├── src/main/
│   │   ├── java/com/yours/
│   │   │   ├── servlet/          # Servlets (backend)
│   │   │   ├── dao/              # Data Access Objects
│   │   │   ├── model/             # Modèles de données
│   │   │   └── util/              # Utilitaires
│   │   └── webapp/
│   │       ├── pages/partner/     # Pages JSP partenaire
│   │       └── layouts/           # Layouts communs
├── database/init/                  # Scripts SQL d'initialisation
└── docker-compose.yml              # Configuration Docker
```

### Flux de Données
```
JSP (Frontend) → JavaScript (AJAX) → Servlet (Backend) → DAO → MySQL
```

---

## Authentification Partenaire

### Page de Connexion
**URL** : `http://localhost:8083/pages/auth/login.jsp`

### Processus d'Authentification

1. **Soumission du formulaire**
   - Le formulaire envoie les données à `/login` (POST)
   - Paramètres : `email`, `password`, `userType=partner`

2. **Traitement Backend**
   - **Fichier** : `java-app/src/main/java/com/yours/servlet/LoginServlet.java`
   - Vérifie les identifiants via `PartnerDAO.authenticate()`
   - Crée une session avec les attributs :
     - `partnerId` : ID du partenaire
     - `userType` : "partner"
     - `isLoggedIn` : true

3. **Redirection**
   - Succès → Dashboard partenaire
   - Échec → Message d'erreur

### Fichiers Concernés
- **Frontend** : `java-app/src/main/webapp/pages/auth/login.jsp`
- **Backend** : `java-app/src/main/java/com/yours/servlet/LoginServlet.java`
- **DAO** : `java-app/src/main/java/com/yours/dao/PartnerDAO.java`

### Inscription Partenaire
**URL** : `http://localhost:8083/pages/auth/register-client.jsp`

**Champs requis** :
- Nom, Prénom
- Email, Téléphone
- Mot de passe
- Nom de l'entreprise
- Type d'activité
- Adresse de l'entreprise
- Documents (CIN recto/verso, photo personnelle)

**Fichiers** :
- **Frontend** : `java-app/src/main/webapp/pages/auth/register-client.jsp`
- **Backend** : `java-app/src/main/java/com/yours/servlet/RegisterServlet.java`

---

## Navigation et Interface

### Menu de Navigation Partenaire

Une fois connecté, le partenaire accède à :

1. **Dashboard** (si disponible)
2. **Mon Matériel** (`/pages/partner/equipment.jsp`)
3. **Réservations** (`/pages/partner/reservations.jsp`)
4. **Profil** (si disponible)

### Protection des Routes

Toutes les pages partenaire vérifient la session :
```java
HttpSession session = request.getSession(false);
Object partnerId = session.getAttribute("partnerId");
if (partnerId == null) {
    // Redirection vers login
}
```

---

## Gestion des Matériels

### Page Principale
**URL** : `http://localhost:8083/pages/partner/equipment.jsp`

### Fonctionnalités Disponibles

#### 1. Ajouter un Matériel

**Processus** :
1. Cliquer sur le bouton "Ajouter du matériel"
2. Remplir le formulaire :
   - Nom du matériel (obligatoire)
   - Prix/jour en MAD (obligatoire)
   - Catégorie (obligatoire)
   - Statut : Disponible / Non disponible / En maintenance
   - Description (optionnel)
   - Photos (jusqu'à 5 images)

3. **Soumission**
   - JavaScript : `saveEquipment()` dans `equipment.jsp`
   - Envoi via `fetch()` à `/partner/add-materiel` (POST)
   - Format : `FormData` (multipart/form-data)

4. **Traitement Backend**
   - **Servlet** : `AddMaterielServlet.java`
   - Vérifie la session partenaire
   - Crée la catégorie si nécessaire
   - Insère le matériel dans `materiel`
   - Sauvegarde les photos dans `uploads/equipment/`
   - Insère les entrées dans `photo`

**Fichiers** :
- **Frontend** : `java-app/src/main/webapp/pages/partner/equipment.jsp` (lignes 1937-2081)
- **Backend** : `java-app/src/main/java/com/yours/servlet/AddMaterielServlet.java`
- **DAO** : `java-app/src/main/java/com/yours/dao/MaterielDAO.java`
  - `createMateriel()`
  - `createPhoto()`
  - `getOrCreateCategorie()`

**Structure Base de Données** :
```sql
-- Table materiel
idMateriel, nom, disponibilite, prix, description, idPartenaire, idCategorie

-- Table photo
idPhoto, datePrise, type, urlPhoto, idMateriel
```

#### 2. Modifier un Matériel

**Processus** :
1. Cliquer sur "Modifier" sur une carte de matériel
2. Le formulaire se pré-remplit avec les données existantes
3. Modifier les champs souhaités
4. Ajouter/supprimer des photos
5. Cliquer sur "Enregistrer le matériel"

**Traitement** :
- **JavaScript** : `editEquipment(id)` charge les données via `/api/materiel/{id}`
- **JavaScript** : `saveEquipment()` détecte le mode édition (présence de `equipmentId`)
- **Servlet** : `UpdateMaterielServlet.java` (`/partner/update-materiel`)
- **DAO** : `MaterielDAO.updateMateriel()`

**Fichiers** :
- **Frontend** : `equipment.jsp` (lignes 1937-1950, 2084-2180)
- **Backend** : `java-app/src/main/java/com/yours/servlet/UpdateMaterielServlet.java`
- **DAO** : `MaterielDAO.updateMateriel()`, `MaterielDAO.deletePhoto()`

#### 3. Supprimer un Matériel

**Processus** :
1. Cliquer sur l'icône de suppression (poubelle)
2. Confirmer dans le modal
3. Le matériel et ses photos sont supprimés (CASCADE)

**Traitement** :
- **JavaScript** : `confirmDelete()` dans `equipment.jsp`
- **Servlet** : `DeleteMaterielServlet.java` (`/partner/delete-materiel`)
- **DAO** : `MaterielDAO.deleteMateriel()`
- Les photos sont supprimées automatiquement via CASCADE

**Fichiers** :
- **Frontend** : `equipment.jsp` (lignes 2241-2295)
- **Backend** : `java-app/src/main/java/com/yours/servlet/DeleteMaterielServlet.java`
- **DAO** : `MaterielDAO.deleteMateriel()`

#### 4. Consulter les Matériels

**Chargement** :
- **JavaScript** : `loadEquipment()` dans `equipment.jsp`
- **API** : `/api/materiel/partner` (GET)
- **Servlet** : `MaterielApiServlet.java`
- **DAO** : `MaterielDAO.getMaterielsByPartnerId()`

**Affichage** :
- Liste en grille avec cartes
- Filtres : recherche, catégorie, tri
- Vue grille/liste

**Fichiers** :
- **Frontend** : `equipment.jsp` (lignes 1525-1597)
- **Backend** : `java-app/src/main/java/com/yours/servlet/MaterielApiServlet.java`
- **DAO** : `MaterielDAO.getMaterielsByPartnerId()`

---

## Gestion des Réservations

### Page Principale
**URL** : `http://localhost:8083/pages/partner/reservations.jsp`

### Fonctionnalités Disponibles

#### 1. Consulter les Réservations

**Chargement** :
- **JavaScript** : `loadReservations()` dans `reservations.jsp`
- **API** : `/api/reservations/partner` (GET)
- **Servlet** : `ReservationApiServlet.java`
- **DAO** : `ReservationDAO.findByPartnerId()`

**Affichage** :
- Tableau avec toutes les réservations
- Filtres par statut : Toutes / En attente / Actives / Terminées
- Informations affichées :
  - ID réservation
  - Client (nom, téléphone, email)
  - Matériel
  - Dates (début/fin)
  - Durée
  - Montant total
  - Statut

**Fichiers** :
- **Frontend** : `java-app/src/main/webapp/pages/partner/reservations.jsp` (lignes 1283-1323)
- **Backend** : `java-app/src/main/java/com/yours/servlet/ReservationApiServlet.java`
- **DAO** : `java-app/src/main/java/com/yours/dao/ReservationDAO.java`
  - `findByPartnerId()`

**Structure Base de Données** :
```sql
-- Table reservation
idReservation, dateDebut, dateFin, reserve, idClient, idMateriel
```

#### 2. Accepter une Réservation

**Processus** :
1. Cliquer sur "Accepter" (bouton vert) sur une réservation en attente
2. Confirmer dans le modal
3. La réservation est acceptée (`reserve = 1`)

**Traitement** :
- **JavaScript** : `confirmAcceptReservation()` dans `reservations.jsp`
- **Servlet** : `ReservationActionServlet.java` (`/partner/reservation-action`)
  - Paramètres : `action=accept`, `idReservation={id}`
- **DAO** : `ReservationDAO.acceptReservation()`

**Fichiers** :
- **Frontend** : `reservations.jsp` (lignes 1486-1523)
- **Backend** : `java-app/src/main/java/com/yours/servlet/ReservationActionServlet.java`
- **DAO** : `ReservationDAO.acceptReservation()`

#### 3. Refuser une Réservation

**Processus** :
1. Cliquer sur "Refuser" (bouton rouge) sur une réservation en attente
2. Confirmer dans le modal
3. La réservation est supprimée de la base de données

**Traitement** :
- **JavaScript** : `confirmDeclineReservation()` dans `reservations.jsp`
- **Servlet** : `ReservationActionServlet.java` (`/partner/reservation-action`)
  - Paramètres : `action=reject`, `idReservation={id}`
- **DAO** : `ReservationDAO.rejectReservation()`

**Fichiers** :
- **Frontend** : `reservations.jsp` (lignes 1525-1562)
- **Backend** : `ReservationActionServlet.java`
- **DAO** : `ReservationDAO.rejectReservation()`

#### 4. Voir les Détails d'une Réservation

**Processus** :
1. Cliquer sur une ligne de réservation
2. Modal avec détails complets :
   - Informations client
   - Informations matériel
   - Dates et durée
   - Montant
   - Actions (accepter/refuser si en attente)

**Fichiers** :
- **Frontend** : `reservations.jsp` (fonction `showReservationDetailModal()`)

---

## Fichiers et Structure

### Fichiers Frontend (JSP/JavaScript)

#### Pages Partenaire
1. **`pages/partner/equipment.jsp`**
   - Gestion des matériels
   - Formulaire d'ajout/modification
   - Liste des matériels
   - Fonctions JavaScript :
     - `loadEquipment()` : Charge les matériels
     - `saveEquipment()` : Sauvegarde (ajout/modification)
     - `editEquipment(id)` : Charge un matériel pour modification
     - `deleteEquipment(id)` : Supprime un matériel
     - `showAddEquipmentModal()` : Affiche le modal d'ajout

2. **`pages/partner/reservations.jsp`**
   - Gestion des réservations
   - Tableau des réservations
   - Modals d'acceptation/refus
   - Fonctions JavaScript :
     - `loadReservations()` : Charge les réservations
     - `confirmAcceptReservation()` : Accepte une réservation
     - `confirmDeclineReservation()` : Refuse une réservation
     - `getReservationById(id)` : Récupère une réservation

3. **`pages/auth/login.jsp`**
   - Page de connexion
   - Formulaire d'authentification

4. **`pages/auth/register-client.jsp`**
   - Page d'inscription
   - Formulaire partenaire avec upload de fichiers

### Fichiers Backend (Java)

#### Servlets
1. **`servlet/LoginServlet.java`**
   - Route : `/login`
   - Méthode : POST
   - Authentifie le partenaire
   - Crée la session

2. **`servlet/RegisterServlet.java`**
   - Route : `/register`
   - Méthode : POST
   - Inscription partenaire
   - Gère l'upload de fichiers (CIN, photo)

3. **`servlet/AddMaterielServlet.java`**
   - Route : `/partner/add-materiel`
   - Méthode : POST
   - Ajoute un nouveau matériel
   - Gère l'upload de photos
   - Annotation : `@MultipartConfig`

4. **`servlet/UpdateMaterielServlet.java`**
   - Route : `/partner/update-materiel`
   - Méthode : POST
   - Met à jour un matériel existant
   - Gère l'ajout/suppression de photos
   - Annotation : `@MultipartConfig`

5. **`servlet/DeleteMaterielServlet.java`**
   - Route : `/partner/delete-materiel`
   - Méthode : POST
   - Supprime un matériel
   - Vérifie les permissions (appartenance au partenaire)

6. **`servlet/MaterielApiServlet.java`**
   - Route : `/api/materiel/*`
   - Méthode : GET
   - Endpoints :
     - `/api/materiel/partner` : Liste des matériels du partenaire
     - `/api/materiel/{id}` : Détails d'un matériel

7. **`servlet/ReservationApiServlet.java`**
   - Route : `/api/reservations/partner`
   - Méthode : GET
   - Retourne les réservations du partenaire en JSON

8. **`servlet/ReservationActionServlet.java`**
   - Route : `/partner/reservation-action`
   - Méthode : POST
   - Actions : `accept` ou `reject`
   - Paramètres : `action`, `idReservation`

#### DAO (Data Access Objects)
1. **`dao/PartnerDAO.java`**
   - `authenticate(email, password)` : Authentification
   - `create(Partenaire)` : Création compte
   - `findByEmail(email)` : Recherche par email

2. **`dao/MaterielDAO.java`**
   - `getMaterielsByPartnerId(idPartenaire)` : Liste matériels
   - `getMaterielById(idMateriel)` : Détails matériel
   - `createMateriel(Materiel)` : Création
   - `updateMateriel(Materiel)` : Modification
   - `deleteMateriel(idMateriel, idPartenaire)` : Suppression
   - `createPhoto(Photo)` : Ajout photo
   - `deletePhoto(idPhoto)` : Suppression photo
   - `getOrCreateCategorie(nom)` : Récupération/création catégorie

3. **`dao/ReservationDAO.java`**
   - `findByPartnerId(idPartenaire)` : Liste réservations
   - `acceptReservation(idReservation, idPartenaire)` : Accepter
   - `rejectReservation(idReservation, idPartenaire)` : Refuser

#### Modèles (Models)
1. **`model/Partenaire.java`**
   - Modèle de données partenaire

2. **`model/Materiel.java`**
   - Modèle de données matériel
   - Champs : idMateriel, nom, prix, disponibilite, description, etc.

3. **`model/Photo.java`**
   - Modèle de données photo
   - Champs : idPhoto, datePrise, type, urlPhoto, idMateriel

4. **`model/Reservation.java`**
   - Modèle de données réservation
   - Champs : idReservation, dateDebut, dateFin, reserve, idClient, idMateriel

### Fichiers Base de Données

1. **`database/init/01_create_tables.sql`**
   - Création des tables
   - Contraintes et index
   - Données initiales (catégories)

2. **`database/init/02_insert_test_data.sql`**
   - Client de test (Ghita)
   - Réservations de test

---

## API et Endpoints

### Endpoints Partenaire

#### Authentification
- **POST** `/login`
  - Paramètres : `email`, `password`, `userType=partner`
  - Retourne : Redirection ou erreur

- **POST** `/register`
  - Paramètres : Formulaire multipart (nom, email, password, fichiers, etc.)
  - Retourne : Redirection ou erreur

#### Matériels
- **GET** `/api/materiel/partner`
  - Retourne : JSON array des matériels du partenaire connecté
  - Authentification requise (session)

- **GET** `/api/materiel/{id}`
  - Retourne : JSON d'un matériel spécifique

- **POST** `/partner/add-materiel`
  - Paramètres : FormData (nom, prix, categorie, disponibilite, description, photos)
  - Retourne : JSON `{"success": true/false, "message": "...", "materielId": ...}`

- **POST** `/partner/update-materiel`
  - Paramètres : FormData (idMateriel, nom, prix, categorie, disponibilite, description, photos, photosToDelete)
  - Retourne : JSON `{"success": true/false, "message": "..."}`

- **POST** `/partner/delete-materiel`
  - Paramètres : `idMateriel` (application/x-www-form-urlencoded)
  - Retourne : JSON `{"success": true/false, "message": "..."}`

#### Réservations
- **GET** `/api/reservations/partner`
  - Retourne : JSON array des réservations du partenaire
  - Authentification requise (session)

- **POST** `/partner/reservation-action`
  - Paramètres : `action` (accept/reject), `idReservation`
  - Retourne : JSON `{"success": true/false, "message": "..."}`

### Format JSON des Réponses

#### Matériel
```json
{
  "idMateriel": 1,
  "nom": "Canon EOS R5",
  "prix": 240.0,
  "disponibilite": true,
  "description": "Appareil photo professionnel",
  "categorie": "Photographie",
  "images": [
    {
      "id": 1,
      "url": "/uploads/equipment/1234567890_1_0_image.jpg"
    }
  ]
}
```

#### Réservation
```json
{
  "idReservation": 1,
  "dateDebut": "2025-11-23",
  "dateFin": "2025-11-25",
  "reserve": false,
  "statut": "A_VENIR",
  "montantTotal": 1400.0,
  "days": 2,
  "status": "pending",
  "client": {
    "id": 1,
    "name": "Ghita Test",
    "nom": "Ghita",
    "prenom": "Test",
    "phone": "0648271183",
    "email": "ghita@test.com"
  },
  "equipment": {
    "id": 2,
    "name": "casque",
    "prix": 700.0
  }
}
```

---

## Gestion des Sessions

### Création de Session
Lors de la connexion, les attributs suivants sont stockés :
```java
session.setAttribute("partnerId", partner.getIdPartenaire());
session.setAttribute("userType", "partner");
session.setAttribute("isLoggedIn", true);
```

### Vérification de Session
Tous les servlets partenaire vérifient :
```java
HttpSession session = request.getSession(false);
Object partnerId = session.getAttribute("partnerId");
if (partnerId == null) {
    // Erreur 401 Unauthorized
}
```

### Déconnexion
- **Route** : `/logout`
- **Servlet** : `LogoutServlet.java`
- Invalide la session et redirige vers la page de connexion

---

## Gestion des Fichiers (Upload)

### Configuration
Les servlets avec upload utilisent `@MultipartConfig` :
```java
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 10 * 1024 * 1024,   // 10 MB
    maxRequestSize = 50 * 1024 * 1024  // 50 MB
)
```

### Dossiers d'Upload
- **Photos matériel** : `uploads/equipment/`
- **Documents partenaire** : `uploads/partners/` (CIN, photo)

### Format des Noms de Fichiers
- Photos matériel : `{timestamp}_{materielId}_{index}_{nomOriginal}`
- Exemple : `1732272000000_5_0_camera.jpg`

---

## Base de Données

### Tables Utilisées

#### `partenaire`
```sql
idPartenaire (PK, AUTO_INCREMENT)
nom, prenom, mail (UNIQUE)
numTelephone, motDepasse
nomEntreprise, typeActivite, adresse
cinRECTO, cinVERSO, photoPerso
```

#### `materiel`
```sql
idMateriel (PK, AUTO_INCREMENT)
nom, disponibilite (BOOLEAN)
prix, description
idPartenaire (FK → partenaire)
idCategorie (FK → categorie)
```

#### `photo`
```sql
idPhoto (PK, AUTO_INCREMENT)
datePrise, type (ENUM: 'avantLocation', 'apresLocation')
urlPhoto, idMateriel (FK → materiel)
```

#### `reservation`
```sql
idReservation (PK, AUTO_INCREMENT)
dateDebut, dateFin
reserve (BOOLEAN: 0=attente, 1=acceptée)
idClient (FK → client)
idMateriel (FK → materiel)
```

#### `categorie`
```sql
idCategorie (PK, AUTO_INCREMENT)
nomCategorie (UNIQUE)
```

### Contraintes
- Suppression CASCADE : Si un matériel est supprimé, ses photos et réservations sont supprimées
- Suppression SET NULL : Si une catégorie est supprimée, `idCategorie` devient NULL dans `materiel`

---

## Débogage et Logs

### Logs Tomcat
```bash
# Voir les logs en temps réel
docker logs yours-tomcat --follow

# Filtrer par servlet
docker logs yours-tomcat --tail 100 | Select-String -Pattern "AddMaterielServlet"
```

### Logs dans le Code
Les servlets utilisent `java.util.logging.Logger` :
```java
private static final Logger logger = Logger.getLogger(AddMaterielServlet.class.getName());
logger.info("Message d'information");
logger.warning("Message d'avertissement");
logger.severe("Message d'erreur");
```

### Console Navigateur
Les fonctions JavaScript utilisent `console.log()` pour le débogage :
```javascript
console.log('Données chargées:', data);
console.error('Erreur:', error);
```

---

## Erreurs Courantes et Solutions

### 1. Erreur 401 (Unauthorized)
**Cause** : Session expirée ou non authentifié
**Solution** : Se reconnecter

### 2. Erreur 404 (Not Found)
**Cause** : Servlet non déployé ou URL incorrecte
**Solution** : Vérifier que `mvn clean package` a été exécuté et que Tomcat a redémarré

### 3. Erreur 400 (Bad Request)
**Cause** : Paramètres manquants ou format incorrect
**Solution** : Vérifier les paramètres envoyés dans la requête

### 4. Photos non affichées
**Cause** : Chemin incorrect ou fichier non sauvegardé
**Solution** : Vérifier le dossier `uploads/equipment/` et les permissions

### 5. Réservations non visibles
**Cause** : Aucune réservation pour ce partenaire ou problème de jointure SQL
**Solution** : Vérifier que les matériels appartiennent bien au partenaire connecté

---

## Tests

### Données de Test
Un client de test est disponible :
- **Email** : `ghita@test.com`
- **Téléphone** : `0648271183`
- **Mot de passe** : `password123`

3 réservations de test sont créées pour les matériels :
- casque (idMateriel=2)
- cable (idMateriel=3)
- camera (idMateriel=4)

### Scénarios de Test

1. **Test Ajout Matériel**
   - Se connecter en tant que partenaire
   - Aller sur "Mon Matériel"
   - Ajouter un nouveau matériel avec photos
   - Vérifier l'apparition dans la liste

2. **Test Modification Matériel**
   - Cliquer sur "Modifier"
   - Changer le prix et la description
   - Sauvegarder
   - Vérifier les modifications

3. **Test Suppression Matériel**
   - Cliquer sur l'icône de suppression
   - Confirmer
   - Vérifier la disparition de la liste

4. **Test Réservations**
   - Aller sur "Réservations"
   - Vérifier l'affichage des 3 réservations de test
   - Accepter une réservation
   - Vérifier le changement de statut
   - Refuser une réservation
   - Vérifier la suppression

---

## Sécurité

### Points de Sécurité Implémentés

1. **Vérification de Session**
   - Tous les endpoints partenaire vérifient `partnerId` dans la session

2. **Vérification des Permissions**
   - Un partenaire ne peut modifier/supprimer que ses propres matériels
   - Un partenaire ne peut gérer que les réservations de ses matériels

3. **Validation des Données**
   - Validation côté client (JavaScript)
   - Validation côté serveur (Java)

4. **Protection CSRF**
   - Utilisation de sessions avec cookies
   - `credentials: 'include'` dans les requêtes fetch

---

## Améliorations Futures Possibles

1. **Pagination** : Pour les listes de matériels et réservations
2. **Recherche Avancée** : Filtres multiples sur les réservations
3. **Notifications** : Alertes pour nouvelles réservations
4. **Statistiques** : Graphiques de revenus, matériels les plus loués
5. **Export** : Export PDF/Excel des réservations
6. **Calendrier** : Vue calendrier des réservations

---

## Support et Contact

Pour toute question ou problème :
1. Consulter les logs Tomcat
2. Vérifier la console du navigateur (F12)
3. Vérifier les données en base via phpMyAdmin
4. Consulter la documentation des technologies utilisées

---

**Dernière mise à jour** : Novembre 2025
**Version** : 1.0


