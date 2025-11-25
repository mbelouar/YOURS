===============================================================================
        YOURS - SYSTÈME DE GESTION DE LOCATION D'ÉQUIPEMENTS
                    GUIDE DE DÉMARRAGE RAPIDE
===============================================================================

PRÉREQUIS:
----------
- Docker Desktop installé et EN COURS D'EXÉCUTION
- Maven installé
- Ports 8080, 8081, 3306 et 5001 disponibles

VÉRIFICATION RAPIDE:
-------------------
docker --version && docker-compose --version && mvn --version

DÉMARRAGE EN 3 ÉTAPES:
----------------------
1. Ouvrez un terminal et naviguez vers le projet :
   cd YOURS-main

2. Compilez l'application Java :
   cd java-app
   mvn clean package -DskipTests
   cd ..

3. Démarrez tous les services :
   docker-compose up --build -d

4. Attendez 2-3 minutes pour l'initialisation complète.

5. Vérifiez que tout fonctionne :
   docker-compose ps
   (Tous les services doivent être "Up" et "healthy")

MÉTHODE ALTERNATIVE (avec Makefile):
-----------------------------------
Si vous avez 'make' installé, vous pouvez simplement utiliser :
   make build

ACCÈS AUX SERVICES:
-------------------
Une fois les services démarrés, accédez à :

1. APPLICATION PRINCIPALE :
   http://localhost:8080
   (Ouvrez dans votre navigateur)

2. phpMyAdmin (Gestion de la base de données) :
   http://localhost:8081
   - Serveur : mysql
   - Utilisateur : yours_user
   - Mot de passe : imane2002

3. AI Service (API) :
   http://localhost:5001/health

IDENTIFIANTS BASE DE DONNÉES:
------------------------------
- Base de données : yours_db
- Utilisateur : yours_user
- Mot de passe : imane2002
- Root password : imane2002

POUR WINDOWS:
-------------
Si vous utilisez Windows, remplacez les commandes par :
1. Compilation Java :
   cd java-app
   mvn clean package -DskipTests
   cd ..

2. Démarrage des services :
   docker-compose up --build -d

Les commandes sont identiques sur Windows, Linux et macOS.

COMMANDES UTILES:
-----------------
- Arrêter tous les services : docker-compose down
- Redémarrer : docker-compose restart
- Voir les logs : docker-compose logs -f
- Voir le statut : docker-compose ps

EN CAS DE PROBLÈME:
-------------------
1. Vérifiez que Docker Desktop est bien démarré
2. Vérifiez que les ports ne sont pas utilisés par d'autres applications
3. Si les services ne démarrent pas : docker-compose logs
4. Pour tout réinitialiser : docker-compose down -v && docker-compose up --build -d
