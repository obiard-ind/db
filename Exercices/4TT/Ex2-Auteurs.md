
Dans la base de données `biblio.db` qui vous a été transmise; vous trouverez la table  `auteurs` dont le schéma est le suivant :

```sql
CREATE TABLE auteurs(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    date_naissance DATE NOT NULL,
    date_deces DATE,
    nationalite CHAR(2) NOT NULL, --fr, en, es, de,...
    type_litterature VARCHAR(200)
);
```

Ecrivez les requêtes permettant de répondre à chacun des énoncés suivants :
- Affichez la liste de tous les auteurs (avec toutes leurs caractéristiques)
- Affichez la liste des nom et prénom de tous les auteurs
- Affichez le nombre d'auteurs dans la table
- Affichez tous les auteurs nés après le 15 octobre 1940 (n'oubliez pas que les date sont stockée dans le format : AAAA-MM-JJ; par exemple '1940-10-15')
- Affichez la liste des nationalités différentes.  Chaque nationalité ne doit apparaître qu'une seule fois dans le résultat.
- Affichez le nom et le le prénom de tous les auteurs dont on ignore la date de décès.
- Affichez tous les auteurs ayant écrit de la philosophie.
- Affichez le nombre d'auteurs ayant écrit de la philosophie.
- Combien d'auteurs sont-il de nationalité française ?
- Combien d'auteurs sont-ils nés au 19ème siècle ? (entre '1800-01-01' et '1899-12-31') ?
- Qui sont les auteurs de nationalité française nés au 19ème siècle ?
- Existe-t'il des auteurs dont on ne connaît pas la nationalité ?

