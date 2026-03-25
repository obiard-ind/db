# Le mot clé `NULL`
La mot-clé `NULL` désigne l'absence de valeur !
### Dans le contexte de la création de table :
On utilisera la mention `NOT NULL` pour indiquer qu'un attribut doit posséder une valeur.
C'est normal : puisque `NULL` désigne l'absence de valeur; `NOT NULL` impose la présence d'une valeur.

```sql
CREATE TABLE eleves(
    id_eleves INTEGER PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE,
    email VARCHAR(100) UNIQUE
);
```
## Dans le contexte de l'ajout d'un enregistrement
Il permet de préciser que l'on ne connaît pas la valeur à attribuer à un attribut.
**Par exemple :** si on ne connaît pas la date de naissance d'un élève; au lieu de mettre `''` (apostrophe simple répétée, pour indiquer une chaîne de caractères vide); on mettre tout simplement le mot-clé `NULL`

```sql
INSERT INTO eleves(id_eleves,nom,prenom,date_naissance,email) VALUES
(1011,'Dujardin','Benoît',NULL,'i.dupont@ecole-exemple.fr');
```

