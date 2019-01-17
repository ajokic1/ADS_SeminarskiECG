% Klasa za seminarske radove na ETF-u
% 
% Miloš Daković, februar 2012.
% novembar 2013. isključeni inconsolata i microtype paketi
% januar 2017. utf8 varijanta, bez UCG grba
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SeminarskiADS}[2017/01/22 ETF - Milos Dakovic]

\DeclareOption{print}{\PassOptionsToPackage{draft}{hyperref}}
\ProcessOptions

\LoadClass[12pt,a4paper]{article}


%\RequirePackage{pslatex}
%\RequirePackage{ae,aecompl}
%\RequirePackage{courier}
\RequirePackage[serbian]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{fouriernc}
%\RequirePackage{fourier}
%\RequirePackage{mathptmx}
%\RequirePackage{inconsolata}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{fancyhdr}
\RequirePackage[left=3.5cm,top=3cm,width=15cm,height=23.7cm]{geometry}
\RequirePackage{listings}
%\RequirePackage{microtype}
\RequirePackage[margin=1cm,font=small,labelfont=bf]{caption}
\RequirePackage[pdftex,unicode,colorlinks,urlcolor=blue,linkcolor=blue,citecolor=blue,plainpages=false]{hyperref}
\RequirePackage{calc}

\def\@Datum{\today}
\newcommand{\Datum}[1]{\def\@Datum{#1}}

\def\@Naslov{Naslov seminarskog rada}
\newcommand{\Naslov}[1]{\def\@Naslov{#1}}

\def\@Kandidat{Ime i prezime}
\newcommand{\Kandidat}[1]{\def\@Kandidat{#1}}

\def\@Indeks{Broj indeksa}
\newcommand{\Indeks}[1]{\def\@Indeks{#1}}

\def\@Nastavnik{Predmetni nastavnik}
\newcommand{\Nastavnik}[1]{\def\@Nastavnik{#1}}

\def\@Predmet{Naziv predmeta}
\newcommand{\Predmet}[1]{\def\@Predmet{#1}}


% Izmjena maketitle komande
\renewcommand{\maketitle}
{{
\pagestyle{empty}
\begin{center}
%\begin{minipage}[c]{3cm}
%\raggedright
%\includegraphics[height=1.9cm]{ucg}
%\end{minipage}
\begin{minipage}[c]{\linewidth -3.1cm}
%\centering
\raggedright
\scshape
%\large
Univerzitet Crne Gore\\
 Elektrotehnički fakultet\\
\end{minipage}
\begin{minipage}[c]{3cm}
\raggedleft
\includegraphics[height=1.5cm]{etf}
\end{minipage}
\end{center}
\vspace{3cm}
\begin{center}
\large
\@Predmet

\vspace{1cm}
\LARGE
\textbf{\@Naslov}
\vspace{1cm}

\large
-- seminarski rad --
\normalsize

\vfill
\begin{center}
\begin{minipage}[b]{0.45\linewidth}
\raggedright
\begin{tabular}{c}
Nastavnik:\vspace{1ex}\\
\@Nastavnik\\
 \\
\end{tabular}
\end{minipage}
\begin{minipage}[b]{0.45\linewidth}
\raggedleft
\begin{tabular}{c}
Kandidat:\vspace{1ex}\\
\@Kandidat\\
\@Indeks\\
\end{tabular}
\end{minipage}
\end{center}

\vspace{2cm}
Podgorica, \@Datum
\end{center}
\clearpage
\vspace*{1cm}
\tableofcontents
\clearpage
\setcounter{page}{1}
}}

% Razmak paragrafa
%\linespread{1.2}
%\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}
\setlength{\parskip}{0.7ex plus 0.3ex minus 0.2ex}

% Pozicija header-a i footer-a
\setlength{\footskip}{1.5cm}
\setlength{\headheight}{1cm}
\setlength{\headsep}{0.7cm}

% Definicija zaglavlja
\lhead{\footnotesize \@Kandidat}
\chead{}
\rhead{\footnotesize \it seminarski rad}
\lfoot{}
\cfoot{\thepage}
\rfoot{}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\pagestyle{fancy}

% Opcije za listing programa
\lstset{language=Matlab,
	basicstyle=\footnotesize,
    lineskip=0pt,emptylines=0,
    numbers=left,numberstyle=\tiny,
    breaklines=true,showstringspaces=false,
    columns=flexible,
    morekeywords=[1]{switch,case,otherwise,warning,try,catch,ischar},
    literate={\%\%\%}{\%\%}{2} % remove long lines with %
    }

