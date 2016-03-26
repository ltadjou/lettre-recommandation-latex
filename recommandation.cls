% Copyright © 2016 Yannick Loiseau <me@yloiseau.net>
%
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{recommendation}

\LoadClass[a4paper,12pt,french]{article}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1,OT1]{fontenc}
\RequirePackage[french]{babel}
\RequirePackage{ae,aeguill}
\RequirePackage{textcomp}
\RequirePackage[variablett]{lmodern}
\RequirePackage[np,autolanguage]{numprint}
\RequirePackage[hyphenation,parindent,lastparline]{impnattypo}
\RequirePackage{graphicx}
\RequirePackage{wasysym}
\RequirePackage{pifont}
\RequirePackage{xcolor}
\RequirePackage[margin=1.5cm]{geometry}


%#############################################

\def\@etudiant{étudiant}
\newcommand{\femme}{\def\@etudiant{étudiante}}

\def\@nom{\dotfill}
\newcommand{\nom}[1]{\def\@nom{#1}}

\def\@prenom{\dotfill}
\newcommand{\prenom}[1]{\def\@prenom{#1}}

\newcommand{\etudiant}{\@prenom{} \bsc{\@nom}}

\def\@periode{}
\newcommand{\periode}[1]{\def\@periode{#1}}

\def\@formation{\dotfill}
\newcommand{\formation}[1]{\def\@formation{#1}}

\def\@effectif{\dotfill}
\newcommand{\effectif}[1]{\def\@effectif{#1}}

\def\Eleve{\Square}
\def\MoyPlus{\Square}
\def\MoyMoins{\Square}
\def\Moy{\Square}
\newcommand{\niveauPromo}[1]{\def#1{\XBox}}

\newif\ifclassement{\classementtrue}
\def\PremierQuart{\Square}
\def\DeuxiemeQuart{\Square}
\def\TroisiemeQuart{\Square}
\def\QuatriemeQuart{\Square}
\newcommand{\classement}[1]{\classementtrue\def#1{\XBox}}

\def\@rang{\dotfill}
\newcommand{\rang}[1]{\classementfalse\def\@rang{#1}}

\def\TresFavorable{\Square}
\def\Favorable{\Square}
\def\Reserve{\Square}
\def\Defavorable{\Square}
\def\SansAvis{\Square}
\newcommand{\avis}[1]{\def#1{\XBox}}

\def\@observations{}
\newcommand{\observations}[1]{\def\@observations{#1}}

\def\@etablissement{\textcolor{red}{Nom de l'établissement}}
\newcommand{\etablissement}[1]{\def\@etablissement{#1}}

\def\@lieux{}
\newcommand{\lieux}[1]{\def\@lieux{Fait à #1}}

\def\@ville{}
\newcommand{\ville}[1]{\def\@ville{ -- #1}}

\def\@logo{}
\newcommand{\logo}[1]{\def\@logo{\includegraphics[width=3cm]{#1}}}

\def\@responsable{}
\newcommand{\responsable}[1]{\def\@responsable{#1}}

\def\@email{}
\newcommand{\email}[1]{\def\@email{\ding{41}~\texttt{#1}}}

\def\@tel{}
\newcommand{\tel}[1]{\def\@tel{\ding{37}~#1}}

\def\@signature{}
\newcommand{\signature}[1]{\def\@signature{\includegraphics[width=3cm]{#1}}}

\newcommand{\cqdd}{\par{}Fait pour valoir ce que de droit.}

\newcommand{\makeit}{
\pagestyle{empty}
\thispagestyle{empty}

\begin{minipage}{.15\linewidth}
\@logo
\end{minipage}
\begin{minipage}{.85\linewidth}
\begin{center}\sffamily
{\Huge Fiche d'appréciation \@periode}\par\medskip
{\Large \@etablissement{}\@ville}
\end{center}
\end{minipage}
\par
\medskip
\hrule\par\bigskip\par

\begin{description}
  \item[Intitulé de la formation :] \@formation
  \item[Prénom de l'\@etudiant{} :] \@prenom
  \item[Nom de l'\@etudiant{} :] \bsc{\@nom}
\end{description}

\paragraph{}
\begin{description}
\item[Niveau de la promotion :]~\\
    \Eleve~élevé\hfill
    \MoyPlus~au dessus de la moyenne\hfill
    \Moy~moyen\hfill
    \MoyMoins~au dessous de la moyenne\hfill
\ifclassement
\item[Classement :] \hfill
    \PremierQuart~1\up{er} quart\hfill
    \DeuxiemeQuart~2\up{me} quart\hfill
    \TroisiemeQuart~3\up{me} quart\hfill
    \QuatriemeQuart~4\up{me} quart\hfill
\else
\item[Rang de l'étudiant :]\@rang
\fi
\item[Effectif de la promotion :]\@effectif
\item[Avis sur la poursuite d'études :]~
    \begin{description}
        \item[\TresFavorable] très favorable
        \item[\Favorable] favorable
        \item[\Reserve] réservé
        \item[\Defavorable] défavorable
        \item[\SansAvis] sans opinion
    \end{description}
\end{description}

\paragraph{Observations:}~\par\@observations

\vfill
\hrule
\medskip
\begin{minipage}{.48\linewidth}
\paragraph{Responsable de formation}~\\
\@responsable\\
\@tel\\
\@email
\end{minipage}\begin{minipage}{.48\linewidth}
\raggedleft
\@lieux{} le \today\par
\bigskip
\@signature
\end{minipage}
}

\AtEndDocument{\makeit}
