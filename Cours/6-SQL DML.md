DML (Data Manipulation Language) concerne les commmandes utilisées pour **ajouter**, **modifier**, **supprimer** des enregistrements dans les tables de notre base de données.

# Ajouter des enregistrements : INSERT 
Pour ajouter des enregistrements dans une table; on utilisera la commande SQL `INSERT INTO`
Syntaxe :
```sql
INSERT INTO nom_table (nom_col1, nom_col2,...) VALUES (val_col1, val_col2,...);
```

Où :
- `nom_table` est le nom de la table dans laquelle on insère une valeur
- `nom_col` est le nom de la colonne dans laquelle on insère la valeur
- `val_col` est la valeur à ajouter à cette colonne.

**Attn** :
- Si une colonne est une clé primaire; on s'assurera que la valeur introduite dans cette colonne pour le nouvel enregistrement n'**existe pas** déjà dans la table.
- Si une colonne est obligatoire (`NOT NULL`); il est obligatoire de lui fournir une valeur.
- Si la colonne dans laquelle on ajoute une valeur est utilisée comme **clé étrangère** dans la table source; il faut que la valeur introduite existe déjà dans la colonne référencée dans la table cible.
  **Rem** : dans notre exemple des utilisateurs et des voitures; si on ajoute une nouvelle voiture et que l'on veut associer à la colonne **propriétaire**, l'**id** d'un utilisateur dans la table des utilisateurs; il faudra que cet utilisateur existe au préalable.

*Exemple : ajout d'utilisateurs dans notre table 'utilisateurs'*
```sql
INSERT INTO utilisateurs (id,nom,prenom) VALUES (1,'Durand','Sylvain');
INSERT INTO utilisateurs (id,nom,prenom) VALUES (2,'Dupont','Albert');
INSERT INTO utilisateurs (id,nom,prenom,date_naissance) VALUES (3,'Dupont','Albert','2005-05-24');
```

*Exemple : ajout de voitures dans notre table 'voitures'*
```sql
INSERT INTO voitures (immatriculation,marque,modele,date_achat,proprietaire)
VALUES ('1-DXF-212','Toyota','Corolla','2015-10-17',2)
```

**REM** : **<u>les chaînes de caractères seront délimitées par des guillemets simples</u>** !
