# 🚀 Guide de Développement YOURS

## Problème : Mes modifications ne s'affichent pas !

### ❌ Pourquoi ça ne marche pas automatiquement ?

Dans la configuration production (`docker-compose.yml`), votre application est empaquetée dans un fichier WAR. Les fichiers JSP, CSS et JS sont **compressés** dans ce WAR. Docker ne peut pas détecter vos modifications dans `java-app/src/main/webapp/` car il utilise le WAR déjà compilé.

**Architecture Production :**
```
java-app/src/main/webapp/  →  [Maven Build]  →  target/yours.war  →  [Docker Mount]  →  Tomcat
         ❌ Modifications                              ✅ Ce que Docker voit
```

## ✅ Solution 1 : Mode Développement (RECOMMANDÉ)

Le mode développement monte directement vos fichiers source dans Tomcat !

### Démarrer en mode développement :

```bash
make dev
```

**Ce qui se passe :**
- ✅ Vos fichiers JSP/CSS/JS sont montés en **direct** dans Tomcat
- ✅ Les modifications sont **immédiatement** visibles
- ✅ Pas besoin de rebuild pour les changements front-end
- ✅ Le hot-reload fonctionne pour Python (Flask)

**Architecture Développement :**
```
java-app/src/main/webapp/  →  [Docker Volume Mount]  →  Tomcat
         ✅ Modifications en temps réel !
```

### Workflow de développement :

#### Pour les fichiers front-end (JSP, CSS, JS) :
```bash
# 1. Démarrer en mode dev (une seule fois)
make dev

# 2. Éditer vos fichiers dans java-app/src/main/webapp/
# Par exemple : java-app/src/main/webapp/pages/client/dashboard.jsp

# 3. Rafraîchir le navigateur (Ctrl+F5)
# ✅ Vos changements sont visibles !
```

#### Pour le code Java (Servlets, DAO, Models) :
```bash
# Après avoir modifié du code Java
make dev-rebuild
```

#### Pour le code Python (AI Service) :
```bash
# Les changements Python sont automatiques grâce à Flask debug mode !
# Il suffit de sauvegarder le fichier
```

### Commandes utiles :

```bash
make dev          # Démarrer en mode développement
make dev-stop     # Arrêter le mode développement
make dev-logs     # Voir les logs en temps réel
make dev-restart  # Redémarrer les services
make dev-rebuild  # Rebuild pour changements Java
```

## ✅ Solution 2 : Mode Production (Pour tests de production)

Si vous voulez tester comme en production :

```bash
# 1. Modifier vos fichiers

# 2. Rebuild le WAR et redémarrer
make build-war
docker-compose restart tomcat

# Ou en une commande
make build
```

## 📊 Tableau Comparatif

| Aspect | Mode DEV (`make dev`) | Mode PROD (`make start`) |
|--------|----------------------|--------------------------|
| **Modifications JSP/CSS/JS** | ✅ Instantanées | ❌ Nécessite rebuild |
| **Modifications Java** | ⚠️ Rebuild requis (`make dev-rebuild`) | ❌ Rebuild complet |
| **Modifications Python** | ✅ Automatiques | ❌ Redémarrage requis |
| **Performance** | Légèrement plus lente | Optimale |
| **Usage** | Développement quotidien | Tests de production |

## 🔍 Débogage

### Les modifications ne s'affichent toujours pas ?

1. **Vérifier que vous êtes en mode dev :**
   ```bash
   docker-compose ps
   # Vérifier les volumes montés
   docker inspect yours-tomcat | grep -A 10 "Mounts"
   ```

2. **Vider le cache du navigateur :**
   - Chrome/Edge : `Ctrl + Shift + Delete`
   - Firefox : `Ctrl + Shift + Delete`
   - Ou utilisez : `Ctrl + F5` pour un refresh forcé

3. **Vérifier les logs Tomcat :**
   ```bash
   make dev-logs
   ```

4. **Redémarrer Tomcat :**
   ```bash
   make dev-restart
   ```

5. **Rebuild complet si nécessaire :**
   ```bash
   make dev-stop
   make dev
   ```

### Les fichiers ne se chargent pas ?

Vérifiez que les chemins sont corrects :
```bash
# Voir la structure dans le conteneur
docker exec yours-tomcat ls -la /usr/local/tomcat/webapps/ROOT/
```

## 🎯 Bonnes Pratiques

### ✅ À FAIRE :
- Utiliser `make dev` pour le développement quotidien
- Committer régulièrement vos changements
- Tester en mode production avant de pusher (`make build`)

### ❌ À ÉVITER :
- Modifier directement les fichiers dans `target/`
- Oublier de rebuild après des changements Java
- Utiliser le mode production pour développer

## 🆘 Problèmes Courants

### "Cannot find JSP file"
```bash
# Rebuild le WAR et redémarrer
make dev-rebuild
```

### "CSS/JS changes not showing"
```bash
# Vider le cache navigateur
# Ctrl + Shift + Delete
# Ou Ctrl + F5
```

### "Java changes not working"
```bash
# Rebuild pour les changements Java
make dev-rebuild
```

### "Port 8080 already in use"
```bash
# Arrêter les services existants
make dev-stop
# Ou
docker-compose down
```

## 📝 Structure des Fichiers

```
YOURS/
├── java-app/
│   └── src/
│       └── main/
│           ├── webapp/          ← VOS MODIFICATIONS ICI
│           │   ├── index.jsp
│           │   ├── pages/
│           │   ├── css/
│           │   ├── js/
│           │   └── WEB-INF/
│           └── java/
│               └── com/yours/   ← Changements Java ici
├── target/
│   ├── yours.war               ← WAR compilé
│   └── yours/                  ← WAR extrait (mode dev)
├── docker-compose.yml          ← Config production
├── docker-compose.dev.yml      ← Config développement
└── Makefile                    ← Commandes make
```

## 🚀 Quick Start

```bash
# 1. Première fois
make dev

# 2. Éditer vos fichiers front-end
# java-app/src/main/webapp/pages/...

# 3. Rafraîchir le navigateur
# Ctrl + F5

# 4. Pour les changements Java
make dev-rebuild

# 5. Arrêter quand vous avez fini
make dev-stop
```

## 💡 Astuces Pro

### Auto-refresh navigateur
Installez une extension de live-reload dans votre navigateur :
- Chrome : [LiveReload](https://chrome.google.com/webstore/detail/livereload)
- Firefox : [LiveReload](https://addons.mozilla.org/en-US/firefox/addon/livereload-web-extension/)

### Éditeur recommandé
- **IntelliJ IDEA** : Support complet JEE, hot-swap Java
- **VS Code** : Avec extensions Java et Tomcat

### Logs en temps réel
```bash
# Terminal 1 : Logs
make dev-logs

# Terminal 2 : Commandes
# Votre développement
```

## 📚 Ressources

- [Documentation Maven](https://maven.apache.org/)
- [Tomcat Documentation](https://tomcat.apache.org/)
- [Docker Compose Docs](https://docs.docker.com/compose/)

---

**Besoin d'aide ?** Consultez les logs : `make dev-logs`
