\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{PolytechGrenoble}[2022]

\DeclareOption{english}{
    \PassOptionsToClass{\CurrentOption}{scrreport}
    \PassOptionsToPackage{\CurrentOption}{babel}
}
\DeclareOption{french}{
    \PassOptionsToClass{\CurrentOption}{scrreport}
    \PassOptionsToPackage{\CurrentOption}{babel}
}

\ProcessOptions\relax

% Base class
\LoadClass[12pt]{scrreport}

% Encoding
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% Language support
\RequirePackage{babel}

% Better picture handling
\RequirePackage{graphicx}

% Better color manipulation
\RequirePackage{xcolor}

\RequirePackage[
    % Uncomment to troubleshoot page layout issues
    %showframe,
    % Paper format
    a4paper,
    % Extend inner margins for book bindings
    twoside,
    % Body dimension and margins
    width=160mm,
    top=25mm,
    bottom=25mm,
    outer=20mm,
    % Leave more space for the fancyhdr headers
    headheight=51pt,
    % Don't leave space for side notes
    nomarginpar
]{geometry}

% Allows to reference the last page of the document
\RequirePackage{lastpage}
% Allows to choose odd or even pages
\RequirePackage{nextpage}

% Allows to define fancy headers and footers
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt} % default is 0pt
\pagestyle{fancy}

% Header definition : LE = Left Even, RO = Right Odd, etc.
\fancyhead{} % Clear existing headers
\fancyhead[LE,RO]{\includegraphics[height=30pt]{logos/arturia.png}}
\fancyhead[RE,LO]{\includegraphics[height=30pt]{logos/polytech-vertical.png}}%\vspace{0.1pt}}
\fancyhead[C]{\MyTitle}

% Footer definition
\fancyfoot{} % Clear existing footers
\fancyfoot[LE,RO]{\thepage/\pageref{LastPage}}
\fancyfoot[C]{\thechapter~-~\nameref{chp:\thechapter}}

% Allow URLs to be cut
\RequirePackage[hyphens]{url}

% Link formatting
\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    linkcolor={red!50!black},
    citecolor={blue!50!black},
    urlcolor={blue!80!black}
}

% Better cross-references
\RequirePackage{amsmath}
\RequirePackage[nameinlink,noabbrev]{cleveref}

% Better captions
\RequirePackage[justification=centering]{caption}

% Indent first paragraph
\RequirePackage{indentfirst}

% Bibliography
\RequirePackage{biblatex}

% Abbreviations and glossaries
\RequirePackage[acronym]{glossaries-extra}
\makeglossaries

% For accessing title, author, etc.
\RequirePackage{authoraftertitle}

% For the front page
\RequirePackage{wallpaper}
\RequirePackage{setspace}

% For better-looking chapter titles
\addtokomafont{disposition}{\rmfamily}

% For debug purposes
\RequirePackage{lipsum}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ENVIRONMENT VARIABLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\school}[1]
    {\renewcommand{\school}{#1}}
\newcommand{\university}[1]
    {\renewcommand{\university}{#1}}
\newcommand{\department}[1]
    {\renewcommand{\department}{#1}}
\newcommand{\univyear}[1]
    {\renewcommand{\univyear}{#1}}
\newcommand{\motive}[1]
    {\renewcommand{\motive}{#1}}
\newcommand{\teacher}[1]
    {\renewcommand{\teacher}{#1}}
\newcommand{\tutor}[1]
    {\renewcommand{\tutor}{#1}}
\newcommand{\student}[1]
    {\renewcommand{\student}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% CUSTOM COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Displays a figure with legend and source, that gets labeled with its path
% #1 : Width as percentage of \textwidth (default 0.5)
% #2 : Path to the picture
% #3 : Caption
% #4 : Source
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

% Quick reference to a figure
% #1 : Label
\newcommand{\fig}[1]{\cref{fig:#1}}

% Figure source formatting
% #1 : Source to display
\newcommand{\source}[1]{
    \vspace{-8pt}
    \caption*{\emph{Source : {#1}}}
}

% Timestamp formatting
% #1 : Timestamp
\newcommand{\timestamp}[1] {\texttt{#1}}

% Cite a specific timestamp in a video
% #1 : Citation
% #2 : Timestamp
\newcommand{\tscite}[2] {\emph{"#1"} (\timestamp{#2})}

% Create an acronym with an associated glossary entry
% #1 : Identifier
% #2 : Acronym
% #3 : Expanded acronym
% #4 : Definition
\newcommand{\newfrenchacrdef}[4]{
    \newglossaryentry{#1_g}{
        name={#2},
        description={\emph{(#3)} #4}
    }
    \newglossaryentry{#1}{
        type=\acronymtype,
        name={#2},
        description={#3},
        first={#3 (#2) \glsadd{#1_g}},
        see=[Glossary:]{#1_g}
    }
}

% Create an acronym without definition
% #1 : Identifier
% #2 : Acronym
% #3 : Expanded acronym
\newcommand{\newacrnodef}[3]{
    \newglossaryentry{#1}{
        type=\acronymtype,
        name={#2},
        description={#3},
        first={#3 (#2)}
    }
}

% Add a glossary entry in French
% #1 : Identifier
% #2 : Defined term
% #3 : Definition
\newcommand{\newfrenchglsentry}[3]{
    \newglossaryentry{#1}{
        name={#2},
        text={\lowercase{#2}},
        description={#3}
    }
}

% Add a glossary entry referencing another one
% #1 : Identifier
% #2 : Defined term
% #3 : Referenced term's identifier
\newcommand{\newglsref}[3]{
    \newglossaryentry{#1}{
        name={#2},
        text={\lowercase{#2}},
        description={},
        see=[Glossary:]{#3}
    }
}

% Add an English glossary entry along with its French one
% #1 : (English) Identifier
% #2 : (English) Defined term
% #3 : (French) Identifier
% #4 : (French) Defined Term
% #5 : (French) Definition
\newcommand{\newenglishglsentry}[5]{
    \newfrenchglsentry{#3}{#4}{(en anglais : \emph{\gls{#1}}) #5}

    \newglsref{#1}{#2}{#3}
}

% Add an English acronym along with its definition and its French counterparts
% #1 : (English) Identifier
% #2 : (English) Acronym
% #3 : (English) Expanded acronym
% #4 : (French) Identifier
% #5 : (French) Acronym
% #6 : (French) Expanded acronym
% #7 : (French) Definition
\newcommand{\newenglishacrdef}[7]{
    \newfrenchacrdef{#4}{#5}{#6}{#7}

    \newglossaryentry{#1}{
        type=\acronymtype,
        name={#2},
        description={#3},
        first={#3 (#2)},
        see=[Glossary:]{#4_g}
    }
}
