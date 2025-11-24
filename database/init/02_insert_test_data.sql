-- Script pour insérer des données de test

-- ========================================
-- INSERTION DES CATÉGORIES
-- ========================================
INSERT INTO categorie (nomCategorie) VALUES 
('Caméras et Vidéo'),
('Audio et Son'),
('Éclairage'),
('Informatique'),
('Mobilier et Décoration')
ON DUPLICATE KEY UPDATE nomCategorie=VALUES(nomCategorie);

-- ========================================
-- INSERTION DES PARTENAIRES
-- ========================================

-- Partenaire 1: Mohammed Belouarraq
INSERT INTO partenaire (nom, prenom, mail, numTelephone, motDepasse, nomEntreprise, typeActivite, adresse, cinRECTO, cinVERSO, photoPerso) 
VALUES ('Belouarraq', 'Mohammed', 'mohammed.belouarraq@gmail.com', '0661234567', 'password123', 
        'TechRent Morocco', 'Location matériel informatique', 'Casablanca, Maroc', 
        'cin_mohammed_recto.jpg', 'cin_mohammed_verso.jpg', 'photo_mohammed.jpg')
ON DUPLICATE KEY UPDATE nom='Belouarraq', prenom='Mohammed';

-- Partenaire 2: Imane Elkhoumsi
INSERT INTO partenaire (nom, prenom, mail, numTelephone, motDepasse, nomEntreprise, typeActivite, adresse, cinRECTO, cinVERSO, photoPerso) 
VALUES ('Elkhoumsi', 'Imane', 'imane.elkhoumsi@gmail.com', '0662345678', 'password123', 
        'CineRent Maroc', 'Location équipement audiovisuel', 'Rabat, Maroc', 
        'cin_imane_recto.jpg', 'cin_imane_verso.jpg', 'photo_imane.jpg')
ON DUPLICATE KEY UPDATE nom='Elkhoumsi', prenom='Imane';

-- Partenaire 3: Youssef Bennani
INSERT INTO partenaire (nom, prenom, mail, numTelephone, motDepasse, nomEntreprise, typeActivite, adresse, cinRECTO, cinVERSO, photoPerso) 
VALUES ('Bennani', 'Youssef', 'youssef.bennani@gmail.com', '0663456789', 'password123', 
        'EventPro Marrakech', 'Location matériel événementiel', 'Marrakech, Maroc', 
        'cin_youssef_recto.jpg', 'cin_youssef_verso.jpg', 'photo_youssef.jpg')
ON DUPLICATE KEY UPDATE nom='Bennani', prenom='Youssef';

-- Partenaire 4: Fatima Zahra Alami
INSERT INTO partenaire (nom, prenom, mail, numTelephone, motDepasse, nomEntreprise, typeActivite, adresse, cinRECTO, cinVERSO, photoPerso) 
VALUES ('Alami', 'Fatima Zahra', 'fatima.alami@gmail.com', '0664567890', 'password123', 
        'Studio Light Fès', 'Location éclairage professionnel', 'Fès, Maroc', 
        'cin_fatima_recto.jpg', 'cin_fatima_verso.jpg', 'photo_fatima.jpg')
ON DUPLICATE KEY UPDATE nom='Alami', prenom='Fatima Zahra';

-- ========================================
-- INSERTION DES CLIENTS
-- ========================================

-- Client 1: Maha Elhanoudi
INSERT INTO client (nom, prenom, mail, numTelephone, motDepasse) 
VALUES ('Elhanoudi', 'Maha', 'maha.elhanoudi@gmail.com', '0665678901', 'password123')
ON DUPLICATE KEY UPDATE nom='Elhanoudi', prenom='Maha';

-- Client 2: Amine Tazi
INSERT INTO client (nom, prenom, mail, numTelephone, motDepasse) 
VALUES ('Tazi', 'Amine', 'amine.tazi@gmail.com', '0666789012', 'password123')
ON DUPLICATE KEY UPDATE nom='Tazi', prenom='Amine';

-- Client 3: Salma Berrada
INSERT INTO client (nom, prenom, mail, numTelephone, motDepasse) 
VALUES ('Berrada', 'Salma', 'salma.berrada@gmail.com', '0667890123', 'password123')
ON DUPLICATE KEY UPDATE nom='Berrada', prenom='Salma';

-- Client 4: Omar Cherkaoui
INSERT INTO client (nom, prenom, mail, numTelephone, motDepasse) 
VALUES ('Cherkaoui', 'Omar', 'omar.cherkaoui@gmail.com', '0668901234', 'password123')
ON DUPLICATE KEY UPDATE nom='Cherkaoui', prenom='Omar';

-- Client 5: Aicha Benali
INSERT INTO client (nom, prenom, mail, numTelephone, motDepasse) 
VALUES ('Benali', 'Aicha', 'aicha.benali@gmail.com', '0669012345', 'password123')
ON DUPLICATE KEY UPDATE nom='Benali', prenom='Aicha';

-- Client 6: Ghita (ancien client de test - conservé)
INSERT INTO client (nom, prenom, mail, numTelephone, motDepasse) 
VALUES ('Ghita', 'Test', 'ghita@test.com', '0648271183', 'password123')
ON DUPLICATE KEY UPDATE nom='Ghita', prenom='Test', numTelephone='0648271183';

-- ========================================
-- INSERTION DU MATÉRIEL
-- ========================================

-- Récupérer les IDs des partenaires
SET @mohammed_id = (SELECT idPartenaire FROM partenaire WHERE mail = 'mohammed.belouarraq@gmail.com' LIMIT 1);
SET @imane_id = (SELECT idPartenaire FROM partenaire WHERE mail = 'imane.elkhoumsi@gmail.com' LIMIT 1);
SET @youssef_id = (SELECT idPartenaire FROM partenaire WHERE mail = 'youssef.bennani@gmail.com' LIMIT 1);
SET @fatima_id = (SELECT idPartenaire FROM partenaire WHERE mail = 'fatima.alami@gmail.com' LIMIT 1);

-- Récupérer les IDs des catégories
SET @cat_camera = (SELECT idCategorie FROM categorie WHERE nomCategorie = 'Caméras et Vidéo' LIMIT 1);
SET @cat_audio = (SELECT idCategorie FROM categorie WHERE nomCategorie = 'Audio et Son' LIMIT 1);
SET @cat_eclairage = (SELECT idCategorie FROM categorie WHERE nomCategorie = 'Éclairage' LIMIT 1);
SET @cat_informatique = (SELECT idCategorie FROM categorie WHERE nomCategorie = 'Informatique' LIMIT 1);
SET @cat_mobilier = (SELECT idCategorie FROM categorie WHERE nomCategorie = 'Mobilier et Décoration' LIMIT 1);

-- Matériel de Mohammed (TechRent Morocco)
INSERT INTO materiel (nom, disponibilite, prix, description, idPartenaire, idCategorie) VALUES
('MacBook Pro 16"', 1, 150.00, 'Ordinateur portable haute performance pour montage vidéo', @mohammed_id, @cat_informatique),
('Écran 4K Dell', 1, 80.00, 'Moniteur professionnel 27 pouces 4K', @mohammed_id, @cat_informatique),
('Clavier mécanique', 1, 25.00, 'Clavier gaming RGB', @mohammed_id, @cat_informatique);

-- Matériel d''Imane (CineRent Maroc)
INSERT INTO materiel (nom, disponibilite, prix, description, idPartenaire, idCategorie) VALUES
('Caméra Sony A7S III', 1, 200.00, 'Caméra professionnelle pour vidéo 4K', @imane_id, @cat_camera),
('Objectif Canon 24-70mm', 1, 120.00, 'Objectif zoom professionnel', @imane_id, @cat_camera),
('Trépied Manfrotto', 1, 40.00, 'Trépied carbone professionnel', @imane_id, @cat_camera),
('Micro-cravate Rode', 1, 60.00, 'Microphone sans fil professionnel', @imane_id, @cat_audio);

-- Matériel de Youssef (EventPro Marrakech)
INSERT INTO materiel (nom, disponibilite, prix, description, idPartenaire, idCategorie) VALUES
('Table ronde 8 personnes', 1, 35.00, 'Table élégante pour événements', @youssef_id, @cat_mobilier),
('Chaises Chiavari dorées', 1, 8.00, 'Chaises de luxe pour mariages (prix à l''unité)', @youssef_id, @cat_mobilier),
('Sono portable JBL', 1, 90.00, 'Système audio portable 500W', @youssef_id, @cat_audio);

-- Matériel de Fatima (Studio Light Fès)
INSERT INTO materiel (nom, disponibilite, prix, description, idPartenaire, idCategorie) VALUES
('Kit éclairage LED', 1, 110.00, 'Kit complet 3 panneaux LED avec trépieds', @fatima_id, @cat_eclairage),
('Softbox professionnel', 1, 45.00, 'Diffuseur de lumière 80x120cm', @fatima_id, @cat_eclairage),
('Réflecteur 5-en-1', 1, 20.00, 'Réflecteur pliable multi-surfaces', @fatima_id, @cat_eclairage);

-- ========================================
-- INSERTION DES RÉSERVATIONS
-- ========================================

-- Récupérer les IDs des clients
SET @maha_id = (SELECT idClient FROM client WHERE mail = 'maha.elhanoudi@gmail.com' LIMIT 1);
SET @amine_id = (SELECT idClient FROM client WHERE mail = 'amine.tazi@gmail.com' LIMIT 1);
SET @salma_id = (SELECT idClient FROM client WHERE mail = 'salma.berrada@gmail.com' LIMIT 1);
SET @omar_id = (SELECT idClient FROM client WHERE mail = 'omar.cherkaoui@gmail.com' LIMIT 1);
SET @ghita_id = (SELECT idClient FROM client WHERE mail = 'ghita@test.com' LIMIT 1);

-- Réservations pour Maha
INSERT INTO reservation (dateDebut, dateFin, reserve, idClient, idMateriel)
SELECT DATE_ADD(CURDATE(), INTERVAL 2 DAY), DATE_ADD(CURDATE(), INTERVAL 5 DAY), 0, @maha_id, idMateriel
FROM materiel WHERE nom = 'Caméra Sony A7S III' LIMIT 1;

INSERT INTO reservation (dateDebut, dateFin, reserve, idClient, idMateriel)
SELECT DATE_ADD(CURDATE(), INTERVAL 2 DAY), DATE_ADD(CURDATE(), INTERVAL 5 DAY), 0, @maha_id, idMateriel
FROM materiel WHERE nom = 'Trépied Manfrotto' LIMIT 1;

-- Réservations pour Amine
INSERT INTO reservation (dateDebut, dateFin, reserve, idClient, idMateriel)
SELECT DATE_ADD(CURDATE(), INTERVAL 7 DAY), DATE_ADD(CURDATE(), INTERVAL 10 DAY), 0, @amine_id, idMateriel
FROM materiel WHERE nom = 'MacBook Pro 16"' LIMIT 1;

-- Réservations pour Salma
INSERT INTO reservation (dateDebut, dateFin, reserve, idClient, idMateriel)
SELECT DATE_ADD(CURDATE(), INTERVAL 1 DAY), DATE_ADD(CURDATE(), INTERVAL 3 DAY), 1, @salma_id, idMateriel
FROM materiel WHERE nom = 'Kit éclairage LED' LIMIT 1;

-- Réservations pour Omar
INSERT INTO reservation (dateDebut, dateFin, reserve, idClient, idMateriel)
SELECT DATE_ADD(CURDATE(), INTERVAL 14 DAY), DATE_ADD(CURDATE(), INTERVAL 16 DAY), 0, @omar_id, idMateriel
FROM materiel WHERE nom = 'Table ronde 8 personnes' LIMIT 1;

-- Réservations pour Ghita (ancien client de test)
INSERT INTO reservation (dateDebut, dateFin, reserve, idClient, idMateriel)
SELECT DATE_ADD(CURDATE(), INTERVAL 5 DAY), DATE_ADD(CURDATE(), INTERVAL 7 DAY), 0, @ghita_id, idMateriel
FROM materiel WHERE nom = 'Sono portable JBL' LIMIT 1;

-- ========================================
-- INSERTION D'UN ADMIN
-- ========================================
INSERT INTO admin (email, motDepasse) 
VALUES ('admin@yours.ma', 'admin123')
ON DUPLICATE KEY UPDATE email='admin@yours.ma';


