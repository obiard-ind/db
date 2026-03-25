# C'est quoi une table ?
Une table sert à enregistrer des données concernant des éléments de même nature. (exemple : des voitures, des élèves, des persones, des produits, des magasins,...)
# Comment se représenter une table ?
Une table peut se concevoir comme un tableau (Google Sheets,...).
Celle-ci est constitutée de colonnes (les **attributs**); qui décrivent les propriétés des éléments.
Chaque ligne représente, quant à elle, un élément particulier (les **enregistrement**)

![](attachments/Pasted%20image%2020260325081503.png)

# Caractéristiques des attributs
Dans une table, les attributs possèdent un **type**.  Celui-ci indique quelle est la nature des données autorisées pour cet attribut.
Les types principaux sont :

| Type           | Nature de la donnée                                                                                                                                                                             | Exemple    |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| `INTEGER`      | un nombre entier                                                                                                                                                                                | 15         |
| `VARCHAR(n)`   | une chaîne de caractères de longueur max = n<br>Exemple : VARCHAR(50)                                                                                                                           | "Emma"     |
| `DATE`         | une date (format : AAAA-MM-JJ)                                                                                                                                                                  | 2020-12-25 |
| `BOOLEAN`      | une valeur booleenne (`True` ou `False`)                                                                                                                                                        | `True`     |
| `DECIMAL(m,n)` | une nombre avec une partie décimale<br>`m` : est le nombre de chiffres autorisés avant le point.<br>`n` : est le nombre de chiffres autorisé pour la partie décimale.<br>Exemple : DECIMAL(5,3) | 15.125     |
D'autres types sont égalements disponibles; mais nous ne les verrons pas dans ce cours.

# Contraintes sur les attributs
En plus du type de la donnée qu'ils contiennent; on peut limier ou imposer certaines conditions sur ceux-ci.  Les contraintes principales que peut avoir un attribut sont :

| Contrainte    | Signification                                                                                                                                                                                                                                                                                         |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NOT NULL`    | L'enregistrement doit avoir une valeur pour cet attribut                                                                                                                                                                                                                                              |
| `UNIQUE`      | Deux enregistrement ne peuvent avoir une même valeur pour cet attribut.<br>Autrement dit : au sein d'une même 'colonne'; il ne peut y avoir 2 valeurs identiques.                                                                                                                                     |
| `PRIMARY KEY` | Indique que l'attribut est un identifant !<br>Il garantit que tous les enregistrements sont différents.  <br>L'attribut qui est marqué `PRIMARY KEY` sera plus tard utilisé pour relier les tables entre elles.<br>**Note** : un attribut qui est `PRIMARY KEY` est à la fois `NOT NULL` et `UNIQUE`. |
# Comment créer une table ?
En SQL, on utilisera la commande `CREATE TABLE` pour créer une table.
Pour créer une table qui contiendrait les données de l'enregistrement proposé ci-dessus :

```sql
CREATE TABLE eleves(
    id_eleves INTEGER PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE,
    email VARCHAR(100) UNIQUE
);
```

**Explication :**
- on choisit le **nom de la table** : eleves
- on n'oublie pas de mettre des **parenthèses** pour encadrer les attributs.
- on indique chaque **attribut** sur une ligne séparée par **une virgule**
	- en indiquant obligatoirement son <u>nom</u> et son <u>type</u> 
	- en précisant les <u>contraintes éventuelles</u> sur celui-ci.
- On termine notre requête par un **`;`**
Dans notre exemple :
- la clé primaire est un nombre entier, et porte le nom 'id_eleves'
- le nom et le prénom de l'élève sont obligatoires (`NOT NULL`); mais on autorise que des élèvfes différents aient le même nom ou le même prénom.
- la date de naissance est facultative
- l'adresse email doit être `UNIQUE`; c'est à dire que deux élèves ne peuvent avoir une même adressee email.  En revanche, on peut ne pas préciser d'adresse email; car il n'y pas de `NOT NULL`






