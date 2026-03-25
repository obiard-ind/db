## Rappel :
Les enregistrements sont comme les lignes de notre table.
Tous le enregistrements d'une table partagent le même schéma (la structure de notre table).
## Insérer des enregistrements : `INSERT`
La commande qui sert à ajouter des enregistrements dans une table est la commande `INSERT`.
Sa syntaxe est la suivante :
```sql
INSERT INTO nom_table(attr1,attr2,attr3,...) VALUES (valeur1,valeur2,valeur3,...);
```
- `INSERT INTO` : mot clé qui indique que l'on veut insérer des enregistrements dans une table
- nom_table : on indiquera le nom de la table dans laquelle on veut ajouter des enregistrements
- (attr1,attr2, attr3,...) : on précisera le nom des attributs de la table, en séparant ceux-ci par des virgules.  La liste des attributs est entourées de parenthèses.
- `VALUES` : mot clé qui indique que l'on va préciser les valeurs que l'on va ajouter.
- (valeur1,valeur2,valeur3,...) : on précisera les valeurs que l'on veut ajouter.
  **Remarque :**
	- chaque valeur est associée à un attribut, dans l'ordre dans lequel ils apparaissent.
	  Exemple : valeur1 sera associé à attribut1, valeur2 à attribut2, etc...
	- En consquence de quoi :
		- la valeur doit respecter les règles qui ont été formulées dans le `schéma` pour cet attribut.
		- le nombre de valeurs doit correspondre au nombre d'attributs.
- ... et on indiquera; comme toujours, la fin de notre requête par un `;` 

### Exemple
En reprenant la table d'élèves que nous avons créé à l'aide de la commande `CREATE TABLE`
```sql
CREATE TABLE eleves(
    id_eleves INTEGER PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE,
    email VARCHAR(100) UNIQUE
);
```

On insérera des élèves de la façon suivante :
```sql
INSERT INTO eleves(id_eleves,nom,prenom,date_naissance,email) VALUES
(1011,'Dupont','Isabelle','2012-05-15','i.dupont@ecole-exemple.fr');
```
**Rem** : on répétera la commande pour chaque nouvel enregistrement d'un élève.
**Les valeurs :** vous noterez que :
- les **nombres** ne sont pas entourés de guillemets !
- les **chaîne de caractères** sont entourées de guillemets simples !
- les **dates** sont entourées de guillements simples; et dans le format AAAA-MM-JJ (Année-Mois-jour).

**Attention aux contraintes sur les valeurs:
- pour l'attribut marqué avec `PRIMARY KEY`, il faut s'assurer que :
	- la valeur que l'on va ajouter n'existe pas déjà dans la table
	- l'on a bien une valeur ! Cet attribut ne peut pas être vide (`NOT NULL`)
- pour les attributs marqués `NOT NULL`; il faut s'assurer qu'une valeur est bien fournie ! Ces attributs ne peuvent être vides (`NOT NULL`)
- ici, l'attribut 'date_naissance' ne possède pas de contrainte :
	- il peut donc ne pas posséder de valeur (il peut donc être `NULL`)
	- et s'il en possède une, elle n'est obligée d'être unique pour cet attribut.  En d'autres termes; dans notre exemple : plusieurs élèves peuvent avoir la même date de naissance.
- pour l'attribut 'email' de notre exemple; celui-ci est marqué comme étant `UNIQUE`.  Ce qui signifie que deux élèves différents ne peuvent avoir une même adresse email.


