# Ex0 : Création d'une DB de livres et d'auteurs
Vous allez créer une petite base de données destinée à enregistrer des informations sur les livres de votre bibliothèque.

Celle-ci contiendra 2 tables :
- Une table `auteurs` : contiendra des informations relatives aux auteurs des livres
- Une table `livres` : contiendra des information sur les livres.

Concernant les **auteurs**, nous enregistrerons les informations suivantes : le nom, le prénom, la date de naissance, la date de décès.  Toutes ces informations sont obligatoires; sauf la date de décès qui, elle, peut être optionelle (en effet, nous ne disposons pas de date de décès si l'auteur est toujours en vie).  L'auteur sera identifié par un numéro unique au sein de notre base de données.

En ce qui concerne les livres; dans un premier temps, l'on considérera que chacun de ceux-ci n'a été écrit que par un seul auteur.  Chaque livre possédera en outre : un titre, une date de publication; un éditeur (eg. "Flammarion", "Le livre de poche",...), un nombre de pages et sera identifié par son numéro [ISBN-13](https://fr.wikipedia.org/wiki/International_Standard_Book_Number).  Toutes ces données seront obligatoires.

## SQL DDL : création du schéma

**Rappel** : avant de vous lancer dans la création de votre base de données; n'oubliez pas de créer les schémas conceptuels et logiques de celle-ci.

Il vous est demandé de :
- [ ] Créer votre base de données
- [ ] Créer au sein de celle-ci; les tables `auteurs` et `livres`; chacune contenant les attributs demandés.
- [ ] Pour chaque attribut :
	- [ ] de vérifier que le type de données déclaré correspond bien au type de donnée qui sera utilisé.
	- [ ] de s'assurer que si celui-ci est obligatoire; il ne sera pas possible d'ajouter un enregistrement qui omettrait cette information.
- [ ] Pour chaque table; de disposer d'un *identifiant*; qui permettra de distinguer les enregistrements entre eux.
- [ ] Relier ces deux tables à l'aide d'une *clé étrangère*

## SQL DML : ajout d'enregistrements
Une fois votre base de données ainsi créée; vous ajouterez des enregistrements dans vos deux tables.
**Tip** : pour ce faire, rendez-vous sur le site d'un vendeur de livres en ligne (eg. Fnac, Amazon,...) pour trouver les informations souhaitées.

Dans la table **auteurs** : 
- vous ajouterez 5 auteurs minimum (dont au moins 3 auront écrit plusieurs livres enregistrés dans votre table **livres**)
Dans la table **livres** : vous ajouterez 10 livres minimum.

## SQL DML : 
Maintenant que vous avez créé votre base de données; vous pouvez questionner celle-ci afin d'en extraire des données.

- Affichez la liste des tous les auteurs
- Affichez la liste de tous les livres
- Affichez la liste de tous les auteurs dont le nom commence par un préfixe déterminé.
- Affichez la liste de tous les livres qui contiennent un mot déterminé.
- Affichez la liste de tous les auteurs encore en vie
- Affichez la liste de tous les livres édités par un éditeur donné
- Affichez la liste de tous les livres dont le numbre de pages est supérieur à un nombre de pages donné.
- Affichez la liste de tous les auteurs nés avant une date donnée.
- Affichez la liste de tous les livres écrits par un auteur donné
- Affichez le nom et le prénom de l'auteur d'un livre donné.
- etc...

