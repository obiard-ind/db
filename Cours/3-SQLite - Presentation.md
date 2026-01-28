# Qu'est-ce que SQLite ?
[SQLite](https://sqlite.org/) est un SGBD (Système de Gestion de Bases de Données), à l'instar de MySQL, MariaDB, PostgreSQL, SQL Serveur, Oracle,... mais avec quelques différences notables : voir [[3-SQLite - Presentation#Limitations|Limitations]] !

SQLite est, en termes de nombres de déploiements, le SGBD le plus répandu au monde !
## Domaines d'utilisation de SQLite
- Logiciels embarqués (smartphones, voiture,...)
- IoT (sondes,... divers appareils connectés ou non : frigo, imprimante, tv,...)
- Applications de bureau (Web browsers,...)
- Sytèmes d'exploitation (Gestion des log files,...)
- Analyse de données (exportation et exploitation)
- Petites applications personnelles, enseignement,...
- etc...
# Caractéristiques de SQLite
- Léger : < 1 Mo
- Multi-plateformes : Windows, Linux, MacOS,...
- Mutli-architectures : x86, ARM
- Auto-contenu : pas de dépendances externes (librairies) requises.  Un seul fichier :
	- Sous Windows : sqlite3.exe
	- Sous Linux : sqlite3
- Zero-configuration : pas de configuration requise
- Portable : pas besoin de droits administrateurs pour l'utiliser
- Complet : 
	- Gestion des tables, index, triggers, views,...
	- Gestion des contraintes : check, unique, not null, keys (foreign et primary)
	- Transaction ACID : commit, rollback
	- Support de SQL (DDL et DML) 
	- etc...
- Fiable :
	- Stable : open-source, développé, testé etmaintenu par une équipe d'experts.
	- Disponible à long terme : le format est garantit lisible jusque 2050 (au moins)
	- Maintenu activement
	- Open-source : bien documenté, n'appartient pas à une compagnies privée.

## Limitations
Tous ces avantages (légèreté, portabilité, zero-configuration) ont un coût !
- SQLite n'utilise pas une architecture client-serveur ! (Contrairement aux autres SGBD sus-mentionnés (MySQL / MariaDB, PostgreSQL,...).
- SQLite écrit au contraire directement dans un fichier.

Ceci se traduit par les limitations suivantes :
- Concurrence d'écriture (limitée à un seul utilisateur à la fois) : bien que plusieurs accès en lecture simultanés sont possible; un seul accès en écriture est autorisé à la fois.
- Pas de système de gestion des utilisateurs et des droits / rôles : tout utilisateur qui a accès au fichier contenant la DB a accès à son contenu !
  **Attn** : <u>ne jamais mettre une DB SQLite sur un support (local ou cloud) non sécurisé !</u>
- Piètre performance si la DB est stockée sur un support réseau :
	- Lenteur
	- <u>Risque que la base de donnée devienne corrompue</u> !!!
	=> Il est recommandé que la DB soit *locale* par rapport à l'application qui l'utilise.
- Typage flexible : le type de donnée défini pour une colonne est indicatif.  
	- <u>Risque de données incohérentes</u> : si la donnée introduite dans une colonne ne correspond pas au type défini pour celle-ci; SQLite tentera de la convertir; et s'il n'y arrive pas, ajoutera la donnée quand même !
  =>  C'est à l'application de s'assurer que le type de la donnée correspond bien au type de la colonne dans laquelle elle l'insère !

