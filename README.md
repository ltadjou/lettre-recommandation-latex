
# Modèle de lettre de recommandation

Modèle LaTeX pour une lettre de recommandation pour un étudiant.

## Installation

Copiez simplement le fichier `recommandation.cls` dans un répertoire accessible à LaTeX.

## Utilisation

Voici les commandes disponibles:

- `\etablissement` : défini le nom de l'établissement. C'est la seule commande obligatoire (voir l'exemple `empty.tex`);
- `\ville` : définie la ville de l'établissement;
- `\formation`: défini le nom de la formation;
- `\logo`: le nom du fichier à utiliser comme logo de l'établissement (n'importe quel fichier utilisable par `\includegraphics` peut être utilisé)
- `\lieux`: lieux de signature de la lettre;
- `\qualite`: qualité du signataire (par défaut «Responsable de formation»)
- `\responsable`: nom et prénom du signataire;
- `\email`: adresse de courriel du signataire;
- `\tel`: numéro de téléphone du signataire;
- `\signature`: fichier contenant la signature du signataire;
- `\periode`: descriptif de l'année;
- `\effectif`: effectif de la promo;
- `\niveauPromo`: défini le niveau général de la promotion. Les valeurs possibles sont:
  - `\MoyMoins`: au dessous de la moyenne,
  - `\Moy`: moyen,
  - `\MoyPlus`: au dessus de la moyenne,
  - `\Eleve`: élevé;
- `\femme`: change «étudiant» en «étudiante» dans les labels;
- `\nom`: le nom de l'étudiant(e)
- `\prenom`: le prénom de l'étudiant(e)
- `\rang`: définie le rang de l'étudiant(e), ou `\classement` pour ne spécifier que le quart d'appartenance, parmi `\PremierQuart`, `\DeuxiemeQuart`, `\TroisiemeQuart`, `\QuatriemeQuart`;
- `\avis` de poursuite, parmi `\TresFavorable`, `\Favorable`, `\Reserve`, `\Defavorable`, `\SansAvis`;
- `\observations` définissant un paragraphe d'observation. Deux commandes utiles peuvent être utilisées ici: `\etudiant` qui affiche le prénom et le nom de l'étudiant (utile pour créer des modèles d'observations) et `\cqdd` qui affiche «Fait pour valoir ce que de droit.»

L'ordre des commandes n'est pas important, elles ne font que définir les valeurs qui seront utilisées par le modèle.

Un fichier ne contenant que le nom (et le logo) de l'établissement génère un modèle pouvant être rempli à la main. 

## Exemples

Deux fichiers exemples sont disponibles: `empty.tex` et `example.tex`. Exécutez `make` pour générer les PDF associés.

## Astuce

Comme il est probable que les informations concernant la formation soient les mêmes pour plusieurs lettres, il peut être intéressant de les définir dans un fichier à part qui sera inclus ensuite. Pour reprendre le fichier `example.tex`, on pourrait ainsi créer un fichier `licence-UI.tex` contenant:

```latex
\etablissement{Université de l'Invisible}
\ville{Ankh-Morpork}
\formation{Licence de magie}
\logo{UUcoatofarms}
\lieux{Lancre}
\responsable{Cogite \bsc{Stibon}}
\email{cogite.stibon@univ-invisible.am}
\tel{+33(0)~123~456~789}
\signature{sig}
```

et un fichier `lefevre.tex`:

```latex
\documentclass{recommandation}
\begin{document}
\input{licence-UI}
\effectif{42}
\niveauPromo{\Moy}

\femme
\nom{Lefèvre}
\prenom{Eskarina}
\classement{\PremierQuart}
\avis{\TresFavorable}

\observations{%
\etudiant{} est une étudiante brillante. C'était vraiment très très bien de l'avoir
en cours toutes ces années. Elle va amèrement nous manquer.
\cqdd
}
\end{document}
```

## Licence

    Copyright © 2016 Yannick Loiseau <me@yloiseau.net>

    This work is free. You can redistribute it and/or modify it under the
    terms of the Do What The Fuck You Want To Public License, Version 2,
    as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.


[![WTFPL](http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-2.png)](http://www.wtfpl.net/)

## Contributions

Vous pouvez proposer des améliorations ou signaler des bugs dans les « issues », ou proposer des contributions via une « pull request ».
