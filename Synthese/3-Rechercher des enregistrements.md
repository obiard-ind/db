# Rechercher des enregistrements : `SELECT`
Pour rechercher des enregistrements dans nos tables; on utilisera la commande `SELECT`.
Sa syntaxe est la suivante : 

```sql
SELECT nom_attr1, nom_attr2, nom_attr3,... FROM nom_table;
```
- `SELECT` : mot clé qui indique que l'on veut rechercher des enregistrements.
- nom_attr1, nom_attr2,... : on précise ici le nom des attributs dont on veut voir affichée la valeur.
  **Rem** : c'est un peu comme si on décidait de ne sélectionner que certaines colonnes de notre tableau de données.
- `FROM` : mot clé qui indique que l'on va indiquer le nom de la table dont on veut récupérer les enregistrements.
### Exemple :
Reprenons les données de la table `eleves` que nous avons créée précédemment.
![](attachments/Pasted%20image%2020260325081503.png)

```sql
SELECT nom,prenom FROM eleves;
```
Cette requête affichera uniquement le nom et le prénom de **tous** les élèves de la table.

```sql
SELECT email FROM eleves;
```
Cette requête affichera uniquement l'adresse email de **tous** les élèves de la table.

```sql
SELECT * FROM eleves;
```
**NOTE** : l'astérisque : `*` , est un raccourcis qui indique que l'on veut tous les attributs d'une table.
Dans le cas présent; cette requête affichera tous les attributs pour **tous** les enregistrements.

## Clause `WHERE`
Dans le cas général que nous venons de voir; on pouvait décider de limiter le nombre de colonnes que l'on désirait afficher en précisant le nom des attributs de la table.
Toutefois, on affichait ces valeurs pour **tous les enregistrements** de la table.

La clause `WHERE` permet cette fois-ci de **limiter le nombre d'enregistrements** en fonction de certaines conditions.
Pour chaque enregistrement de la table; on comparera le valeurs des attributs à certaines valeurs; et si le résultat de la comparaison peut être évalué à `True`; alors on conservera l'enregistrement dans la liste des résultats; sinon, on l'omet.

La structure d'une condition dans une clause `WHERE` est la suivante :
```sql
nom_attribut operateur valeur
```
- `nom_attribut` : indique le nom de l'attribut dont on va comparer la valeur
- l'`opérateur` est un des opérateurs suivants :

| Operateur | Description            |
| --------- | ---------------------- |
| `>`       | Plus grand que         |
| `>=`      | Plus grand ou égal     |
| `<`       | Plus petit que         |
| `<=`      | Plus petit ou égal     |
| `<>`      | Différent (pas égal)   |
| `BETWEEN` | Entre deux valeurs     |
| `LIKE`    | Ressemble à un pattern |
- `valeur` est la valeur à laquelle on compare l'attribut.

### Exemples :
```sql
SELECT nom, prenom FROM eleves WHERE date_naissance > '2006-01-01';
```
Affiche le nom et le prénom de tous les élèves nés après le 01 janvier 2006.

```sql
SELECT email FROM eleves WHERE id_eleves <= 1005;
```
Affiche l'adresse email de tous les élèves dont l'identifiant est plus petit ou égal à 1005.

```sql
SELECT nom,prenom,email 
FROM eleves 
WHERE date_naissance BETWEEN '2007-01-01' AND '2007-12-31';
```
Affiche le nom, le prénom et l'adresse email de tous les élèves dont la date de naissance est comprise entre le 01 janvier 2007 et le 31 décembre 2007.

```sql
SELECT * FROM eleves WHERE nom LIKE 'R%';
```
Affiche toutes les informations (toutes les colonnes) pour les élèves dont le nom commence par la lettre 'R'.

### Remarques sur les opérateurs
#### Opérateurs : `<`,`<=`,`>`,`>=`,`<>`
Il s'agit des opérateurs de comparaison 'classiques'.
- Pour les valeur numériques : c'est l'**ordre sur les entiers et les réels** qui est applicable.
- Pour les chaines de caractère : 
  C'est l'**ordre sur les caractères** qui est applicable ('a'<'b'<'c'...<'z'<'A<'B'<'C'...<'Z')
  **Exemples :**
	- 'Robert' < 'Roger'
	- 'Sylvain' > 'Alice'
	- 'alice' < 'Alice'  (les minuscules viennet avant les majuscules)
#### Opérateur : `BETWEEN`
L'opérateur `BETWEEN` (qui signifie 'entre 2 valeurs'), comparera l'attribut qui le précède à un intervalle délimité par deux valeurs.

```sql
SELECT nom,prenom 
FROM eleves
WHERE id_eleves BETWEEN 1003 AND 1008;
```
**Sélectionne** le nom et le prénom **depuis** la table eleves, **où** les valeurs dans la colonne 'id_eleves' sont comprises **entre** 1003 **et** 1008.
#### Opérateur : `LIKE`
L'opérateur `LIKE` comparera l'attribut qui le précède à un *pattern* (motif, en français)
Un **motif** permet d'exprimer des chaînes de caractères de façon flexible; en remplaçant certaines parties par un caractère générique.
Un **caractère générique**, est un caractère qui peut représenter n'importe quel caractère (ou chaîne de caractères). 
En SQL, le caractère générique est le caractère **`%`**

**Exemples :**

| Exemple      | Signification                                                                                                                                                                                                                       |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| LIKE 'Ant%'  | La chaîne de caractère commence par 'Ant'<br>Exemple : 'Antoine', 'Antonin','Antinoé',...                                                                                                                                           |
| LIKE '%.com' | La chaîne de caractère se termine par '.com'<br>Exemple : 'google.com', 'exemple.com',...                                                                                                                                           |
| LIKE '%@%'   | La chaîne de caractère contient un '@' au milieu<br>C'est à dire : commence par n'importe quoi; et se termine par n'importe quoi; mais doit contenir le symbole '@' au milieu de la chaîne.<br>Exemple : toutes les adresses email. |
| LIKE 'r%r'   | Tous les mots qui commencent par la lettre 'r' et se terminent par la lettre 'r'<br>Exemple : 'radar', 'rever', 'rechigner',...                                                                                                     |
| Etc...       |                                                                                                                                                                                                                                     |

```sql
SELECT nom, prenom
FROM eleves
WHERE prenom LIKE '%hlo%'; 
```
Affichera le nom et le prénom des élèves dont le prénom contiendra les lettres 'hlo'.
Dans notre exemple de table; cela nous retournera `Thomas, Chloé`.
**Astuce** : ceci nous permet de prendre en compte toutes les variations que pourrait prendre le prnéom 'Chloé' dans notre table : chloé, chloe, Chloé,...

## Clause `ORDER BY`
Cette clause apparaît en dernier dans une requête de type SELECT.
Elle permet de trier les enregistrements :
- par ordre ascendant (du plus petit au plus grand) : `ASC`
- par ordre descendant (du plus grand au plus petit) : `DESC`

On précisera les attributs sur lesquels on désire effectuer ce tri.

```sql
SELECT *
FROM eleves
ORDER BY nom,prenom ASC
```
Affiche tous les champs, pour tous les élèves, en triant la liste par ordre croissant de nom, puis de prénom.

```sql
SELECT nom, prenom, date_naissance
FROM eleves
WHERE id_eleve BETWEEN 1002 AND 1009
ORDER BY date_naissance DESC
```
Affiche le nom, le prénom et la date de naissance de tous les élèves dont l'identifiant est compris entre 1002 et 1009.  Et trie la liste des résultats par date de naissance décroissante; c'est à dire des plus jeunes au plus âgés.

