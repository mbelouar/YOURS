-- Simplify client table to only include fields used in registration
-- This script removes unnecessary columns from the client table

-- First, create a backup of existing data (optional)
-- CREATE TABLE client_backup AS SELECT * FROM client;

-- Remove unnecessary columns from client table
ALTER TABLE `client` 
DROP COLUMN `adresse`,
DROP COLUMN `cinRECTO`, 
DROP COLUMN `cinVERSO`,
DROP COLUMN `dateNaissance`,
DROP COLUMN `photoPerso`;

-- The simplified client table now only contains:
-- idClient (auto-increment primary key)
-- nom (last name)
-- prenom (first name) 
-- mail (email - unique)
-- numTelephone (phone number)
-- motDepasse (hashed password)
