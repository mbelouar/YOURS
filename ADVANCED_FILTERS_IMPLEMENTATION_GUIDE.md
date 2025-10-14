# Advanced Filters Implementation Guide

## 📊 Current Status

### ✅ What's Working (Frontend Only)

- UI panel shows/hides when clicking the filter button
- Form inputs for:
  - **Price Range** (Min/Max) - Maps to `materiel.prix`
  - **Availability** - Maps to `materiel.disponibilite` (1=available, 0=not available)
  - **Category** - Maps to `materiel.idCategorie`
- Reset button clears all filter values
- **NOT CONNECTED TO DATABASE YET**

---

## 🔧 How to Connect to Your Database

### Step 1: Create a Filter Servlet

Create a new file: `java-app/src/main/java/com/yours/servlet/EquipmentFilterServlet.java`

```java
package com.yours.servlet;

import com.yours.dao.MaterielDAO;
import com.yours.model.Materiel;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/api/equipment/filter")
public class EquipmentFilterServlet extends HttpServlet {

    private MaterielDAO materielDAO;
    private ObjectMapper objectMapper;

    @Override
    public void init() throws ServletException {
        materielDAO = new MaterielDAO();
        objectMapper = new ObjectMapper();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get filter parameters
        String priceMinStr = request.getParameter("priceMin");
        String priceMaxStr = request.getParameter("priceMax");
        String availabilityStr = request.getParameter("availability");
        String categoryIdStr = request.getParameter("categoryId");
        String sortBy = request.getParameter("sortBy"); // NEW: Sort parameter

        // Parse parameters
        Float priceMin = (priceMinStr != null && !priceMinStr.isEmpty())
            ? Float.parseFloat(priceMinStr) : null;
        Float priceMax = (priceMaxStr != null && !priceMaxStr.isEmpty())
            ? Float.parseFloat(priceMaxStr) : null;
        Integer availability = (availabilityStr != null && !availabilityStr.isEmpty())
            ? Integer.parseInt(availabilityStr) : null;
        Integer categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty())
            ? Integer.parseInt(categoryIdStr) : null;

        // Get filtered equipment from database
        List<Materiel> filteredEquipment = materielDAO.filterEquipment(
            priceMin, priceMax, availability, categoryId, sortBy
        );

        // Return JSON response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        objectMapper.writeValue(response.getWriter(), filteredEquipment);
    }
}
```

---

### Step 2: Add Filter Method to MaterielDAO

Update `java-app/src/main/java/com/yours/dao/MaterielDAO.java`:

```java
package com.yours.dao;

import com.yours.model.Materiel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MaterielDAO {

    private Connection connection;

    public MaterielDAO() {
        // Your database connection setup
        // this.connection = DatabaseConnection.getConnection();
    }

    /**
     * Filter equipment based on multiple criteria
     */
    public List<Materiel> filterEquipment(Float priceMin, Float priceMax,
                                          Integer availability, Integer categoryId, String sortBy) {
        List<Materiel> equipmentList = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
            "SELECT m.*, c.nomCategorie " +
            "FROM materiel m " +
            "LEFT JOIN categorie c ON m.idCategorie = c.idCategorie " +
            "WHERE 1=1"
        );

        // Build dynamic WHERE clause
        if (priceMin != null) {
            sql.append(" AND m.prix >= ?");
        }
        if (priceMax != null) {
            sql.append(" AND m.prix <= ?");
        }
        if (availability != null) {
            sql.append(" AND m.disponibilite = ?");
        }
        if (categoryId != null) {
            sql.append(" AND m.idCategorie = ?");
        }

        // Add ORDER BY clause based on sortBy parameter
        sql.append(" ORDER BY ");
        switch (sortBy != null ? sortBy : "name-asc") {
            case "name-desc":
                sql.append("m.nom DESC");
                break;
            case "price-asc":
                sql.append("m.prix ASC");
                break;
            case "price-desc":
                sql.append("m.prix DESC");
                break;
            case "availability":
                sql.append("m.disponibilite DESC, m.nom ASC");
                break;
            case "name-asc":
            default:
                sql.append("m.nom ASC");
                break;
        }

        try (PreparedStatement stmt = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (priceMin != null) {
                stmt.setFloat(paramIndex++, priceMin);
            }
            if (priceMax != null) {
                stmt.setFloat(paramIndex++, priceMax);
            }
            if (availability != null) {
                stmt.setInt(paramIndex++, availability);
            }
            if (categoryId != null) {
                stmt.setInt(paramIndex++, categoryId);
            }

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Materiel materiel = new Materiel();
                materiel.setIdMateriel(rs.getInt("idMateriel"));
                materiel.setNom(rs.getString("nom"));
                materiel.setDisponibilite(rs.getBoolean("disponibilite"));
                materiel.setPrix(rs.getFloat("prix"));
                materiel.setIdPartenaire(rs.getInt("idPartenaire"));
                materiel.setIdCategorie(rs.getInt("idCategorie"));

                equipmentList.add(materiel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return equipmentList;
    }
}
```

---

### Step 3: Update Frontend JavaScript

Add this to the "Appliquer" button in `list-simple.jsp`:

```javascript
// Add ID to Apply button first
<button
  id="applyFilters"
  class="btn btn-sm btn-primary"
  style="border-radius: 0.5rem; padding: 0.5rem 1rem;"
>
  <i class="fas fa-check me-1"></i>Appliquer
</button>;

// Then in the JavaScript section:
document.getElementById("applyFilters").addEventListener("click", function () {
  // Get filter values
  const priceMin = document.getElementById("priceMin").value;
  const priceMax = document.getElementById("priceMax").value;
  const availability = document.getElementById("availabilityFilter").value;
  const categoryId = document.getElementById("categoryFilterAdvanced").value;

  // Build query string
  const params = new URLSearchParams();
  if (priceMin) params.append("priceMin", priceMin);
  if (priceMax) params.append("priceMax", priceMax);
  if (availability) params.append("availability", availability);
  if (categoryId) params.append("categoryId", categoryId);

  // Call backend API
  fetch(
    `${
      pageContext.request.contextPath
    }/api/equipment/filter?${params.toString()}`
  )
    .then((response) => response.json())
    .then((data) => {
      // Update the equipment grid with filtered results
      updateEquipmentGrid(data);

      // Update results count
      document.querySelector(".results-count-badge span").textContent =
        data.length;

      // Close the advanced filter panel
      document.getElementById("advancedFiltersPanel").style.display = "none";
      document.getElementById("advancedFilterToggle").style.background =
        "linear-gradient(135deg, var(--primary-600), var(--primary-700))";
    })
    .catch((error) => {
      console.error("Error filtering equipment:", error);
      alert("Erreur lors du filtrage des équipements");
    });
});

function updateEquipmentGrid(equipmentList) {
  const grid = document.getElementById("equipmentGrid");
  grid.innerHTML = ""; // Clear current items

  if (equipmentList.length === 0) {
    grid.innerHTML = `
            <div class="col-12 text-center py-5">
                <i class="fas fa-search" style="font-size: 3rem; color: var(--gray-300);"></i>
                <h4 class="mt-3">Aucun équipement trouvé</h4>
                <p class="text-muted">Essayez de modifier vos filtres</p>
            </div>
        `;
    return;
  }

  equipmentList.forEach((equipment) => {
    const card = createEquipmentCard(equipment);
    grid.appendChild(card);
  });
}

function createEquipmentCard(equipment) {
  const col = document.createElement("div");
  col.className = "col-lg-4 col-md-6";

  col.innerHTML = `
        <div class="card card-modern card-equipment h-100">
            <div class="position-relative">
                <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80" 
                     class="card-img-top" alt="${equipment.nom}">
                <div class="availability-badge">${
                  equipment.disponibilite ? "Disponible" : "Non disponible"
                }</div>
                <div class="price-badge">${equipment.prix} MAD/jour</div>
            </div>
            <div class="card-body">
                <h5 class="card-title mb-2">${equipment.nom}</h5>
                <div class="d-flex justify-content-between align-items-center">
                    <a href="${
                      pageContext.request.contextPath
                    }/pages/equipment/detail.jsp?id=${equipment.idMateriel}" 
                       class="btn btn-primary btn-sm" style="flex: 1; margin-right: 0.5rem;">
                        <i class="fas fa-eye me-1"></i>Voir
                    </a>
                    <button class="btn btn-outline-primary btn-sm" style="flex: 1;">
                        <i class="fas fa-calendar-plus me-1"></i>Réserver
                    </button>
                </div>
            </div>
        </div>
    `;

  return col;
}
```

---

## 📝 Summary

### What You Need to Do:

1. ✅ **Frontend is ready** - UI and JavaScript prepared
2. ⏳ **Create EquipmentFilterServlet** - Handle filter requests
3. ⏳ **Add filterEquipment() to MaterielDAO** - Query database with filters
4. ⏳ **Add Jackson dependency** to `pom.xml` for JSON:
   ```xml
   <dependency>
       <groupId>com.fasterxml.jackson.core</groupId>
       <artifactId>jackson-databind</artifactId>
       <version>2.15.2</version>
   </dependency>
   ```
5. ⏳ **Test the integration**

### Filter Mapping to Database:

| Filter Field  | Database Column          | Type    | Values             |
| ------------- | ------------------------ | ------- | ------------------ |
| Price Min/Max | `materiel.prix`          | float   | any number         |
| Availability  | `materiel.disponibilite` | tinyint | 1 (yes) or 0 (no)  |
| Category      | `materiel.idCategorie`   | int     | 1-6 (category IDs) |

### Sort Options Mapping:

| Sort Option      | Database Query                             | Status       |
| ---------------- | ------------------------------------------ | ------------ |
| Nom (A-Z)        | `ORDER BY m.nom ASC`                       | ✅ Works now |
| Nom (Z-A)        | `ORDER BY m.nom DESC`                      | ✅ Works now |
| Prix croissant   | `ORDER BY m.prix ASC`                      | ✅ Works now |
| Prix décroissant | `ORDER BY m.prix DESC`                     | ✅ Works now |
| Disponibilité    | `ORDER BY m.disponibilite DESC, m.nom ASC` | ✅ Works now |

**Future sort options** (require database changes):

- Popularité → Need `nombreReservations` column or calculate from `reservation` table
- Nouveautés → Need `dateAjout` TIMESTAMP column
- Meilleures notes → Need `note` FLOAT column

---

## 🚀 Once Implemented:

The filters will:

- ✅ Send filter criteria to backend servlet
- ✅ Query database with WHERE conditions
- ✅ Return filtered JSON results
- ✅ Update UI with filtered equipment
- ✅ Show count of filtered results
- ✅ Work seamlessly with your existing database

**Currently**: Only frontend UI is functional  
**After implementation**: Full database integration ✓
