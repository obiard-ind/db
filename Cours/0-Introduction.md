# Pourquoi les bases de données ?
L'on pourrait se demander pourquoi utiliser des bases de données alors que l'on pourrait se contenter d'enregistrer directement les informations dans des fichiers; voire dans des tableaux (du type 'Google-Sheets', 'Microsoft Excel' ou 'LibreOffice Calc'...).

Il faut pour cela faire la distinction entre :
- #def une **base de données (BD... ou DB, en anglais)**, qui est une une représentation structurée de données.
- #def un **système de gestion de bases de donnée (SGBD)**, qui est le logiciel qui va permettre de gérer ces bases de données (accès aux données, vérification de l'intégrité des données,...).

Les bases de données et leur utilisation au travers d'un SGBD offrent de multiples avantages :
- Un enregistrement **structuré** des données (d'après un **schéma**)
- La garantie de l'**intégrité** des données (au travers de la mise en place de **contraintes** et de **transactions**) 
- etc...
... nous verrons plus tard ce que cela signifie ! Ne vous tracassez pas ;-).

# Identification des composants d'une DB 

Une **base de données** est constituée de **tables**.
Les **tables** sont constituées de **lignes** (les enregistrements) et de **colonnes**, qui en décrivent les propriétés.
Chaque **colonne** est décrite par un **type** de valeurs, qui indique quelles sont les **valeurs** permises dans une colonne (eg. Entier, Chaîne de caractères, date,...).

## Quelques exemples de tables

*Une table des noms d'auteurs*
![[Pasted image 20260124183158.png]]

*Une table des clients*
![[Pasted image 20260124183429.png]]

*Une table des produits*
![[Pasted image 20260124183552.png]]

*Une table des magasins*
![[Pasted image 20260124183657.png]]


