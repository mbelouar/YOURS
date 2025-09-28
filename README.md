# YOURS - Système intelligent de gestion de location de matériel

**YOURS** est un système intelligent de gestion de location de matériel (caméras, outils, équipements) qui combine une application Java JEE avec des services d'intelligence artificielle Python pour optimiser la gestion des locations.

## 🏗️ Architecture

Le système est composé de trois services principaux orchestrés avec Docker :

- **🌐 Application Java JEE** (Tomcat) - Interface web et API REST
- **🤖 Service IA Python** (Flask) - Prédictions et analyses intelligentes
- **🗄️ Base de données MySQL** - Stockage persistant des données

## 🚀 Démarrage rapide

### Prérequis

- Docker et Docker Compose installés
- Git (pour cloner le projet)

### Installation et lancement

1. **Cloner le projet**

   ```bash
   git clone <repository-url>
   cd YOURS
   ```

2. **Configurer l'environnement**

   ```bash
   cp env.template .env
   # Éditer .env avec vos paramètres (mots de passe, ports, etc.)
   ```

3. **Lancer tous les services**

   ```bash
   docker-compose up -d
   ```

4. **Vérifier que tout fonctionne**
   ```bash
   docker-compose ps
   ```

## 📋 Services et Accès

Une fois lancé, les services sont accessibles aux adresses suivantes :

| Service                   | URL                   | Port | Description                     |
| ------------------------- | --------------------- | ---- | ------------------------------- |
| **Application Java**      | http://localhost:8080 | 8080 | Interface web principale        |
| **Service IA Python**     | http://localhost:5000 | 5000 | API d'intelligence artificielle |
| **Base de données MySQL** | http://localhost:3306 | 3306 | Base de données (accès direct)  |

## 🛠️ Commandes Docker utiles

### Gestion des services

```bash
# Lancer tous les services
docker-compose up -d

# Arrêter tous les services
docker-compose down

# Voir les logs en temps réel
docker-compose logs -f

# Redémarrer un service spécifique
docker-compose restart tomcat
docker-compose restart ai-service
docker-compose restart mysql

# Reconstruire et relancer
docker-compose up --build -d
```

### Maintenance

```bash
# Voir l'état des conteneurs
docker-compose ps

# Accéder au conteneur MySQL
docker-compose exec mysql mysql -u yours_user -p yours_db

# Accéder aux logs d'un service
docker-compose logs tomcat
docker-compose logs ai-service
docker-compose logs mysql

# Nettoyer les volumes (⚠️ supprime les données)
docker-compose down -v
```

## 🔧 Configuration

### Variables d'environnement

Le fichier `.env` contient toutes les configurations :

```bash
# Base de données
MYSQL_ROOT_PASSWORD=votre_mot_de_passe_root
MYSQL_DATABASE=yours_db
MYSQL_USER=yours_user
MYSQL_PASSWORD=votre_mot_de_passe

# Ports des services
TOMCAT_PORT=8080
AI_SERVICE_PORT=5000
MYSQL_PORT=3306

# Configuration de l'application
APP_NAME=YOURS
APP_VERSION=1.0.0
```

### Persistance des données

Les données sont stockées dans des volumes Docker nommés :

- `mysql_data` - Base de données MySQL
- `ai_models` - Modèles d'IA entraînés
- `ai_data` - Données d'entraînement
- `tomcat_logs` - Logs de l'application Java

## 🤖 Service d'Intelligence Artificielle

### Endpoints disponibles

Le service IA expose plusieurs endpoints pour l'analyse et la prédiction :

#### Santé du service

```bash
GET http://localhost:5000/health
```

#### Prédiction de demande

```bash
POST http://localhost:5000/api/predict/demand
Content-Type: application/json

{
  "equipment_id": 1,
  "days_ahead": 7
}
```

#### Analyse d'équipement

```bash
POST http://localhost:5000/api/analyze/equipment
Content-Type: application/json

{
  "equipment_id": 1
}
```

#### Classification d'image

```bash
POST http://localhost:5000/api/classify/image
Content-Type: multipart/form-data

image: [fichier_image]
```

#### Optimisation de prix

```bash
POST http://localhost:5000/api/optimize/pricing
Content-Type: application/json

{
  "equipment_id": 1,
  "current_price": 50.0
}
```

### Modèles d'IA inclus

- **Régression linéaire** - Prédiction de demande et optimisation de prix
- **CNN (Réseau de neurones convolutifs)** - Classification d'équipements par image
- **Analyse de patterns** - Analyse des tendances d'utilisation
- **Prédicteur de demande** - Prévisions basées sur les séries temporelles

## 🌐 Application Java

### Structure MVC

```
java-app/
├── src/main/java/com/yours/
│   ├── controller/     # Contrôleurs MVC
│   ├── service/        # Logique métier
│   ├── model/          # Modèles de données
│   ├── dao/            # Accès aux données
│   └── config/         # Configuration
├── src/main/webapp/
│   ├── WEB-INF/        # Configuration web
│   └── static/         # Ressources statiques
└── pom.xml             # Configuration Maven
```

### API REST

L'application expose une API REST pour :

- Gestion des équipements (CRUD)
- Gestion des locations
- Intégration avec le service IA
- Rapports et analyses

## 🗄️ Base de données

### Structure MySQL

La base de données contient les tables suivantes :

- `equipment` - Équipements disponibles
- `rentals` - Historique des locations
- `customers` - Clients
- `ai_predictions` - Prédictions IA
- `ai_models` - Métadonnées des modèles

### Initialisation

Les scripts d'initialisation sont dans `database/init/` et s'exécutent automatiquement au premier démarrage.

## 🔍 Développement

### Ajouter de nouvelles fonctionnalités

1. **Pour l'application Java** :

   - Ajouter les contrôleurs dans `java-app/src/main/java/com/yours/controller/`
   - Implémenter la logique dans `service/`
   - Mettre à jour les modèles dans `model/`

2. **Pour le service IA** :
   - Ajouter de nouveaux modèles dans `ai-service/models/`
   - Implémenter les services dans `ai-service/services/`
   - Exposer les endpoints dans `ai-service/app.py`

### Tests

```bash
# Tests du service IA
cd ai-service
python -m pytest

# Tests de l'application Java
cd java-app
mvn test
```

### Logs

Les logs sont disponibles via Docker Compose :

```bash
# Logs en temps réel
docker-compose logs -f

# Logs d'un service spécifique
docker-compose logs -f tomcat
docker-compose logs -f ai-service
```

## 🚨 Dépannage

### Problèmes courants

**Les services ne démarrent pas :**

```bash
# Vérifier les logs
docker-compose logs

# Vérifier la configuration
docker-compose config

# Redémarrer avec reconstruction
docker-compose down
docker-compose up --build -d
```

**Problème de connexion à la base de données :**

```bash
# Vérifier que MySQL est démarré
docker-compose ps mysql

# Tester la connexion
docker-compose exec mysql mysql -u yours_user -p yours_db
```

**Service IA non accessible :**

```bash
# Vérifier les logs
docker-compose logs ai-service

# Tester l'endpoint de santé
curl http://localhost:5000/health
```

### Nettoyage complet

```bash
# Arrêter et supprimer tout
docker-compose down -v --rmi all

# Nettoyer les images Docker inutilisées
docker system prune -a

# Relancer
docker-compose up --build -d
```

## 📚 Documentation API

### Application Java

- Interface web : http://localhost:8080
- API REST : http://localhost:8080/yours/api/

### Service IA

- Documentation : http://localhost:5000/health
- Endpoints : http://localhost:5000/api/

## 🤝 Contribution

1. Fork le projet
2. Créer une branche feature (`git checkout -b feature/nouvelle-fonctionnalite`)
3. Commit vos changements (`git commit -am 'Ajouter nouvelle fonctionnalité'`)
4. Push vers la branche (`git push origin feature/nouvelle-fonctionnalite`)
5. Créer une Pull Request

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 🆘 Support

Pour toute question ou problème :

- Créer une issue sur GitHub
- Consulter les logs avec `docker-compose logs`
- Vérifier la configuration dans `.env`

---

**YOURS** - Système intelligent de gestion de location de matériel 🎥📹🔧
