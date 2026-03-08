# Ex-0 : téléchargement et exécution de SQLite
1. Créez un dossier que vous nommerez 'DB'
2. Téléchargez SQLite dans ce dossier; et exécutez le fichier `sqlite3.exe` afin d'afficher l'interpréteur de commande.
   Rem : les instructions détaillées sont dans [DB\Cours\4-SQLite-CLI](../../Cours/4-SQLite%20-%20CLI.md)

# Ex-1 : création de notre première DB
Nous allons créer une base de données qui contiendra des informations relatives à différentes catégories d'informations que l'on peut devoir gérer au sein d'une école.  Nous nommerons naturellement celle-ci : `ecole`
1. Créez votre première base de données que vous appelerez `ecole.sqlite3`
2. Vérifiez à l'aide de la commande `.databases` le nom et le chemin associé à la DB en cours d'utilisation.
# Ex-2 : une table d'élèves
Au sein de notre base de données (si elle n'a pas encore été créée; créez-la; sinon, ouvrez-la); nous allons créer quelques tables pour nous entrainer.  Dans un premier temps; celles-ci ne seront pas reliées les unes aux autres; mais nous les ferons évoluer au fil des exercices.
## Création d'une table d'élèves
**Rem** : la table que nous allons créer recèle un problème... pouvez-vous l'identifier ?

Créez une table nommée `eleves`, qui contiendra les informations relatives à des élèves. 
Celle-ci contiendra, pour chaque élève, les informations suivantes : 
- un numéro de matricule (qui servira d'identifiant) et correspondra au numéro national de l'élève
  **Info** : le numéro national est un identifiant que possède chaque citoyen.   Vous le trouverez au verso de votre carte d'identité.  En Belgique, il possède la structure suivante : 
  ```
Les 6 premières positions forment la date de naissance en sens inverse ; les 3 positions suivantes constituent le compteur journalier des naissances. Ce chiffre est pair pour les femmes et impair pour les hommes ; les 2 dernières positions constituent le chiffre de contrôle.
Exemple : 090515-203.45
  ```
- un nom,
- un prénom,
- son âge (en années),
- le nom de la ville où il habite,
- le code postal associé à cette ville,
- la rue et le numéro de la maison

Affichez à présent les tables présentes dans votre DB pour vous assurer que vous table a bien été créée.  Vous utiliserez pour cela la commande `.tables`
## Ajouter des élèves à notre table
Maintenant que nous avons créé la structure de notre table, nous allons ajouter des élèves dans celle-ci.  Nous allons utiliser pour cela la syntaxe SQL `INSERT INTO...` pour ajouter ces enregistrements à notre table.
**Rem** : Il existe des manières plus rapide de charger un grand nombre d'enregistrement; et vous trouverez peut-être cette syntaxe un peu répétitive; mais c'est cette répétition de l'usage des commandes qui aide à se familiariser avec et à retenir celles-ci.

Pour les besoins de l'exercice; vous allez créer une quinzaine d'élèves : 
- 6 habiteront à Philippeville (code postal : 5600)
- 4 habiteront à Florennes (code postal : 5620)
- 3 habiteront à Walcourt (code postal : 5650)
- 2 habiteront à Couvin (code postal : 5660)
Parmi ces élèves : 1 aura 14 ans, 3 auront 15 ans, 6 auront 16 ans, 3 auront 17 ans, 1 aura 18 ans.   

Vous pouvez vous aider de l'IA pour générer des élèves fictifs !

## Rechercher des élèves dans notre table
Nous allons à présent utiliser notre base de données pour rechercher des information sur les élèves.  Voici les recherches que nous désirons mener
- Afficher toutes les informations sur tous les élèves
- Afficher uniquement le nom, le prénom et l'âge des élèves
- Afficher uniquement le matricule, le nom et le prénom des tous les élèves
- Afficher le nom et le prénom de tous les élèves de plus de 16 ans
- Afficher le nom et le prénom et l'âge de tous les élèves de plus de 15 ans
- Afficher le nom, le prénom et la ville de tous les élèves de moins de 17 ans
- Afficher toutes les infos sur les élèves qui habitent à Philippeville.
- Afficher le matricule, le nom et le prénom de tous les élèves qui habitent à Florennes.

**Rem** : avez-vous identifié le problème que recèle notre table ? Si pas; affichez toutes les informations sur tous les élèves... 














