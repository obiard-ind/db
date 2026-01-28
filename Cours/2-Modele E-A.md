# Le modèle E/A (Entité / Association)
Le modèle Entité-Association est un **modèle conceptuel**; c'est à dire qu'il nous permettra de représenter notre base de données indépendamment de toute implémentation concrète.  Il n'est donc pas ici question de tables, de colonnes, de clés ou d'enregistrements.
On utilisera pour ce faire des **concepts** pour les représenter.

| Réalité               | Modèle                 |
| --------------------- | ---------------------- |
| ![[kitchen_real.jpg]] | ![[kitchen_model.jpg]] |

## Concepts utilisés dans le modèle E/A

### Entités et associations

#def Une **entité** représente un élément du monde réel ou un événement.
#def Un **type d'entité** représente une classe d'entités de même nature.
- Exemple : l'élève "Jean DUPONT" est une <u>entité</u> appartenant au <u>type d'entité</u> 'élèves'
#def Une **association** représente un lien particulier entre plusieurs entités
#def Un **type d'association** représente une relation (au sens mathématique) entre types d'entités.
- Exemple d'assocation : la personne 'Sylvain DUPUIS' appartenant au type d'entités 'personnes' <u>possède</u> la voiture immatriculée '1-TZB-285'; laquelle appartient au type d'entité 'voitures'.
- Exemple de type d'association (cf. tableau ci-dessous) : la relation <u>possède</u> qui relie le type d'entité utilisateurs au type d'entité voitures; indique qu'un utilisateur (quelconque) peut posséder plusieurs voitures (0..n) voitures; et qu'une voiture (quelconque) peut être détenue par au plus 1 utilisateur (0..1).  

| Réalité                        | Concept du modèle E/A   | Représentation graphique             |
| ------------------------------ | ----------------------- | ------------------------------------ |
| table                          | Type d'Entité (TE)      | ![[Pasted image 20260126145224.png]] |
| relation entre tables          | Type d'Association (TA) | ![[Pasted image 20260126145511.png]] |
| enregistrement                 | Entité                  | Non représenté                       |
| relation entre enregistrements | Association             | Non représenté                       |
| propriété                      | Attribut                | ![[Pasted image 20260126145943.png]] |
**Rem** : le modèle E/A ne représente pas les enregistrements individuels ou les relations entre enregistrements particuliers; car le but d'un modèle est de représenter les caractéristiques générales et non de s'attarder sur les caractéristiques particulières.
### Contraintes
#def les **contraintes** sont des règles que les données doivent respecter à tout moment !
On distinguera les **contraintes d'intégrité** et **les contraintes référentielles**.
#### Les contraintes d'intégrité
Garantissent la **cohérence des données** introduites.
- Contraintes sur les **attributs** : garantit que les valeurs introduites sont autorisées. 
	- On indiquera en regard de l'attribut : le type des valeurs autorisées (int, varchar, boolean,...) pour cet attribut; ainsi que la longueur éventuelle.
	- On précisera si la valeur est obligatoire : **not null**
- Contraintes sur les **entités** : garantit l'unicité de chaque **entité** (enregistrement)
	- La clé primaire : on <u>soulignera</u> le nom des attributs qui participent à ce type de contrainte. 
<p align="center">
    <img src="Pasted image 20260126162324.png" width="200"/>
</p>
#### Les contraintes référentielles
Garantissent la **cohérence des relations** entre les types d'entités.
Dans le modèle E/A, elles s'expriment sous la forme de **cardinalités** apposées à chaque extrémité du lien qui relie 2 Type d'Entités (TE).

Ces cardinalités, exprimées sous forme d'un couple d'entiers (min,max) indiquent le nombre minimum et maximum d'entités du type opposé que l'on peut relier à chaque entité du type.

Exemple : 
- Tout utilisateur possède entre 0 et n voitures.
- Toute voiture est possédée (appartient) à au plus 1 utilisateur
  Rem : ceci autorise qu'une voiture ne puisse avoir plusieurs propriétaires simultanément; mais égalemnent que certaines voitures n'aient pas de propriétaires (eg. voitures en showroom)

![[Pasted image 20260126145511.png]]

# Conventions de nommage
pour les types d'entités (tables) : *snake case* + pluriel
pour les attributs (colonnes) : *snake case*