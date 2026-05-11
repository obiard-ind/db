Dans cette seconde série d'exercices; nous allons réaliser des jointures sur des tables qui ne sont pas *structurellement* liées entre elles à l'aide d'une clé étrangère.

Il faut toutefois que les tables soient liées **conceptuellement** pour que le résultat que nous cherchons à obtenir aie un sens.  Nous verrons qu'il est possible d'effectuer des jointures tout à fait correctes **syntaxiquement** (c'est à dire dont la requête SQL est valide); mais qui n'ont aucun sens du point de vue des résultats.

# Schéma de la DB
```sql
CREATE TABLE magasins(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    cp VARCHAR(10) NOT NULL,
    gerant INTEGER -- un magasin pourrait temporairement ne pas avoir de gérant
);

CREATE TABLE villes(
    cp VARCHAR(10) PRIMARY KEY,
    nom VARCHAR(50) NOT NULL, -- deux villes peuvent avoir le même nom
    nb_habitants INTEGER,
    superficie INTEGER
);

CREATE TABLE gerants(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	nb_enfants INTEGER,
	est_celibataire BOOLEAN DEFAULT TRUE
);

CREATE TABLE legumes(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    kcal INTEGER NOT NULL -- nombre de kcal par 100 grammes
);
```

# Exercices
## Ex-1 : création de la DB
Vous allez créer la base de données qui contiendra les données que nous utiliserons pour cette seconde série d'exercices sur les jointures.
1. Créez la base de données.
   Rem : vous pouvez utiliser ce que vous voulez comme outil ! Je suggère toutefois d'utiliser 'DB Brower for SQLite' que vous connaissez déjà !
2. Créez vos tables en exécutant le code SQL du schéma qui précède.
   Rem : je vous suggère, pour mieux mesurer l'effet de vos requêtes; de créer chaque table l'une après l'autre et de vérifier le résultat.

## Ex-2 : ajouter des enregistrements dans vos tables
Afin d'avoir du contenu sur lequel nous pourrons tester nos jointures; il va falloir ajouter des enregistrements dans chacune de nos tables.

Vous trouverez ci-dessous la manière dont les enregistrements ont été générés (pour rendre la démarche reproductible, afin que vous puissiez vous aussi créer vos propres jeux de données pour cet exercice, ou l'adapter à un autre schéma).

Pour cet exercice, je vous demanderai juste d'exécuter dans votre base de données, les requêtes `INSERT` dans les fichiers que vous trouverez ci-joints :
- Table `magasins` : ![](attachments/inserts_magasins.sql)
- Table `villes` : ![](attachments/inserts_villes.sql)
- Table `gerants` :![](attachments/inserts_gerants.sql)
- Table `legumes` : 
![](attachments/inserts_legumes.sql)

### Détail de la méthode pour générer les enregistrements
##### Solution 1 : à l'*ancienne*
A une époque pas si reculée (il y a 3-4 ans); vous auriez (et vous pouvez d'ailleurs toujours) probablement utilisé un tableur comme Google Sheets pour répliquer la strucutre de vos tables dans des onglets différents; et y stocker les données en lignes et les champs en colonnes.
Vous auriez ensuite cherché un moyen d'importer les données de vos différentes 'tables' dans votre base de données (généralement en passant par un format de fichier intermédiaire de type `.csv`).
Et cela n'aurait été qu'une partie du labeur ! Le plus gros du travail aurait été d'*inventer* des données en quantité suffisante pour rendre nos requêtes intéressantes.

##### Solution 2 : en faisant appel à un *ami*
L'*ami* en question, c'est une IA (ChatGPT, Gemini,...) à laquelle vous allez passer le schéma de la base de données et lui demander de créer des enregistrements pour chacune des tables.

C'est là que votre imagination intervient, et nécessite déjà une vue sur le résultat que vous voulez obtenir... Et c'est pour ça que je ne vous demanderai pas de le faire; mais vous avez ainsi la démarche.

### Prompt ChatGPT : génération de données
##### Etape 1 : transmission du schéma
```
Tu trouveras ci-joint le schéma d'une base de données pour lequel je vais te demander de créer des enregistrements afin de réaliser des exercices sur les jointures.
```
##### Etape 2 : petite précaution suite à des expériences précédentes
```
Quand je te demanderai de créer des enregistrements dont la valeur de certains champs ne sera pas connue; je voudrais que tu utilises le mot-clé NULL; et non la chaine 'NULL' !

Pour chaque demande qui suit, je voudrais que tu me génères des requêtes INSERT afin que je puisse les exécuter directement sur la base de données dont je viens de te communiquer le schéma.
Tu créeras un fichier .sql contenant ces requêtes, table par table, en suivant les instructions qui décrivent le contenu souhaité pour chacune.
```
##### Etape 3 : imaginer quelles données nous souhaterions obtenir
**Tip** : commencer par les tables qui dépendent les moins des données des autres tables.

*Pour la table 'legumes'
```
Pour la table 'legumes', je voudrais que tu me crées 50 enregistrements et que tu m'y associe le nombre de kcal par 100g qui correspond au légume trouvé.

Dans cet ensemble d'enregistrement; essaie d'incorporer le nom d'un légume qui pourrait également être un patronyme pour un enregistrement de la table 'gérants'
```

*Pour le gérant*
```
Pour la table 'gérants', je voudrais 50 enregistrements

Le nombre d'enfants (nb_enfants) sera compris entre 0 et 6; avec une légère surreprésentation du nombre d'enfants entre 0 et 3.  Je voudrais en outre que le nombre d'enfants ne soit pas connu pour 10 enregistrements.

80% des gérants sont mariés; et on ne connaît pas leur statut marital pour 5% d'entre eux.

Il y aura également 3 homonymes sur le nom.
Je voudrais en outre qu'il y aie un gérant qui porte le nom d'un légume figurant dans la table 'légumes'.
```

*Pour la table 'villes'*
```
Pour la table 'villes', je voudrais que tu me génères 25 enregistrements dont les codes postaux appartiennent à des villes belges en Wallonie.

Tu essaieras de trouver sur internet les valeurs réelles correspondant au nombre d'habitants et à la superficie de ces villes.
```

*Pour la table 'magasins'
```
Pour la table 'magasins', je voudrais que tu me génères 30 enregistrements.

Pour le nom, je voudrais qu'il y aie 10 noms différents (dont certains correspondent à des chaînes connues comme 'Lidl', 'Carrefour', 'Colruyt', 'Spar', 'Trafic'); et certains pourraient être des noms plausibles de magasin plus petits et indépendants (du genre : "Le comptoir du Bio" ou "Librairie Point-Virgule").  Pour ces derniers, tu essaieras qu'ils soient uniques dans la table demandée.

Pour le code postal (cp), je voudrais que tu utilises des codes postaux belges uniquement.  Il y aura 20 codes postaux différents; dont 18 seront tirés de la table 'villes'.

Pour l'attribut 'gerant', je voudrais que sa valeur soit prise dans l'attribut 'id' de la table 'gérants' pour 25 d'entre eux; et soit NULL pour les 5 restants.
```

# Ex-3 : jointures sur nos tables

Vous pouvez également solliciter l'IA pour vous suggérer des exercices...
### Prompt : 
*Prompt à ChatGPT*
```
sur base du schéma et des données que je t'ai demander de générer; peux-tu me proposer des exercices de jointures (inner, left, right) pour des élèves découvrant les DB ?
```
### Réponse : 

Oui 👍  
Avec ce schéma, tu peux construire beaucoup d’exercices pédagogiques intéressants, notamment grâce :

- aux codes postaux présents ou absents ;
- aux gérants `NULL` ;
- aux gérants sans magasin ;
- aux noms ambigus (`Navet`, homonymes…) ;
- à la table `legumes`, volontairement sans lien conceptuel.

---

# 🔹 Rappel du schéma

```
magasins(id, nom, cp, gerant)villes(cp, nom, nb_habitants, superficie)gerants(id, nom, prenom, email, nb_enfants, est_celibataire)legumes(id, nom, kcal)
```

---

# 🟢 Exercices INNER JOIN

## Exercice 1

Afficher :

- le nom du magasin
- le code postal
- le nom de la ville

👉 uniquement pour les magasins dont le code postal existe dans `villes`.

---

## Exercice 2

Afficher :

- le nom du magasin
- le prénom et nom du gérant

👉 uniquement pour les magasins ayant un gérant.

---

## Exercice 3

Afficher :

- le nom du magasin
- la ville
- le prénom du gérant

👉 nécessite 2 jointures.

---

## Exercice 4

Afficher :

- le nom du gérant
- le nombre d’enfants
- le magasin qu’il gère

👉 uniquement les gérants associés à un magasin.

---

# 🟡 Exercices LEFT JOIN

## Exercice 5

Afficher tous les magasins avec :

- leur ville
- même si le code postal n’existe pas dans `villes`.

👉 certains noms de ville devront apparaître à `NULL`.

---

## Exercice 6

Afficher tous les magasins avec :

- leur gérant
- même si le magasin n’a pas de gérant.

👉 certains champs seront `NULL`.

---

## Exercice 7

Afficher tous les gérants avec :

- le magasin qu’ils gèrent

👉 même les gérants sans magasin.

---

## Exercice 8

Afficher toutes les villes avec :

- les magasins situés dans ces villes

👉 même les villes sans magasin.

---

# 🟠 Exercices RIGHT JOIN

## Exercice 9

Afficher :

- les magasins
- et leur ville

👉 en utilisant un `RIGHT JOIN` au lieu d’un `LEFT JOIN`.

---

## Exercice 10

Afficher :

- tous les gérants
- et les magasins associés

👉 en utilisant un `RIGHT JOIN`.

---

# 🔴 Exercices de réflexion

## Exercice 11

Afficher les magasins :

- qui n’ont pas de gérant.

👉 indice :

```
WHERE gerant IS NULL
```

---

## Exercice 12

Afficher les gérants :

- qui ne gèrent aucun magasin.

👉 nécessite :

- `LEFT JOIN`
- `IS NULL`

---

## Exercice 13

Afficher les magasins :

- dont le code postal n’existe pas dans `villes`.

---

# 🔵 Exercices “piège pédagogique”

## Exercice 14

Faire une jointure entre :

- `gerants`
- `legumes`

sur le nom.

👉 Objectif :  
comprendre qu’une jointure peut être techniquement valide même sans vrai lien métier.

---

## Exercice 15

Afficher :

- les gérants dont le nom correspond à un légume.

👉 grâce au légume/patronyme inséré (`Navet`).

---

# 🟣 Exercices bonus

## Exercice 16

Afficher :

- les magasins situés dans des villes de plus de 100000 habitants.

---

## Exercice 17

Afficher :

- les gérants ayant au moins 3 enfants
- et leur magasin.

---

## Exercice 18

Afficher :

- les magasins
- avec le nombre d’habitants de leur ville.

---

# 🎯 Compétences travaillées

Ces exercices permettent de découvrir :

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- clés de correspondance
- gestion des `NULL`
- jointures multiples
- importance du lien conceptuel
- différences entre données existantes et absentes

---