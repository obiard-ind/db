#def **SQL** est le langage utilisé pour la création et la manipulation de bases de données.
On peut distinguer ses commandes en plusieurs groupes :
- DDL (Data Definition Language) : c'est la partie du langage utilisée pour **créer et modifier la structure** de notre base de données (son schéma)
- DML (Data Manipulation Language)  : concerne les commandes pour **ajouter**, **modifier**, **supprimer** les données de notre base de données.
- DQL (Data Query Language) : concerne les commandes utilisées pour **rechercher** de l'information dans notre base de données.

# Création de notre première DB
## Créer et enregistrer notre DB dans un fichier
Depuis l'interpréteur de commande SQLite; il suffit de taper :
`.open <nom_de_notre_db>`
où `<nom_de_notre_db>` sera remplacé par le chemin et le nom que nous donnerons au fichier qui contiendra notre db.
**Tip** : on attribuera généralement l'extension `.db` à ce fichier afin de l'identifier facilement.
Exemple (pour une gestion de bibliothèques) : 
`.open bibliotheques.db`
## Voir quelle est la DB utilisée et son emplacement
Toujours depuis l'interpréteur SQLite; pour connaître le nom et l'emplacement du fichier qui contient la DB en cours d'utilisation dans SQLite; il suffit de taper :
`.databases`
# Création de nos tables
Une base de données; c'est un ensemble de tables qui possèdent une structure et qui peuvent être liées entre elles.
Nous allons voir ici comment créer ces tables; et ensuite comment les relier entre elles.

**Prérequis** : avant de pouvoir créer nos tables; il faudra avoir ouvert le fichier qui contient notre base de données.
`.open <nom_de_notre_db>`

## Créer une table : CREATE TABLE

Pour créer une table; on utilisera la commande SQL `CREATE TABLE`
**Syntaxe** : ```
```sql
CREATE TABLE nom_table (
    nom_col1 type_col1,
    nom_col2 type_col2,
    nom_col3 type_col3,
    ...
);
```

où :
- `nom_table` : est le nom que nous donnerons à notre table
- `nom_col` : est le nom que l'on donnera à nos colonnes (attributs)
- `type_col` : est le type de donnée que contiendra la colonne.
  **Rem** : nous verrons ci-dessous quels sont les types de données disponibles avec SQLite
On notera :
- que la description des colonnes qui constitue la table commence par une parenthèse ouvrante  `(`  et se termine par une parenthèse fermante `)`
- que l'instruction se termine par un `;`

### Types de données en SQLite
Au contraire d'autre SGBD; SQLite ne propose qu'un nombre restreint de types de données pour décrire une colonne (mais rassurez-vous; ceci sera tout à fait suffisant pour l'usage que nous en aurons).

| Type    | Description                                    |
| ------- | ---------------------------------------------- |
| INTEGER | un entier                                      |
| REAL    | un nombre en virgule flottante                 |
| TEXT    | une chaîne de caractères                       |
| BLOB    | un objet 'binaire' : image, fichiers, sons,... |
**Note** : il n'existe pas de type particulier `DATE` ou `DATETIME`pour représenter les dates.
Les dates seront représentées sous forme chaîne de caractère en respectant le format suivant :
- "YYYY-MM-DD" (eg. "2026-02-04" pour indiquer le 04 février 2026)
- "HH:MM:SS" (eg. "17:28:27" pour dire qu'il est 17h28 et 27secondes)
- "YYYY-MM-DD HH:MM:SS" (eg. "2026-02-04 17:28:27")
**Note** : le type `VARCHAR` peut également être utilisé pour des raisons de compatibilité avec d'autres SGBD; mais il sera automatiquement convertit dans le type `TEXT`
**Note** : il n'y a pas de type `BOOLEAN`.  On utilisera le type `INTEGER` pour contenir des valeurs booléennes : `0` pour `False` et `1` pour `True`

## Colonne obligatoire : NOT NULL
Pour indiquer qu'une colonne est obligatoire (çad qu'elle doit contenir une valeur); on ajoutera la mention `NOT NULL` juste après le type de la colonne.

## Clé primaire : PRIMARY KEY
Pour préciser qu'une colonne sert d'identifiant; on utilisera la mention `PRIMARY KEY` juste après le type de la colonne. 
**Rappel** : 2 enregistrements ne peuvent avoir une même valeur de clé primaire ! Celle-ci est toujours **unique** et **obligatoire**. 

```sql
CREATE TABLE utilisateurs (
    id INTEGER PRIMARY KEY,  -- Entier, clé primaire
    nom TEXT NOT NULL,       -- Texte, obligatoire
    prenom TEXT NOT NUL,     -- Texte, obligatoire
    date_naissance TEXT,     -- Texte (pour les dates aussi : "YYYY-MM-DD")
    est_majeur INTEGER,      -- Entier (pour 0 pour False, 1 pour True)
    photo BLOB               -- BLOB (contient un fichier binaire)
);
```

## Clé étrangère : FOREIGN KEY
Une clé étrangère sert à relier les tables entre elles.

**Prerequis SQLite** : par défaut, SQLite n'active pas la vérification des *contraintes référentielles* (n'ayez pas peur des termes; cela signifie juste que SQLite n'active pas la fonctionnalité de liaison entre les tables).  Il faudra donc le spécifier à SQLite à <u>chaque fois</u> que nous ouvrirons une nouvelle session (çad, à chaque fois que nous démarrerons l'interpréteur de commande SQLite).

Depuis l'interpréteur de commande SQLite :
Pour activer cette contrainte : `PRAGMA foreign_keys = ON;`
Pour vérifier l'état de cette contrainte : `PRAGMA foreign_keys` 
	Qui retournera `0` si pas activé; `1` si activé.

## Pour créer une clé étrangère :
**Attn** : 
- Une clé étrangère référence toujours un identifiant (clé primaire) de la table cible.
- Le type des colonnes utilisées doit être le même dans la table source et la table cible.

## Exemple :
Reprenons notre exemple de la table **utilisateurs** que nous avons créée plus haut.
Imaginons que nous ayons une table qui enregistre des **voitures**.
```sql
CREATE TABLE voitures (
    immatriculation TEXT PRIMARY KEY,
    marque TEXT not null,
    modele TEXT not null,
    date_achat TEXT,
    prix_achat INTEGER
);
```

Si on voulait à présent pouvoir relier une voiture à son propriétaire; on ajouterait dans la table des **voitures** une *clé étrangère* qui désignerait le propriétaire du véhicule.
Lors de la création de la table des voitures; on précisera la clé étrangère comme ceci :

```sql
CREATE TABLE voitures (
    immatriculation TEXT PRIMARY KEY,
    marque TEXT not null,
    modele TEXT not null,
    date_achat TEXT,
    prix_achat INTEGER
    -- ajout d'une clé étrangère pour relier voitures à utilisateurs
    proprietaire INTEGER
    FOREIGN KEY (proprietaire) REFERENCES utilisateurs(id)
);
```

On notera :
- Que la colonne **proprietaire** dans la table source est du même type que la colonne **id** dans la table cible; à savoir le type `INTEGER`
- Que le nom des deux colonnes ne doit pas nécessairement être le même !
- Que la colonne référencée dans la table cible **utilisateurs** est la <u>clé primaire</u> de cette table.

