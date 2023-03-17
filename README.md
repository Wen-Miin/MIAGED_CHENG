# MIAGED_CHENG
Wen-Miin CHENG, étudiante en M2 MIAGE spécialité INTENSE <br/>

[![forthebadge](https://forthebadge.com/images/badges/powered-by-overtime.svg)](https://forthebadge.com)  [![forthebadge](https://forthebadge.com/images/badges/powered-by-coders-sweat.svg)](https://forthebadge.com)

Projet de développement mobile avec Flutter <br/>
Application "Vinted" version light <br/>

## Getting Started
Lancer en ligne de commande : 
- flutter pub get 
- flutter run 
==> Lancer avec Chrome(web) <br/>

Pour se connecter <br/>
- login : wen@email.com 
- mdp : password 

## Fonctionnalités 

### Interface de login 
- Champs login et password pour se connecter 
- Champs password offusqué + bouton pour voir le contenu (désoffusqué)
- Pop-up si l'utilisateur n'est pas connu de la base de données (firebase) ou champs vides

### Liste de vêtements
- Liste déroulante des articles disponibles
- Possibilité de cliquer sur un produit pour accéder à son détail
- Récupération de la liste via firestore

### Détails d'un vêtement 
- Page contenant d'autres informations sur l'article 
- Bouton retour vers la page précédente 
- Bouton "Ajouter au panier" avec ajout dans firebase

### Panier 
- Liste des éléments présents dans le panier 

### Profil utilisateur 
- Affichage des informations de l'utilisateur 
- Bouton se déconnecter et revenir à la page de login

### Initié mais non terminé 
Quelques soucis sur comment manipuler firebase et les éléments dans le code
- Supression d'un élément du panier et répercussion dans firebase 
- Calcul du total du panier
- Récupération des informations de l'utilisateur connecté
- Validation et sauvegarde dans firebase des informations modifiées par l'utilisateur
- Possibilité de s'incrire si pas de compte (hors MVP)

