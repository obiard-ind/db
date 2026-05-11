## Modéliser les magasins et les gérants.

Nous avons une chaine de magasins; ou chaque magasin est identifié par un numéro de magasin; et où chaque magasin est localisé par son adresse; qui est forcément unique (vu que deux magasins ne peuvent occuper le même emplacement physique).

Chaque magasin est en outre géré par un gérant.  Lors de son inscription auprès de la chaîne, le gérant doit fournir quelque données obligatoires; à savoir : son numéro national, son snom, son prénom et une adresse de domicile.

Il arrive parfois que certains magasins n'ont pas de gérant (soit parce qu'il s'agit de nouveaux magasins, soit parce que l'ancien gérant est parti, et qu'on n'en a pas encore trouvé d'autre.)

De la même façon, un gérant peut gérer plusieurs magasins; mais il arrive aussi qu'après avoir démissionné, ses informations soient toujours enregistrées alors qu'il ne gère plus aucun magasin.

## Modéliser les magasins est les produits

Dans un magasin, on retrouve différentes sortes de produits.  Mais il y a tellement de produits que tous les magasins ne peuvent les proposer à la vente.  Ainsi, certains magasins vendront certains produits et pas d'autres.
En revanche, la chaîne qui possède les magasins ne peut se permettre d'avoir des produits en stock qui ne sont proposés par aucun magasin à la vente; c'est à dire qu'un type  de produit est proposé dans au moins un magasin.

Le produits sont identifié par un numéro de produit.  Il possèdent un nom qui les décrit (eg. 'Savon de Marseille'); une date de péremption optionnelle, et un prix.




