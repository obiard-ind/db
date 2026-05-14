Dans cette seconde série d'exercices; nous allons réaliser des jointures sur des tables qui ne sont pas *structurellement* liées entre elles à l'aide d'une clé étrangère.

Il faut toutefois que les tables soient liées **conceptuellement** pour que le résultat que nous cherchons à obtenir aie un sens.  Nous verrons qu'il est possible d'effectuer des jointures tout à fait correctes **syntaxiquement** (c'est à dire dont la requête SQL est valide); mais qui n'ont aucun sens du point de vue des résultats.

# Schéma de la DB
```sql
CREATE TABLE magasins(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(100) NOT NULL,
    cp VARCHAR(10) NOT NULL,
    gerant INTEGER -- un magasin pourrait temporairement ne pas avoir de gérant
);

CREATE TABLE villes(
    cp VARCHAR(10) PRIMARY KEY,
    nom VARCHAR(50) NOT NULL, -- deux villes peuvent avoir le même nom
    nb_habitants INTEGER,
    superficie INTEGER  -- superficie en km2
);

CREATE TABLE gerants(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	nb_enfants INTEGER,
	est_celibataire BOOLEAN DEFAULT TRUE
);

CREATE TABLE legumes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    kcal INTEGER NOT NULL -- nombre de kcal par 100 grammes
);
```
**Rem** : pour les `PRIMARY KEY` de type `INTEGER`, nous avons ajouté le mot-clé `AUTOINCREMENT` pour indiquer à SQLite de d'incrémenter automatiquement la valeur de la clé à chaque nouvel enregistrement.  Ceci est superflu dans SQLite, mais nous l'avons maintenu pour la compatibilité avec d'autres SGBD tels que MySQL (où le mot clé est `AUTO_INCREMENT` est alors requis).
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

# Ex-3a : jointures sur nos tables

Vous pouvez également solliciter l'IA pour vous suggérer des exercices...  
... voire même vous les corriger !

Vous trouverez les solutions à la suite de chacun des exercices.
... mais essayez de les réaliser par vous-même avant d'aller jeter un oeil sur la solution.
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
magasins(id, nom, cp, gerant)
villes(cp, nom, nb_habitants, superficie)
gerants(id, nom, prenom, email, nb_enfants, est_celibataire)
legumes(id, nom, kcal)
```

---

# 🟢 Exercices INNER JOIN

## Exercice 1

Afficher :

- le nom du magasin
- le code postal
- le nom de la ville

👉 uniquement pour les magasins dont le code postal existe dans `villes`.

## Exercice 1 - Solution

```sql
SELECT magasins.nom, magasins.cp, villes.nom 
FROM magasins
INNER JOIN villes ON magasins.cp = villes.cp;
```

#### Explication
- On va relier nos deux tables sur base d'une colonne commune aux deux tables : le *code postal*
- On veut uniquement les magasins dont le code postal existe dans ville => on utilisera un `INNER JOIN`
  Rem : si on avait voulu tous les magasins; que le code postal existe dans la table `villes` ou non; on aurait utilisé un `LEFT JOIN`... essayez et voyez comment le résultat peut changer.
- Comme certaines colonnes portent le même nom dans les deux tables : `nom` et `cp`; il faut indiquer après le `SELECT` de quelle table proviennent les valeurs que l'on veut voir affichées.  Pour ce faire; on les fera préfixer de nom de la table, suivi d'un point `.` !

---

## Exercice 2

Afficher :

- le nom du magasin
- le prénom et nom du gérant

👉 uniquement pour les magasins ayant un gérant.

## Exercice 2 - Solution
```sql
SELECT magasins.nom, gerants.prenom, gerants.nom
FROM magasins
INNER JOIN gerants ON magasins.gerant = gerants.id;
```

#### Explication
- On regarde d'abord dans notre schéma sur quelle colonne on peut relier les tables `magasins` et `gerants`.  On y trouve que `magasins` possède un attribut nommé `gerant`, qui est de type `INTEGER`; et que ça tombe bien; la clé primaire qui permet de distinguer les différents gérants dans la table `gerants` est aussi un `INTEGER`; et que cette clé s'appelle `id`.
- Comme on ne veut que les magasins qui ont un gérant; cela signifie que si on ne trouve pas une correspondance à `magasins.gerant` dans `gerants.id`; on ne conserve pas le résultat.  Autrement dit; on recherche les valeurs communes dans les deux colonnes... c'est à dire celles qui sont à l'**intersection** de nos deux tables; et donc que nous utiliserons une jointure interne : `INNER JOIN`.
- On indique dans notre `SELECT`, le nom des colonnes de l'une ou l'autre table, dont on veut obtenir les valeurs lorsque qu'une correspondance est trouvée sur `magassins.gerant` et `gerants.id`.  Et pour être sûr de choisir le valeur dans la table souhaitée; on fera préfixer le nom de la colonne par celui de la table.
  **Rem** : à noter que lorsqu'il n'y a pas d'ambiguïté possible dans le nom de la colonne; on peut ne pas mettre le nom de la table devant (essayez, par exemple; en mettant juste `prenom` au lieu de `gerants.prenom`),  mais je vous recommande de le faire quand même; ça rend votre requête plus lisible.

---

## Exercice 3

Afficher :

- le nom du magasin
- la ville
- le prénom du gérant

👉 nécessite 2 jointures.

## Exercice 3 - Solution
```sql
SELECT magasins.nom, villes.nom, gerants.prenom
FROM magasins
INNER JOIN villes ON magasins.cp = villes.cp
INNER JOIN gerants ON magasins.gerant = gerants.id;
```

#### Explications
- On indique le nom des champs (colonnes) dont on veut voir apparaître les valeurs dans le résultat; en les faisant préfixer du nom de la table dont elles sont issues : `magasins.nom`, `villes.nom`, `gerants.nom`
- Dans cet exercice; les données vont prevenir de 3 tables différentes ! La question qui se pose dès lors est : par quelle table commencer ? Formulé autrement : quelle est la *table gauche*, celle qui suit directement le `FROM` ?
  Réponse : on mettra en premier, la table qui a des liaisons avec les deux autres : `magasins`
- Ensuite, même principe que dans les exercices précédents :
	- On identifie les colonnes qui servent de liaison entre les tables; selon ce que l'on recherche.
	- On détermine le type de jointure que l'on souhaite : si on souhaite une correspondance exacte dans chacune des tables; alors on utilisera un `INNER JOIN`.  Si l'on autorise qu'une valeur dans la *table gauche* n'aie pas de correspondant dans la *table droite*; alors on utilisera un `LEFT JOIN`

---

## Exercice 4

Afficher :

- le nom du gérant
- le nombre d’enfants
- le magasin qu’il gère

👉 uniquement les gérants associés à un magasin.

## Exercice 4 - Solution
```sql
SELECT 
    gerants.nom AS nom_gerant,
    gerants.nb_enfants AS nombre_enfants,
    magasins.nom AS nom_magasin
FROM gerants
INNER JOIN magasins ON gerants.id = magasins.gerant
```

#### Explications
- On suit la même logique que précédemment...
- Nous allons juste introduire ici les **alias** qui vont nous permettre de renommer le nom des colonnes dans le résultat.
	- Il suffit de faire suivre le nom du champ par le mot-clé `AS`, et du nom que l'on veut donner à la colonne en sortie.
	- Pour la lisibilité, on placera chaque colonne sur une ligne séparée; en l'indentant par rapport au `SELECT`

---

# 🟡 Exercices LEFT JOIN

## Exercice 5

Afficher tous les magasins avec :

- leur ville
- même si le code postal n’existe pas dans `villes`.

👉 certains noms de ville devront apparaître à `NULL`.

## Exercice 5 - Solution
```sql
SELECT 
	magasins.nom AS nom_magasin,
	villes.nom AS ville
FROM magasins
LEFT JOIN villes ON magasins.cp = villes.cp;
```

#### Explication
- Ici, on ne recherche pas une correspondance obligatoire entre les valeurs des colonnes qui servent de liaison entre nos tables.
- Ce que l'on cherche, avec une *jointure gauche* (`LEFT JOIN`), c'est <u>d'afficher tous les enregistrements de la table gauche</u>; qu'on leur trouve ou non une correspondance dans la table droite.  (Revoyez pour cela les *diagrammes de Venn* qui représentent les jointures).
- Rem : on observera que pour les enregistrements où aucune correspondance n'a été trouvée dans la table droite; les valeurs des colonnes de cette table qui apparaissent dans le `SELECT` on pour valeur `NULL`.

---

## Exercice 6

Afficher tous les magasins avec :

- leur gérant
- même si le magasin n’a pas de gérant.

👉 certains champs seront `NULL`.

## Exercice 6 - Solution
```sql
SELECT 
	magasins.nom AS nom_magasin,
	gerants.nom AS nom_gerant,
	gerants.prenom AS prenom_gerant
FROM magasins
LEFT JOIN gerants ON magasins.gerant = gerants.id;
```

#### Explication
- Même chose qu'à l'exercice précédent.
- Rem : noter que, tandis que dans l'`INNER JOIN`, l'ordre des tables n'avait pas grande importance; puisque l'on recherchait les éléments communs aux différentes tables (leur intersection)... avec un `LEFT JOIN` ou un `RIGHT JOIN`, l'ordre des tables a de l'importance !
  La première table, celle qui suit le `FROM`, la *table gauche* est celle dont on veut afficher *tous les enregistrements*. 
----

## Exercice 7

Afficher tous les gérants avec :

- le magasin qu’ils gèrent

👉 même les gérants sans magasin.

## Exercice 7 - Solution
```sql
SELECT 
    gerants.nom AS nom_gerant,
    gerants.prenom AS prenom_gerant,
    magasins.nom AS nom_magasin
FROM gerants
LEFT JOIN magasins ON gerants.id = magasins.gerant;
```

#### Explication
- Idem que précédemment
- Notez bien qu'ici, on veut voir affichée la liste de *tous les gérants*... et c'est donc le nom de cette table qui suivra directement le `FROM` et sera dénommée *table gauche*.
---

## Exercice 8

Afficher toutes les villes avec :

- les magasins situés dans ces villes

👉 même les villes sans magasin.

## Exercice 8 - Solution
```sql
SELECT 
	villes.*,
	magasins.nom
FROM villes
LEFT JOIN magasins ON villes.cp = magasins.cp;
```

#### Explication
- Notez ici l'utilisation de `*` après `villes` pour indiquer que l'on souhaite voir affichés les valeurs de tous les champs de la table `villes`.  On aurait pu les lister un par un, comme on l'a fait précédemment; mais quand il y en a beaucoup, c'est parfois plus facile d'utiliser l'astérisque (étoile) `*`.

---

# 🟠 Exercices RIGHT JOIN

## Exercice 9

Afficher :

- les magasins
- et leur ville

👉 en utilisant un `RIGHT JOIN` au lieu d’un `LEFT JOIN`.

## Exercice 9 - Solution
```sql
SELECT
	magasins.*,
	villes.nom
FROM villes
RIGHT JOIN magasins ON villes.cp = magasins.cp;
```

#### Explication
- **Attention** : il est important de bien comprendre ce que l'on cherche à obtenir comme résultat avant de se lancer tête baissée dans la rédaction de la requête !
  Ceci est valable pour toutes les requêtes; mais particulièrement pour les *requêtes droites* (non pas qu'elle sont plus compliquées; mais parce qu'elle sont moins intuitives, du fait que nous avons avons l'habitude de lire de gauche à droite; tandis qu'ici, on va *lire* de droite à gauche)
- **Rappel** : une *jointure à droite* (`RIGHT JOIN`) se traite de la même manière qu'une *jointure à gauche* (`LEFT JOIN`), si ce n'est que l'on lit les enregistrements au départ de la *table droite* (celle qui apparaît après le `JOIN`) au lieu de la *table gauche* (celle qui apparaît après le `FROM`)
- Dans cet exemple; on veut afficher *'les magasins et leur ville'* (sous-entendu : tous les magasins, et leur ville associée si elle existe).  Dans le contexte d'un `RIGHT JOIN` :
	- On mettra donc `magasins` après le `RIGHT JOIN`
	- On mettra `villes` après le `FROM`
- **Théorie** : référez-vous aux *diagrammes de Venn* pour comprendre qu'un `RIGHT JOIN` est juste un `LEFT JOIN` dont on a inversé l'ordre des tables....
---

## Exercice 10

Afficher :

- tous les gérants
- et les magasins associés

👉 en utilisant un `RIGHT JOIN`.

## Exercice 10 - Solution
```sql
SELECT
    gerants.nom AS nom_gerant,
    gerants.prenom AS prenom_gerant,
    magasins.nom AS nom_magasin
FROM magasins 
RIGHT JOIN gerants ON gerants.id = magasins.id; 
```

#### Explication
- Meme chose que précédemment; toujours en insistant que dans une *jointure à droite* (`RIGHT JOIN`), la table dont on veut obtenir un résultat pour chaque enregistrement; se trouve après le `RIGHT JOIN`.
---

# 🔴 Exercices de réflexion

## Exercice 11

Afficher les magasins :

- qui n’ont pas de gérant.

👉 indice :

```
WHERE gerant IS NULL
```

## Exercice 11 - Solution
```sql
SELECT 
	magasins.nom
FROM magasins
LEFT JOIN gerants ON magasins.gerant = gerants.id
WHERE gerants.id IS NULL;
```

#### Explication
- On parcourt tous les enregistrements de `magasins` et essaie d'établir une liaison avec la table `gerants`.  On a vu que, si aucune correspondance n'est trouvée dans la table associée; les valeurs associées aux champs de de cette table sont `NULL`.  
- On complétera donc notre jointure avec les filtres de la clause `WHERE` que nous avons déjà vu; et on sélectionnera uniquement les enregistrements dont on ne trouvera aucune correspondance de la clé qui lie `magasins` dans la table `gerants`.
  **Attn** : on utilisera l'attribut servant pour la jointure ! 
- **Tip** : si vous voulez vous en assurer; ajoutez après `SELECT`, la colonne `gerants.id` pour en voir la valeur.

---

## Exercice 12

Afficher les gérants :

- qui ne gèrent aucun magasin.

👉 nécessite :

- `LEFT JOIN`
- `IS NULL`

## Exercice 12 - Solution
```sql
SELECT 
	gerants.nom, 
	gerants.prenom, 
	magasins.gerant -- on a mis ce champ pour dont la valeur devra être NULL
FROM gerants
LEFT JOIN magasins ON gerants.id = magasins.gerant
WHERE magasins.gerant IS NULL;
```

#### Explication
- Idem que pour l'exercice précédent...

---

## Exercice 13

Afficher les magasins :

- dont le code postal n’existe pas dans `villes`.

## Exercice 12 - Solution
```sql
SELECT magasins.nom
FROM magasins
LEFT JOIN villes on magasins.cp = villes.cp
WHERE villes.cp IS NULL;
```

---

# 🔵 Exercices “piège pédagogique”

## Exercice 14

Faire une jointure entre :

- `gerants`
- `legumes`

sur le nom.

👉 Objectif :  
comprendre qu’une jointure peut être techniquement valide même sans vrai lien métier.

## Exercice 14 - Solution
```sql
SELECT 
    gerants.nom AS nom_gerant,
    gerants.nb_enfants AS nombre_enfants,
    legumes.nom AS nom_legumes,
    legumes.kcal AS kcal
FROM gerants
INNER JOIN legumes ON gerants.nom = legumes.nom;
```

#### Explication
- **Attention** : ce n'est pas parce que deux tables possèdent des colonnes qui portent le même nom OU parce que des colonnes ont des valeurs qui peuvent être comparées que cela a du sens de les relier par une jointure !
	- L'enregistrement qui résulte d'une jointure doit être un ensemble cohérent de valeurs...  
	- Dans notre exemple : est-ce que cela a du sens de relier un `gerant` à un `legume` ?
	  Avec le jeu de données que nous avons utilisé; nous obtiendrions le résultat suivant : 
	  ![](attachments/Pasted%20image%2020260514133448.png)
	- ... est-ce que cela a du sens ? (à moins qu'un navet puisse avoir des enfants; ou que Mr Navet soit très peu calorique 😵 )
	  
---

## Exercice 15

Afficher :

- les gérants dont le nom correspond à un légume.

👉 grâce au légume/patronyme inséré (`Navet`).

## Exercice 15 - Solution
```sql
SELECT gerants.nom
FROM gerants
INNER JOIN legumes ON gerants.nom = legumes.nom;
```

---

# 🟣 Exercices bonus

## Exercice 16

Afficher :

- les magasins situés dans des villes de plus de 100000 habitants.

## Exercice 16 - Solution
```sql
SELECT
    magasins.nom AS magasin,
    villes.nom AS villes,
    villes.nb_habitants AS nb_habitants
FROM magasins
INNER JOIN villes ON magasins.cp = villes.cp
WHERE villes.nb_habitants >= 100000;
```

---

## Exercice 17

Afficher :

- les gérants ayant au moins 3 enfants
- et leur magasin.
## Exercice 17 - Solution
```sql
SELECT
    gerants.nom AS nom,
    gerants.prenom AS prenom,
    gerants.nb_enfants AS nb_enfants,
    magasins.nom AS magasin
FROM gerants
INNER JOIN magasins ON gerants.id = magasins.gerant;
```

#### Explication
- Ici, la question était un peu ambiguë :
	- Si l'on voulait uniquement les gérants qui disposaient d'un magasin => `INNER JOIN`
	- Si l'on souhaitait tous les gérants; y compris ceux qui ne sont pas affectés à un magasin => `LEFT JOIN`

---

## Exercice 18

Afficher :

- les magasins
- avec le nombre d’habitants de leur ville.
## Exercice 17 - Solution
```sql
SELECT 
    magasins.nom AS magasin,
    villes.nb_habitants AS nb_habitants
FROM magasins
LEFT JOIN villes ON magasins.cp = villes.cp;
```

#### Explication
- Idem que précédement : que fait-on des magasins pour lesquels on ne dispose pas de la données servant à les localiser (le code postal : `cp`, dans notre exemple) ?

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

