-- Remove all unnecessary columns from client table
-- Keep only: idClient, nom, prenom, mail, numTelephone, motDepasse

-- Remove unnecessary columns
ALTER TABLE `client` 
DROP COLUMN `dateCreation`,
DROP COLUMN `dateModification`,
DROP COLUMN `dernierConnexion`,
DROP COLUMN `actif`,
DROP COLUMN `emailVerifie`,
DROP COLUMN `tokenVerification`;

-- The simplified client table now only contains:
-- idClient (auto-increment primary key)
-- nom (last name)
-- prenom (first name) 
-- mail (email - unique)
-- numTelephone (phone number)
-- motDepasse (hashed password)
