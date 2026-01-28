# Ex1 - Installation et première DB

## Présentation du contexte (UAA12 : Projet Web)
Nous allons utiliser SQLite dans le cadre du projet Web (UAA12).
Avant de voir comment utiliser SQLite avec Python, dans Flask; je vous propose de faire quelques révisions de votre cours de DB.
Pour ce faire, je vous propose d'utiliser le thème du projet; à savoir la gestion de tâches.

## Installation
[[4-SQLite - CLI|Installez SQLite]] et créez une première DB (cf. documentation en ligne : https://sqlite.fr)
# Etape 1 : modélisation conceptuelle
Commencez par modéliser une base de données qui contiendra des utilisateurs et des tâches.
Les utilisateurs auront un nom, prénom, adresse email et mot de passe.
Les tâches posséderont un titre (max. 250 caractères), une description, une date de rappel et une date d'échéance.
Toute tâche sera associée à un et un seul utilisateur.
Un utilisateur pourra cependant posséder plusieurs tâches.
## Etape 2 : modélisation logique
Etablissez le modèle logique.

## Etape 3 : création du schéma
A l'aide de commandes SQL (DDL), créez le schéma de votre base de données.

## Etape 4 : ajout d'enregistrements
A l'aide de commandes SQL (DML), ajoutez quelques enregistrements dans vos tables.






