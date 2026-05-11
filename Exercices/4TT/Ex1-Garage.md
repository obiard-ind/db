# Base de donnée : garage.db
Vous allez créer une petite base de données pour gérer les ventes de voitures d'un garage.
Votre base de données s'appellera garage.db
En SQLite, la commande pour créer / ouvrir votre base de données est : `.open garage.db`

## Création d'une table 'voitures'
### Enoncé :
Votre table enregistrera les voitures disponibles à la vente dans un garage multi-marques.
Chaque voiture est identifiée par son numéro d'immatriculation.  Elle est également caractérisée par sa marque, son modèle, sa couleur, son prix et une date de fabrication; tous ces attributs étant obligatoires.
Une voiture peut avoir été achetée; auquel cas, elle a un propriétaire, et une date d'achat.
### Etape 1 : créez le schéma conceptuel de la table
Avant de commencer, il est importer de créer le schéma conceptuel de la table (vous savez, la notation graphique dans une petite boîte qui indique le nom de la table, et liste les attributs avec le type associé, et les contraintes éventuelles).
### Etape 2 : créez le schéma logique de la table
- Ouvrez un fichier texte que vous nommerez `voitures-schema.sql`
- A l'intérieur, tapez la commande qui permettra de créer la table en SQL
- Exécutez-en les instructions dans votre base de données pour y créer la table
  **Rem** : en supposant que sqlite.exe, la base de donnée et votre fichier de commande 'voitures-schema.sql' se trouvent dans le même répertoire; il suffira de taper dans SQLite :
  `.read voitures-schema.sql`
- Vérifiez que votre table a bien été créée : `.tables`
- Vérifiez-en le schéma : `.schema`
### Etape 3 : ajoutez des enregistrements dans votre table
Ajoutez ensuite 5 enregistrements de voitures dans votre table.

**Rem** : tapez-en les commandes SQL dans un fichier `voiture-insert.sql`, par exemple; et comme à l'étape précédente, exécutez le code à l'aide de `.read voiture-insert.sql` pour que SQLite insère les enregistrements dans la table que vous avez créée.

## Recherche dans la table 'voitures'
### Prérequis
- Depuis le partage 'Google Drive', copiez la base de données que je vous y ai déposée.
- Ouvrez la base de données avec SQLite
- Affichez en les tables à l'aide de la commande : `.tables`
- Affichez en le schéma à l'aide de la commande : `.schema`

### Effectuez les recherches suivantes dans la table 'voitures'

- Affichez toutes les voitures; avec toutes leurs caractérstiques.
- Affichez la liste de toutes les marques (chaque marque ne doit apparaître qu'une fois dans la liste).
- Donnez la requêtes



