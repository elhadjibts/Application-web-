# Application-web-

Gestion des fiches pédagogiques
Pour ce projet, je vous propose d’utiliser les technologies Symfony-Angular-Material design.
Elles vont nous permettre de découper facilement le projet et aussi d’avoir une application
maintenable et ergonomique.
Le point de départ est les fiches pédagogiques que vous avez remplies chaque semestre. Elles
comprennent des informations personnelles et vos inscriptions aux UE du semestres. Après
validation par le responsable pédagogique, ces données sont transmises par nos secrétaires à
l’administration aux formats papiers.
Imaginons le scénario d’utilisation de la future application :
1) L’étudiant se connecte
2) Remplit la fiche renseignement personnelle
3) Sélectionne les UE
4) L’enseignant responsable valide (ou ne valide pas)
5) La secrétaire imprime la fiche et la transmet
Pour la mise en oeuvre de scénario, nous avons besoin :
a) La liste des étudiants inscrit par années
b) Savoir si un étudiant est AJAC
c) Si la fiche de renseignement personnelle avait déjà été rempli, une simple vérification
suffit
d) L’enseignant responsable doit avoir la liste des fiches validées et non validées ainsi
que les étudiants n’ayant pas remplis leur fiche
e) La secrétaire doit connaitre la liste des fiches déjà transmises, non transmises
Le bonus du projet :
a) Avoir la liste des étudiants inscrit par années accessible par les enseignants
b) Avoir la liste des étudiants inscrit à une UE avec l’indication RSE
c) Générer une liste aux formats tableur.
Découpage du projet
Symfony permet d’écrire très facilement des web services. Le principe d’Angular est de
composer des composants. Material design garantit l’ergonomie de l’application. Je propose
d’utiliser dans la mesure du possible sqlite pour éviter de se compliquer la vie. Regardons
quelques web services et composants à développer.
Web service
1) Pour la connexion, validation d’un login et mot de passe
2) A partir de l’identifiant d’une personne, récupérer le statut de la personne (enseignant,
administratif, étudiant avec indication de l’inscription)
3) Obtenir les informations personnelles d’un étudiant
4) Obtenir la liste des UE d’un semestre
Composants angular
1) Fenêtre de connexion
2) Fiche information personnelle
3) Fiche choix d’UE
4) Liste d’étudiants
5) Et plein d’autres …
Pour accomplir ces différentes taches, nous avons besoins :
1) Des fiches pédagogiques utilisées par le secrétariat
2) De connaitre la procédure d’installation de l’application finale. Elle est à discuter avec
nos ingénieurs
3) De savoir s’il est possible accéder à l’annuaire LDAP, si oui, comment et sous quelles
conditions
4) De préciser notre environnement de test. Par exemple, utiliser Docker
