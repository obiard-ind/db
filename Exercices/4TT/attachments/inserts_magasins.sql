-- Enregistrements pour la table magasins
-- 30 magasins
-- 10 noms différents
-- 20 codes postaux différents : 18 issus de la table villes + 2 codes postaux belges absents de villes
-- 25 magasins avec un gerant existant, 5 magasins avec gerant = NULL

INSERT INTO magasins(nom, cp, gerant) VALUES
('Lidl', '6000', 1),
('Carrefour', '5000', 2),
('Colruyt', '4000', 3),
('Spar', '7000', 4),
('Trafic', '7500', 5),
('Lidl', '1400', 6),
('Carrefour', '1300', 7),
('Colruyt', '1340', 8),
('Spar', '4100', 9),
('Trafic', '4800', 10),
('Lidl', '7100', 11),
('Carrefour', '6200', 12),
('Colruyt', '7700', 13),
('Spar', '4500', 14),
('Trafic', '5300', 15),
('Lidl', '6900', 16),
('Carrefour', '6600', 17),
('Colruyt', '6700', 18),
('Spar', '6000', 19),
('Trafic', '5000', 20),
('Le Comptoir du Bio', '4000', 21),
('Librairie Point-Virgule', '7000', 22),
('Au Panier Wallon', '7500', 23),
('La Petite Épicerie', '1400', 24),
('Saveurs du Coin', '1300', 25),
('Lidl', '1340', NULL),
('Carrefour', '4100', NULL),
('Colruyt', '4800', NULL),
('Spar', '1000', NULL),
('Trafic', '2000', NULL);
