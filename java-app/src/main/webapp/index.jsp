<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOURS - Système de gestion de location de matériel</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            text-align: center;
            color: white;
            margin-bottom: 40px;
        }
        .header h1 {
            font-size: 3em;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        .header p {
            font-size: 1.2em;
            opacity: 0.9;
        }
        .services {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }
        .service-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }
        .service-card:hover {
            transform: translateY(-5px);
        }
        .service-card h3 {
            color: #333;
            margin-bottom: 15px;
            font-size: 1.5em;
        }
        .service-card p {
            color: #666;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .service-link {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 25px;
            transition: opacity 0.3s ease;
        }
        .service-link:hover {
            opacity: 0.8;
        }
        .status {
            background: rgba(255,255,255,0.1);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            color: white;
        }
        .status h3 {
            margin-top: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>YOURS</h1>
            <p>Système intelligent de gestion de location de matériel</p>
            <p>Caméras, outils, équipements</p>
        </div>

        <div class="status">
            <h3>🚀 Services Status</h3>
            <p><strong>Java Application:</strong> <span style="color: #4CAF50;">● Running</span> on port 8080</p>
            <p><strong>MySQL Database:</strong> <span style="color: #4CAF50;">● Connected</span> on port 3306</p>
            <p><strong>AI Service:</strong> <span style="color: #4CAF50;">● Active</span> on port 5000</p>
        </div>

        <div class="services">
            <div class="service-card">
                <h3>🎥 Équipements</h3>
                <p>Gérez votre inventaire de caméras, outils et équipements. Ajoutez, modifiez et suivez l'état de vos matériels.</p>
                <a href="/yours/api/equipment" class="service-link">Voir l'API</a>
            </div>

            <div class="service-card">
                <h3>🤖 IA & Analytics</h3>
                <p>Service d'intelligence artificielle pour l'analyse prédictive et l'optimisation des locations.</p>
                <a href="http://localhost:5000" class="service-link" target="_blank">Accéder au service IA</a>
            </div>

            <div class="service-card">
                <h3>📊 Base de données</h3>
                <p>Accédez directement à votre base de données MySQL pour des requêtes avancées et la maintenance.</p>
                <a href="#" class="service-link">phpMyAdmin (à configurer)</a>
            </div>

            <div class="service-card">
                <h3>📋 Documentation</h3>
                <p>Consultez la documentation complète de l'API et les guides d'utilisation du système.</p>
                <a href="/yours/docs" class="service-link">Documentation</a>
            </div>
        </div>
    </div>

    <script>
        // Simple status check
        fetch('/yours/api/health')
            .then(response => response.json())
            .then(data => {
                console.log('Application Status:', data);
            })
            .catch(error => {
                console.log('Application Status Check:', 'Not available');
            });
    </script>
</body>
</html>
