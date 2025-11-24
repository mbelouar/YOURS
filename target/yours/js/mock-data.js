// YOURS - Mock Data for Frontend Development

// Mock Equipment Data
const mockEquipment = [
    {
        idMateriel: 1,
        nom: "Canon EOS R5",
        prix: 150.00,
        disponibilite: true,
        idCategorie: 1,
        categorie: "Caméras",
        description: "Caméra professionnelle full-frame 45MP avec enregistrement vidéo 8K. Parfaite pour la photographie et la vidéographie professionnelle.",
        specifications: [
            "Capteur CMOS full-frame 45MP",
            "Enregistrement vidéo 8K RAW",
            "Stabilisation d'image 5 axes",
            "Écran tactile orientable 3.2\"",
            "Double slot carte mémoire"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80",
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80",
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: {
            idPartenaire: 1,
            nom: "Photo Pro Rental",
            rating: 4.8
        },
        popularityScore: 95,
        totalRentals: 156
    },
    {
        idMateriel: 2,
        nom: "Sony FX3",
        prix: 120.00,
        disponibilite: true,
        idCategorie: 1,
        categorie: "Caméras",
        description: "Caméra cinéma compacte full-frame avec capteur de 10.2MP optimisé pour la vidéo. Design compact et ergonomique.",
        specifications: [
            "Capteur CMOS full-frame 10.2MP",
            "Enregistrement 4K 120p",
            "S-Log3 et S-Gamut3.Cine",
            "Stabilisation d'image active",
            "Connectivité sans fil intégrée"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80",
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: {
            idPartenaire: 2,
            nom: "Ciné Equipment",
            rating: 4.9
        },
        popularityScore: 88,
        totalRentals: 134
    },
    {
        idMateriel: 3,
        nom: "DJI Ronin 4D",
        prix: 200.00,
        disponibilite: false,
        idCategorie: 2,
        categorie: "Stabilisateurs",
        description: "Système de caméra cinéma 4-axes tout-en-un avec gimbal intégré. Solution complète pour la production cinématographique.",
        specifications: [
            "Gimbal 4 axes intégré",
            "Caméra Zenmuse X9-8K",
            "Enregistrement ProRes RAW",
            "LiDAR Range Finder",
            "Système de suivi ActiveTrack Pro"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: {
            idPartenaire: 1,
            nom: "Photo Pro Rental",
            rating: 4.8
        },
        popularityScore: 92,
        totalRentals: 89
    },
    {
        idMateriel: 4,
        nom: "Arri SkyPanel S60-C",
        prix: 80.00,
        disponibilite: true,
        idCategorie: 3,
        categorie: "Éclairage",
        description: "Panneau LED couleur professionnel avec contrôle précis de la température de couleur et des effets spéciaux intégrés.",
        specifications: [
            "LED couleur RGBW",
            "Température 2800K-10000K",
            "CRI >95, TLCI >96",
            "Contrôle DMX/RDM",
            "Effets spéciaux intégrés"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80",
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: {
            idPartenaire: 3,
            nom: "Light & Sound Pro",
            rating: 4.7
        },
        popularityScore: 76,
        totalRentals: 203
    },
    {
        idMateriel: 5,
        nom: "Sennheiser MKE 600",
        prix: 35.00,
        disponibilite: true,
        idCategorie: 4,
        categorie: "Audio",
        description: "Microphone shotgun professionnel avec alimentation fantôme et batterie. Idéal pour l'enregistrement vidéo et cinéma.",
        specifications: [
            "Microphone shotgun directionnel",
            "Alimentation fantôme +48V ou batterie",
            "Filtre coupe-bas commutable",
            "Bonnette anti-vent incluse",
            "Connecteur XLR-3"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: {
            idPartenaire: 3,
            nom: "Light & Sound Pro",
            rating: 4.7
        },
        popularityScore: 82,
        totalRentals: 167
    },
    {
        idMateriel: 6,
        nom: "MacBook Pro M2 Max",
        prix: 100.00,
        disponibilite: true,
        idCategorie: 5,
        categorie: "Ordinateurs",
        description: "Ordinateur portable haute performance pour le montage vidéo 8K et les tâches créatives intensives.",
        specifications: [
            "Puce Apple M2 Max",
            "32GB RAM unifiée",
            "1TB SSD",
            "Écran Liquid Retina XDR 16\"",
            "Ports Thunderbolt 4"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: {
            idPartenaire: 4,
            nom: "Tech Solutions",
            rating: 4.6
        },
        popularityScore: 91,
        totalRentals: 145
    }
];

// Mock Categories Data
const mockCategories = [
    {
        idCategorie: 1,
        nomCategorie: "Caméras",
        description: "Caméras professionnelles et semi-professionnelles",
        icon: "bi-camera-video",
        equipmentCount: 45,
        color: "#667eea"
    },
    {
        idCategorie: 2,
        nomCategorie: "Stabilisateurs",
        description: "Gimbals et stabilisateurs pour caméras",
        icon: "bi-phone-vibrate",
        equipmentCount: 23,
        color: "#764ba2"
    },
    {
        idCategorie: 3,
        nomCategorie: "Éclairage",
        description: "Équipement d'éclairage professionnel",
        icon: "bi-lightbulb",
        equipmentCount: 67,
        color: "#f093fb"
    },
    {
        idCategorie: 4,
        nomCategorie: "Audio",
        description: "Microphones et équipement audio",
        icon: "bi-mic",
        equipmentCount: 34,
        color: "#4facfe"
    },
    {
        idCategorie: 5,
        nomCategorie: "Ordinateurs",
        description: "Ordinateurs et stations de montage",
        icon: "bi-laptop",
        equipmentCount: 18,
        color: "#43e97b"
    },
    {
        idCategorie: 6,
        nomCategorie: "Accessoires",
        description: "Trépieds, batteries et accessoires divers",
        icon: "bi-tools",
        equipmentCount: 89,
        color: "#38f9d7"
    }
];

// Mock Users Data
const mockUsers = {
    client: {
        idClient: 1,
        nom: "Benali",
        prenom: "Ahmed",
        mail: "ahmed.benali@email.com",
        adresse: "123 Rue Hassan II, Casablanca",
        numTelephone: "+212 6 12 34 56 78",
        dateNaissance: "1990-05-15",
        photoPerso: "assets/images/users/client-1.jpg",
        memberSince: "2023-01-15",
        totalReservations: 12,
        totalSpent: 2450.00
    },
    partner: {
        idPartenaire: 1,
        nom: "Alami",
        prenom: "Fatima",
        mail: "fatima.alami@photopro.ma",
        adresse: "456 Boulevard Zerktouni, Casablanca",
        numTelephone: "+212 5 22 34 56 78",
        photoPerso: "assets/images/users/partner-1.jpg",
        businessName: "Photo Pro Rental",
        memberSince: "2022-03-10",
        totalEquipment: 23,
        totalRevenue: 15670.00,
        rating: 4.8
    },
    admin: {
        idAdmin: 1,
        email: "admin@yours.ma",
        nom: "Administrateur",
        prenom: "Système"
    }
};

// Mock Reservations Data
const mockReservations = [
    {
        idReservation: 1,
        dateDebut: "2024-01-15",
        dateFin: "2024-01-18",
        reserve: true,
        status: "active",
        idClient: 1,
        idMateriel: 1,
        materiel: mockEquipment[0],
        client: mockUsers.client,
        totalPrice: 450.00,
        createdAt: "2024-01-10",
        notes: "Tournage documentaire"
    },
    {
        idReservation: 2,
        dateDebut: "2024-01-20",
        dateFin: "2024-01-22",
        reserve: true,
        status: "upcoming",
        idClient: 1,
        idMateriel: 4,
        materiel: mockEquipment[3],
        client: mockUsers.client,
        totalPrice: 160.00,
        createdAt: "2024-01-12",
        notes: "Éclairage studio"
    },
    {
        idReservation: 3,
        dateDebut: "2023-12-10",
        dateFin: "2023-12-15",
        reserve: true,
        status: "completed",
        idClient: 1,
        idMateriel: 2,
        materiel: mockEquipment[1],
        client: mockUsers.client,
        totalPrice: 600.00,
        createdAt: "2023-12-05",
        notes: "Projet vidéo corporate"
    }
];

// Mock Analytics Data
const mockAnalytics = {
    overview: {
        totalEquipment: 276,
        totalClients: 1247,
        totalPartners: 89,
        totalReservations: 3456,
        monthlyRevenue: 45670.00,
        growthRate: 12.5
    },
    popularEquipment: [
        { name: "Canon EOS R5", rentals: 156, revenue: 23400 },
        { name: "Sony FX3", rentals: 134, revenue: 16080 },
        { name: "DJI Ronin 4D", rentals: 89, revenue: 17800 },
        { name: "MacBook Pro M2", rentals: 145, revenue: 14500 },
        { name: "Arri SkyPanel", rentals: 203, revenue: 16240 }
    ],
    monthlyStats: [
        { month: "Jan", reservations: 245, revenue: 36750 },
        { month: "Fév", reservations: 289, revenue: 43350 },
        { month: "Mar", reservations: 312, revenue: 46800 },
        { month: "Avr", reservations: 298, revenue: 44700 },
        { month: "Mai", reservations: 334, revenue: 50100 },
        { month: "Jun", reservations: 356, revenue: 53400 }
    ],
    categoryDistribution: [
        { category: "Caméras", percentage: 35, count: 45 },
        { category: "Éclairage", percentage: 25, count: 67 },
        { category: "Audio", percentage: 15, count: 34 },
        { category: "Stabilisateurs", percentage: 12, count: 23 },
        { category: "Ordinateurs", percentage: 8, count: 18 },
        { category: "Accessoires", percentage: 5, count: 89 }
    ]
};

// Mock AI Predictions Data
const mockAIPredictions = {
    demandForecast: {
        equipmentId: 1,
        predictions: [
            { date: "2024-01-15", demand: 85, confidence: 0.92 },
            { date: "2024-01-16", demand: 78, confidence: 0.89 },
            { date: "2024-01-17", demand: 92, confidence: 0.94 },
            { date: "2024-01-18", demand: 88, confidence: 0.91 },
            { date: "2024-01-19", demand: 76, confidence: 0.87 },
            { date: "2024-01-20", demand: 95, confidence: 0.96 },
            { date: "2024-01-21", demand: 89, confidence: 0.93 }
        ]
    },
    priceOptimization: {
        equipmentId: 1,
        currentPrice: 150.00,
        recommendedPrice: 165.00,
        confidence: 0.88,
        expectedIncrease: 12.5,
        factors: [
            "Demande élevée prévue",
            "Saison haute",
            "Équipement populaire",
            "Concurrence limitée"
        ]
    },
    equipmentAnalysis: {
        equipmentId: 1,
        utilizationRate: 78.5,
        averageRentalDuration: 3.2,
        peakDemandPeriods: ["Vendredi-Dimanche", "Vacances scolaires"],
        maintenanceScore: 92,
        profitabilityScore: 88,
        recommendations: [
            "Augmenter le prix de 10% pendant les weekends",
            "Proposer des packages avec accessoires",
            "Maintenance préventive recommandée dans 2 mois"
        ]
    }
};

// Mock Notifications Data
const mockNotifications = [
    {
        id: 1,
        type: "reservation",
        title: "Nouvelle réservation",
        message: "Ahmed Benali a réservé Canon EOS R5 du 15/01 au 18/01",
        timestamp: "2024-01-10T14:30:00Z",
        read: false,
        icon: "bi-calendar-check",
        color: "success"
    },
    {
        id: 2,
        type: "maintenance",
        title: "Maintenance requise",
        message: "DJI Ronin 4D nécessite une maintenance préventive",
        timestamp: "2024-01-09T09:15:00Z",
        read: false,
        icon: "bi-tools",
        color: "warning"
    },
    {
        id: 3,
        type: "payment",
        title: "Paiement reçu",
        message: "Paiement de 450.00 MAD reçu pour la réservation #1",
        timestamp: "2024-01-08T16:45:00Z",
        read: true,
        icon: "bi-credit-card",
        color: "info"
    }
];

// Utility Functions for Mock Data
const MockDataUtils = {
    // Get equipment by ID
    getEquipmentById: (id) => {
        return mockEquipment.find(eq => eq.idMateriel === id);
    },
    
    // Get equipment by category
    getEquipmentByCategory: (categoryId) => {
        return mockEquipment.filter(eq => eq.idCategorie === categoryId);
    },
    
    // Search equipment
    searchEquipment: (query) => {
        const searchTerm = query.toLowerCase();
        return mockEquipment.filter(eq => 
            eq.nom.toLowerCase().includes(searchTerm) ||
            eq.description.toLowerCase().includes(searchTerm) ||
            eq.categorie.toLowerCase().includes(searchTerm)
        );
    },
    
    // Filter equipment by availability
    getAvailableEquipment: () => {
        return mockEquipment.filter(eq => eq.disponibilite);
    },
    
    // Get equipment by price range
    getEquipmentByPriceRange: (minPrice, maxPrice) => {
        return mockEquipment.filter(eq => 
            eq.prix >= minPrice && eq.prix <= maxPrice
        );
    },
    
    // Get popular equipment
    getPopularEquipment: (limit = 6) => {
        return mockEquipment
            .sort((a, b) => b.popularityScore - a.popularityScore)
            .slice(0, limit);
    },
    
    // Get user reservations
    getUserReservations: (userId, status = null) => {
        let reservations = mockReservations.filter(res => res.idClient === userId);
        if (status) {
            reservations = reservations.filter(res => res.status === status);
        }
        return reservations.sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt));
    },
    
    // Calculate total price for reservation
    calculateReservationPrice: (equipmentId, startDate, endDate) => {
        const equipment = MockDataUtils.getEquipmentById(equipmentId);
        if (!equipment) return 0;
        
        const start = new Date(startDate);
        const end = new Date(endDate);
        const days = Math.ceil((end - start) / (1000 * 60 * 60 * 24));
        
        return equipment.prix * days;
    },
    
    // Generate random reservation ID
    generateReservationId: () => {
        return Math.floor(Math.random() * 10000) + 1000;
    },
    
    // Format price
    formatPrice: (price) => {
        return new Intl.NumberFormat('fr-MA', {
            style: 'currency',
            currency: 'MAD'
        }).format(price);
    },
    
    // Format date
    formatDate: (dateString) => {
        return new Date(dateString).toLocaleDateString('fr-FR', {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });
    },
    
    // Get category by ID
    getCategoryById: (id) => {
        return mockCategories.find(cat => cat.idCategorie === id);
    },
    
    // Simulate API delay
    simulateApiDelay: (ms = 500) => {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
};

// Export for use in other files
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        mockEquipment,
        mockCategories,
        mockUsers,
        mockReservations,
        mockAnalytics,
        mockAIPredictions,
        mockNotifications,
        MockDataUtils
    };
}
