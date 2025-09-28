#!/bin/bash

# YOURS - Build Script
# Script pour construire et déployer le système YOURS

set -e

echo "🏗️  Construction du système YOURS..."

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages colorés
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Vérifier si Docker est installé
check_docker() {
    if ! command -v docker &> /dev/null; then
        print_error "Docker n'est pas installé. Veuillez installer Docker d'abord."
        exit 1
    fi
    
    if ! command -v docker-compose &> /dev/null; then
        print_error "Docker Compose n'est pas installé. Veuillez installer Docker Compose d'abord."
        exit 1
    fi
    
    print_success "Docker et Docker Compose sont installés"
}

# Vérifier le fichier .env
check_env() {
    if [ ! -f ".env" ]; then
        print_warning "Fichier .env non trouvé. Création à partir du template..."
        if [ -f "env.template" ]; then
            cp env.template .env
            print_success "Fichier .env créé à partir du template"
            print_warning "Veuillez modifier le fichier .env avec vos paramètres avant de continuer"
        else
            print_error "Template env.template non trouvé"
            exit 1
        fi
    else
        print_success "Fichier .env trouvé"
    fi
}

# Construire l'application Java
build_java_app() {
    print_status "Construction de l'application Java..."
    
    if [ -d "java-app" ]; then
        cd java-app
        
        # Vérifier si Maven est disponible
        if command -v mvn &> /dev/null; then
            print_status "Compilation avec Maven..."
            mvn clean package -DskipTests
            print_success "Application Java compilée"
        else
            print_warning "Maven non disponible. Création d'un WAR factice..."
            mkdir -p target
            touch target/yours.war
        fi
        
        cd ..
    else
        print_warning "Répertoire java-app non trouvé. Création d'un WAR factice..."
        mkdir -p target
        touch target/yours.war
    fi
}

# Construire les images Docker
build_docker_images() {
    print_status "Construction des images Docker..."
    
    # Construire l'image Java
    if [ -f "Dockerfile.java" ]; then
        print_status "Construction de l'image Tomcat..."
        docker build -f Dockerfile.java -t yours-tomcat .
        print_success "Image Tomcat construite"
    fi
    
    # Construire l'image Python
    if [ -f "Dockerfile.python" ]; then
        print_status "Construction de l'image AI Service..."
        docker build -f Dockerfile.python -t yours-ai-service .
        print_success "Image AI Service construite"
    fi
}

# Démarrer les services
start_services() {
    print_status "Démarrage des services..."
    
    # Arrêter les services existants
    docker-compose down 2>/dev/null || true
    
    # Démarrer les services
    docker-compose up -d
    
    print_success "Services démarrés"
}

# Vérifier le statut des services
check_services() {
    print_status "Vérification du statut des services..."
    
    sleep 10  # Attendre que les services démarrent
    
    # Vérifier MySQL
    if docker-compose exec mysql mysqladmin ping -h localhost --silent; then
        print_success "MySQL est en cours d'exécution"
    else
        print_warning "MySQL ne répond pas encore"
    fi
    
    # Vérifier Tomcat
    if curl -s http://localhost:8080 > /dev/null; then
        print_success "Tomcat est accessible"
    else
        print_warning "Tomcat n'est pas encore accessible"
    fi
    
    # Vérifier le service IA
    if curl -s http://localhost:5000/health > /dev/null; then
        print_success "Service IA est accessible"
    else
        print_warning "Service IA n'est pas encore accessible"
    fi
}

# Afficher les informations de connexion
show_info() {
    echo ""
    echo "🎉 Construction terminée!"
    echo ""
    echo "📋 Services disponibles:"
    echo "  • Application Java:  http://localhost:8080"
    echo "  • Service IA:        http://localhost:5000"
    echo "  • Base de données:   http://localhost:3306"
    echo ""
    echo "📝 Commandes utiles:"
    echo "  • Voir les logs:     docker-compose logs -f"
    echo "  • Arrêter:           docker-compose down"
    echo "  • Redémarrer:        docker-compose restart"
    echo ""
    echo "🔧 Configuration:"
    echo "  • Fichier .env:      Modifiez selon vos besoins"
    echo "  • Base de données:   Utilisateur 'yours_user' créé"
    echo ""
}

# Fonction principale
main() {
    echo "🚀 Démarrage du script de construction YOURS"
    echo ""
    
    check_docker
    check_env
    build_java_app
    build_docker_images
    start_services
    check_services
    show_info
}

# Exécuter le script principal
main "$@"
