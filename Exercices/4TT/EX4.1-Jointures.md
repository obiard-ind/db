Cette première série d'exercices à pour objectif de vous initier aux jointures en utilisant les propriétés des clés étrangères comme *clé* pour associer les tables entre elles; et en combiner les valeurs obtenues (après le mot clé `SELECT`) pour obtenir les résultats souhaités.
# Schéma de la DB
Le présent schéma relie des livres à leurs auteurs; et ces derniers à leur nationalité.

```sql
CREATE TABLE auteurs(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    date_naissance DATE NOT NULL,
    date_deces DATE,
    nationalite CHAR(2),
    FOREIGN KEY(nationalite) REFERENCES nationalite(code_pays)
);
CREATE TABLE livres(
	isbn13 VARCHAR(20) PRIMARY KEY,
	titre VARCHAR(30) NOT NULL,
	num_pages INTEGER,
	date_publication DATE,
	auteur INTEGER,
	FOREIGN KEY(auteur) REFERENCES auteurs(id)
);
CREATE TABLE nationalite(
    code_pays CHAR(2) PRIMARY KEY, --fr, en, es, de, ru,...
    pays VARCHAR(20) UNIQUE NOT NULL
);
```

# Prompt ChatGPT : génération de données

```
Pourrais-tu me générer des enregistrements pour la base de données dont le schéma est est en pièce jointe.

Je voudrais que tu me crée, sur base d'une bibliographie réelle, les enregistrements dans les tables concernées.

N'oublie pas que le mot clé NULL; là où il apparaît, ne doit pas être considéré comme une chaîne de caractères.

Le fichier que tu me généreras sera constitué d'instructions INSERT INTO

Pour la table 'auteurs' :
- elle contiendra au moins 20 auteurs différents;
- 18 auteurs seront associés à au moins un livre dans la table 'livres'
- on connaît la nationalité de chacun des auteurs
  
Pour la table 'livres' :
- tous les livres sont écrits par un auteur
- elle contiendra 60 livres
  
Pour la table 'nationalité' : 
- crée-moi au moins les nationalités associée aux codes (fr, en, es, de) et 5 autres.
- certaines nationalités peuvent n'être associées à aucun auteur.
```

# Exercices jointure (ChatGPT)
*Prompt ChatGPT pour demander les exerices*
```
Propose-moi quelques exercices sur les jointures au départ de ce schéma : inner join, left join, right join.
Environ 10 exercices
```

Voici une série d’exercices progressifs basés sur ton schéma (**AUTEUR, LIVRE, NATIONALITE**) pour t’entraîner aux **INNER JOIN, LEFT JOIN et RIGHT JOIN**.

---

## 🔹 Rappel des tables

- **AUTEUR** (`id`, `nom`, `prenom`, `date_naissance`, `date_deces`, `nationalite`)
- **LIVRE** (`isbn13`, `titre`, `num_pages`, `date_publication`, `auteur`)
- **NATIONALITE** (`code_pays`, `pays`)

---

# 🧠 Exercices

## 🟢 Niveau 1 – INNER JOIN (bases)

### Exercice 1

Afficher le **nom, prénom et titre des livres** pour tous les livres ayant un auteur.

👉 Utilise un `INNER JOIN` entre AUTEUR et LIVRE.

---

### Exercice 2

Afficher le **titre des livres et leur date de publication**, ainsi que le **nom de l’auteur**.

---

### Exercice 3

Afficher le **nom des auteurs et leur nationalité (nom du pays)**.

👉 Jointure entre AUTEUR et NATIONALITE.

---

### Exercice 4

Afficher pour chaque livre :

- le titre
- le nom de l’auteur
- le pays de nationalité

👉 Nécessite **2 jointures**.

---

## 🟡 Niveau 2 – LEFT JOIN

### Exercice 5

Afficher **tous les auteurs**, même ceux qui n’ont écrit **aucun livre**, avec :

- nom
- titre du livre (si existant)

👉 Les auteurs sans livre doivent apparaître avec `NULL`.

---

### Exercice 6

Afficher toutes les nationalités avec les auteurs correspondants.

👉 Certaines nationalités n’ont **aucun auteur** → elles doivent quand même apparaître.

---

### Exercice 7

Afficher tous les auteurs avec :

- leur nom
- leur nationalité (nom du pays)

👉 Même si certains auteurs n’ont **pas de nationalité**.

---

## 🟠 Niveau 3 – RIGHT JOIN

### Exercice 8

Afficher tous les livres avec :

- leur titre
- le nom de leur auteur

👉 Même si un livre n’a **pas d’auteur** (selon le schéma).

---

### Exercice 9

Afficher toutes les nationalités avec :

- les noms des auteurs associés

👉 Utilise un `RIGHT JOIN` (ou LEFT en inversant les tables).

---

## 🔴 Niveau 4 – Combinaisons et réflexion

### Exercice 10

Afficher :

- tous les auteurs
- tous leurs livres (s’ils existent)
- leur nationalité

👉 Contraintes :

- tous les auteurs doivent apparaître
- même sans livre
- même sans nationalité

👉 Indice : plusieurs `LEFT JOIN`

---

## 🔹 Bonus (optionnel)

### Exercice 11

Afficher les auteurs **qui n’ont écrit aucun livre**.

👉 Astuce :

- `LEFT JOIN`
- filtrer avec `WHERE ... IS NULL`

---

### Exercice 12

Afficher les nationalités **sans auteur associé**.

---

## 🎯 Objectif pédagogique

Ces exercices te permettent de comprendre :

- `INNER JOIN` → intersection
- `LEFT JOIN` → tout à gauche
- `RIGHT JOIN` → tout à droite
- gestion des `NULL`
- enchaînement de jointures

---

Si tu veux, je peux aussi :

- corriger tes réponses
- ou te donner les solutions détaillées étape par étape 👍