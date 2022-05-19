\LoadClass[a4paper,12pt]{article} % Classe du document

%--------------------- Packages ------------------------

\RequirePackage[english]{babel} %Langue du document
\RequirePackage[utf8]{inputenc} %Caractères spéciaux
\RequirePackage[section]{placeins}%Pour placement de section
\RequirePackage[T1]{fontenc} %Quelques lettres qui sont pas inclus dans UTF-8
\RequirePackage{mathtools} %Paquet pour des équations et symboles mathématiques
\RequirePackage{siunitx} %Pour écrire avec la notation scientifique (Ex.: \num{2e+9})
\RequirePackage{float} %Pour placement d'images
\RequirePackage{graphicx} %Paquet pour insérer des images
\RequirePackage[justification=centering]{caption} %Pour les légendes centralisées
\RequirePackage{subcaption}
\RequirePackage{wallpaper}
\RequirePackage{nomencl}
%\makenomenclature
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}% default is 0pt
%\pagestyle{fancy}
%\fancyheadoffset{1cm}
%\setlength{\headheight}{2cm}
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}%Paquet pour insérer légendes dans des sous-figures comme Figure 1a, 1b
\hypersetup{
    colorlinks,
    linkcolor={red!50!black},
    citecolor={blue!50!black},
    urlcolor={blue!80!black}
}
\RequirePackage[nameinlink,noabbrev]{cleveref}
\RequirePackage[left=2.5cm,right=2.5cm,top=2cm,bottom=3.5cm]{geometry} %Configuration de la page
\RequirePackage{changepage}
\RequirePackage{pdftricks2}
\RequirePackage{enumitem}
\RequirePackage[retainorgcmds]{IEEEtrantools}
\numberwithin{equation}{section}
\RequirePackage{xcolor}
\RequirePackage{amsfonts}
\RequirePackage{lastpage}
\RequirePackage{truncate}
\RequirePackage{indentfirst}

\RequirePackage{setspace}

\RequirePackage{biblatex}

%-------------------- Informations sur le rapport ----------------------

\newcommand{\departement}[1]{\renewcommand{\departement}{#1}}
\newcommand{\matiere}[1]{\renewcommand{\matiere}{#1}}
\newcommand{\motif}[1]{\renewcommand{\motif}{#1}}
\newcommand{\titre}[1]{\renewcommand{\titre}{#1}}
\newcommand{\enseignant}[1]{\renewcommand{\enseignant}{#1}}
\newcommand{\etudiants}[1]{\renewcommand{\etudiants}{#1}}
\newcommand{\tuteurpcp}[1]{\renewcommand{\tuteurpcp}{#1}}
\newcommand{\fairemarges}{
\makenomenclature
\pagestyle{fancy}
\fancyheadoffset{1cm}
\setlength{\headheight}{2cm}
\setlength{\parindent}{1.5cm}
\lhead{\includegraphics[scale=0.12]{logos/grenoble-inp.png}} %Affichage de l'image au top de la page
\chead{\includegraphics[scale=0.15]{logos/polytech-vertical.png}}
\rhead{\includegraphics[scale=0.1]{logos/uga.png}}

\lfoot{\textit{\truncate{15cm}{\titre}}}
\cfoot{}
\rfoot{\thepage/\pageref{LastPage}}
}

\newcommand{\fairepagedegarde}{

\newgeometry{margin=2cm}
\begin{titlepage}

\setlength{\wpYoffset}{-7.5cm}
\ThisCenterWallPaper{0.4}{logos/polytech-vertical.png}
	\flushleft
	\includegraphics[width=0.2\textwidth]{logos/grenoble-inp.png} %Insertion du logo
	\hfill
	\includegraphics[width=0.25\textwidth]{logos/uga.png}\par\vspace{1cm}
	\centering %Centraliser le contenu
	{\scshape\LARGE Polytech Grenoble \par UGA - Grenoble INP \par} %Nom de l'université
	\vspace{1.5cm}%Espace de 1,5cm
	{\scshape\Large \departement \\ \matiere \\ \motif\par} %sous-titre
	\vspace{1cm}%Espace de 1cm
    \rule{\linewidth}{0.2 mm} \\[0.4 cm]
	{\huge\bfseries \textsc{\titre} \par} \
    \rule{\linewidth}{0.2 mm} \\[1.5 cm]
	\vspace{1cm}%Espace de 3cm

	\begin{minipage}{0.5\textwidth} %Minipage pour faire deux colonnes
		\begin{flushleft} \large %Envoyer à gauche
		\emph{\textbf{Student(s)}}\\ %Pour le titre au dessus des noms à gauche
        \etudiants\\ %Remplacer pour chacun
		\end{flushleft}
	\end{minipage}
	~
	\begin{minipage}{0.4\textwidth}
		\begin{flushright} \large
		\emph{\textbf{Professor(s)}} \\
		 \enseignant \\
		 %\vspace{0.5cm}
		%\emph{\textbf{Tuteur PCP :}}\\
		 %\tuteurpcp
		\end{flushright}
	\end{minipage}\\[1cm]

	\vfill
	{\large \today\par} %Affichage de la date

\end{titlepage}
\newgeometry{left=2.5cm,right=2.5cm,top=2cm,bottom=3.5cm}
}

\newcommand{\tabledematieres}{
{
\hypersetup{linkcolor=black}
\setcounter{tocdepth}{2}
\tableofcontents % Prints the main table of contents
%\newpage
}
}

\newcommand{\tabledefigure}{
{
\hypersetup{linkcolor=black}
\listoffigures
\newpage}
}

\newcommand{\tabledetableau}{
{
\hypersetup{linkcolor=black}
\listoftables
\newpage}
}

\newcommand{\Figure}[4][0.5]{
	\begin{figure}[h]
		\centering
		\vspace{1cm}
    	\includegraphics[width=#1\textwidth]{#2}
		\caption{#3}
		\source{#4}
		\label{fig:#2}
		\vspace{0.5cm}
	\end{figure}
}
\captionsetup{font=footnotesize,labelfont=small}

\newcommand{\fig}[1]{\cref{fig:#1}}

\newcommand{\source}[1]{
	\vspace{-8pt}
	\caption*{\emph{Source: {#1}}}
}

\newcommand{\timestamp}[1] {\texttt{#1}}

\newcommand{\tscite}[2] {\emph{"#1"} (\timestamp{#2})}