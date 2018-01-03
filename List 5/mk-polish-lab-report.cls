\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mk-polish-lab-report}[2017/10/28 University lab report in polish dev version]
\LoadClass[a4paper, 11pt, twoside, polish]{article}
\RequirePackage{titlesec}

% This passes options to the article class 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%% 
\DeclareOption{zadania}{%
	\titleformat{\section}%
	{\normalfont\Large\bfseries}{Zadanie~\thesection}{1em}{}%
}
\ProcessOptions\relax


\usepackage[MeX]{polski}
\frenchspacing
\usepackage[utf8]{inputenc}

\usepackage{url,enumerate}
%\usepackage{algpseudocode, algorithm, mathtools, listings}
\usepackage{graphicx}

%% Units, tables and numbers options
\usepackage{booktabs,siunitx}
\sisetup{
	exponent-product=\cdot, 
	%output-decimal-marker = {,} %%uncomment to change decimal separator to ","
	}


\usepackage[top=2.7cm,bottom=2.5cm,left=2.5cm,right=2.5cm]{geometry}
%\usepackage[usenames,dvipsnames]{xcolor}
%\usepackage{indentfirst}
\usepackage{fancyhdr}


\usepackage{amsmath, amssymb} % math symbols
\usepackage{multicol}
\usepackage[all]{nowidow}

  \renewcommand \thesection       {\arabic{section}.}
  \renewcommand \thesubsection    {\thesection \arabic{subsection}.}
  \renewcommand \thesubsubsection {\thesubsection \arabic{subsubsection}.}



%% Itemized environments
\usepackage[shortlabels]{enumitem}
\setlist[enumerate]{itemsep=0pt}
\setlist[itemize]{itemsep=0pt}
\setlist[description]{itemsep=0pt}

%% Captions settings
\usepackage[labelfont={bf,small},textfont=small]{caption}
\usepackage{subcaption}

%% Algorithm2e package settings
%linesnumbered
\usepackage[ruled,noline,noend]{algorithm2e}
\SetAlgorithmName{Algorytm}{algorytm}{Algorytmy}
\DontPrintSemicolon

%% References settings
\usepackage{hyperref}
\usepackage[capitalise, noabbrev, nameinlink]{cleveref}
\crefname{algorithm}{algorytm}{algorytmy}
\Crefname{algorithm}{Algorytm}{Algorytmy}
\crefname{table}{\tablename}{tabele}
\Crefname{table}{\tablename}{Tabele}
\crefname{equation}{równanie}{równania}
\Crefname{equation}{Równanie}{Równania}
\crefname{figure}{rysunek}{rysunki}
\Crefname{figure}{Rysunek}{Rysunki}
\crefname{section}{zadanie}{zadania}
\crefname{section}{Zadanie}{Zadania}


%% Theorems:
\usepackage{amsthm}
\theoremstyle{definition}
\newtheorem{theorem}{Twierdzenie}
\newtheorem*{theorem*}{Twierdzenie}
\newtheorem{lemma}{Lemat}
\newtheorem{example}{Przykład}
\newtheorem{corollary}{Wniosek}
\newtheorem{definition}{Definicja}




%% Titlepage settings

\makeatletter

\def\studentnumber#1{\gdef\@studentnumber{#1}}
\def\@studentnumber{\ClassError{mk-polish-lab-report}{No \noexpand\studentnumber given}{}}


\def\university#1{\gdef\@university{#1}}
\def\@university{\ClassError{mk-polish-lab-report}{No \noexpand\university given}{}}
\def\major#1{\gdef\@major{#1}}
\def\@major{\ClassError{mk-polish-lab-report}{No \noexpand\major given}{}}
\def\topic#1{\gdef\@topic{#1}}
\def\@topic{\ClassError{mk-polish-lab-report}{No \noexpand\topic given}{}}
\def\coursegroup#1{\gdef\@coursegroup{#1}}
\def\@coursegroup{\ClassError{mk-polish-lab-report}{No \noexpand\coursegroup given}{}}
\def\tutor#1{\gdef\@tutor{#1}}
\def\@tutor{\ClassError{mk-polish-lab-report}{No \noexpand\tutor given}{}}




\newcommand\studentnumbername{numer albumu}
\newcommand\tutorname{prowadzący}
\newcommand\coursegroupname{grupa}

\renewcommand{\maketitle}
{\thispagestyle{empty}\null\noindent{\large\textbf{\@author}}\hfill\ \@date \\
\null\studentnumbername : {\@studentnumber} \hfill \tutorname : \@tutor \\\hrule{\hspace{\textwidth}} \\
\vskip \baselineskip
\begin{center}
\begin{Huge}
\textsc{\@title}
\end{Huge}\\\vskip \baselineskip
\begin{LARGE}
\@topic
\end{LARGE}
\end{center}
\par
\vskip 1\baselineskip
}


\pagestyle{fancy}
\fancyhead[LE,RO]{\small\bfseries \thepage}
\fancyhead[LO, RE]{{\small \@author{} --- \@title, \@topic}}
\fancyfoot{}
%\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
%\addtolength{\headheight}{0.5pt} % pionowy odstęp na kreskę
\fancypagestyle{empty}{%
\setlength{\headsep}{5pt}
  \fancyhf{}% Clear header/footer
  \fancyhead[L]{\@university}% Your journal/note
  \fancyhead[R]{\@major}% Your logo/image
}
\makeatother
