\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imtreport}[2019/06/04 IMT Template class, V1.0]

%Main class
\LoadClass[openany, 11pt]{memoir}

\RequirePackage[french]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[pdftex,
pdfproducer=pdflatex-@Willena-(Guillaume-VILLENA)]{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{subfiles}
\RequirePackage{amsmath,amssymb,amsthm}	
\RequirePackage{ragged2e}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{multicol}
\RequirePackage{geometry}
\RequirePackage{pdfpages}
\RequirePackage{titlesec}
\RequirePackage{microtype}
\RequirePackage{color}
\RequirePackage{listings}
\RequirePackage[acronym, toc, section]{glossaries}


%Main colors
\definecolor{grey}{RGB}{135,135,135}
\definecolor{darkblue}{RGB}{0,92,111}
\definecolor{clearblue}{RGB}{0,184,222} 
\definecolor{darkgreen}{RGB}{82,107,23}

%Code higlight and colors 
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\lstset{ 
	backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}; should come as last argument
	basicstyle=\footnotesize,        % the size of the fonts that are used for the code
	breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
	breaklines=true,                 % sets automatic line breaking
	captionpos=b,                    % sets the caption-position to bottom
	commentstyle=\color{mygreen},    % comment style
	deletekeywords={...},            % if you want to delete keywords from the given language
	escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
	extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
	firstnumber=1000,                % start line enumeration with line 1000
	frame=single,	                   % adds a frame around the code
	keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
	keywordstyle=\color{blue},       % keyword style
	language=Octave,                 % the language of the code
	morekeywords={*,...},            % if you want to add more keywords to the set
	numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
	numbersep=5pt,                   % how far the line-numbers are from the code
	numberstyle=\tiny\color{mygray}, % the style that is used for the line-numbers
	rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
	showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
	showstringspaces=false,          % underline spaces within strings only
	showtabs=false,                  % show tabs within strings adding particular underscores
	stepnumber=2,                    % the step between two line-numbers. If it's 1, each line will be numbered
	stringstyle=\color{mymauve},     % string literal style
	tabsize=2,	                   % sets default tabsize to 2 spaces
	title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}



%Define the page geometry
\geometry{
  a4paper,
  left=12.7mm,top=12.7mm,right=12.7mm,bottom=12.7mm,
  headheight=25mm,headsep=5mm,foot=20mm,footskip=5mm,
  includeheadfoot
}

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\headrulewidth}{0pt}
\fancypagestyle{plain}{%
\pagestyle{fancy}%
 }

%Apply colors and section/chapters styles
\setsecheadstyle{\Large\bfseries\color{clearblue}}% Set \section style
\setsubsecheadstyle{\large\bfseries\color{darkgreen}}% Set \subsection style
\setsecnumdepth{subsubsection}
\chapterstyle{article}
\renewcommand{\chaptitlefont}{\normalfont\color{darkblue}\huge\bfseries\sffamily}


%Change title type for listoffigures and listoftables
\makeatletter
\renewcommand\listoffigures{%
    \section*{\listfigurename}
    \addcontentsline{toc}{section}{\listfigurename}
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\makeatother

\makeatletter
\renewcommand\listoftables{%
    \section*{\listtablename}
    \addcontentsline{toc}{section}{\listtablename}
      \@mkboth{\MakeUppercase\listtablename}%
              {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\makeatother



% Helpers to automate printing and creating references for tables,figures, appendix
\newcommand{\figRef}[1]{Figure~\ref{fig:#1}}
\newcommand{\figLabel}[1]{\label{fig:#1}}

\newcommand{\tabRef}[1]{Tableau~\ref{tab:#1}}
\newcommand{\tabLabel}[1]{\label{tab:#1}}

\newcommand{\appendixRef}[1]{Annexe~\ref{appendix:#1}}
\newcommand{\appendixLabel}[1]{\label{appendix:#1}}


%Command to draw the confidentiality block
\newcommand{\manualVisibility}{
    \begin{textblock*}{21cm}(0cm,27.5cm)
        \begin{center}
           \TASVisibility
        \end{center}
    \end{textblock*}
}
%Design of the confidentiality block 
\newcommand{\TASVisibility}{
    \begin{tikzpicture}
    \draw (0,0) rectangle (5,0.8) node[pos=.5] {\currentConfidentiality}
    \end{tikzpicture}
}


\newcommand{\confidentiality}[1]{
    \withConfidentiality{}
    \gdef\@confidentiality{#1}
    \gdef\currentConfidentiality{#1}
}

\newcommand{\version}[1]{
    \gdef\@version{#1}
    \gdef\theversion{#1}
}
\renewcommand{\title}[1]{
    \gdef\@docTitle{#1}%
    \gdef\theDocTitle{#1}%
}

\newcommand{\subtitle}[1]{
    \gdef\@subtitle{#1}%
    \gdef\thesubtitle{#1}%
}

\newcommand{\docTitle}[1]{
    \title{\color{darkblue}#1}
}

\newcommand{\authorJobtitle}[1]{
    \gdef\@authorJobtitle{#1}%
    \gdef\theAuthorJobtitle{#1}%
}

\newcommand{\noConfidentiality}{
    \renewcommand{\TASVisibility}{}
}

\newcommand{\promotion}[2]{
    \gdef\@promotionStart{#1}%
    \gdef\@promotionEnd{#2}%
    \gdef\thePromotion{Promotion #1 -- #2 }%
}

\newcommand{\studyYear}[1]{
    \gdef\@studyYear{#1}%
    \gdef\theYear{#1}%
}

\newcommand{\withConfidentiality}{
    \renewcommand{\TASVisibility}{
    \begin{tikzpicture}
    \draw (0,0) rectangle (5,0.8) node[pos=.5] {\currentConfidentiality};
    \end{tikzpicture}
    }
}

\newcommand{\makeUVLogo}[5]{
    \begin{tikzpicture}
    \fill[#1] (0,0) rectangle (#4,#5) node[pos=.5] {\centering \color{white} {\LARGE #2}    {\small #3}   }; 
    \end{tikzpicture}
}

\newcommand{\resetHead}{
    \fancyhead{}
    \fancyhead[L]{\includegraphics[width=4cm]{sty/img/imta_logo.pdf}}
    \fancyhead[R]{\raisebox{3mm}{\theHeaderEntityImage}}
    \fancyhead[C]{
    \raisebox{5mm}{\parbox[b]{9cm}{
    \centering
    \theDocTitle
    }
    }}
}

\newcommand{\resetFoot}{
    \fancyfoot{}
    \fancyfoot[R]{\thepage}
    \fancyfoot[C]{
        \TASVisibility
    }
}

\newcommand{\noHeadFoot}{
    \fancyhead{}
    \fancyfoot{}
}

\newcommand{\otherEntityImage}[1]{
    \gdef\theOtherEntityImage{#1}%
}

\newcommand{\headerEntityImage}[1]{
    \gdef\theHeaderEntityImage{#1}%
}

\newcommand{\bottomCoverPage}[1]{
    \gdef\theBottomCoverPage{#1}%
}

\newcommand{\reportType}[1]{
    \gdef\theReportType{#1}
}

\newcommand{\documentCopies}[1]{
    \gdef\theDocumentCopies{
    \textbf{Copies du présent document}\\ #1}
}

\newcommand{\volumes}[2]{
    \gdef\theVolumes{Volume #1/#2}
}

\newcommand{\email}[1]{
    \href{mailto:#1}{#1}
}
\newcommand{\tel}[1]{
    \href{tel:#1}{#1}
}

\newcommand{\acrfullr}[2][]{\acrshort[#1]{#2} (\acrlong[#1]{#2})}

%++++++++++++++++++++++++++++++++++
% Usage of declared stuff !
%++++++++++++++++++++++++++++++++++

%Initialyse things !
\subtitle{}
\noConfidentiality{}
\resetHead
\resetFoot
\authorJobtitle{}
\promotion{}{}
\studyYear{}
\bottomCoverPage{}
\documentCopies{}
\reportType{Rapport}
\headerEntityImage{}
\volumes{1}{1}

%Print the main page
\newcommand{\coverPage}{
\pagenumbering{gobble}
\newgeometry{showframe,
  left=12.7mm,top=12.7mm,right=12.7mm,bottom=12.7mm
}

\noHeadFoot

\AddToShipoutPicture*{\unitlength=1cm
\put(8,17.3){\includegraphics[width=11cm]{sty/img/imta_triangles.pdf}}}

\begin{textblock*}{13cm}(2cm,9cm) % {block width} (coords) 
   \noindent{\Huge \theDocTitle}
   \newline
   {\color{grey}\small \thesubtitle}
\end{textblock*}

\begin{textblock*}{7cm}(1.5cm,2cm) % {block width} (coords) 
    \noindent
    \textbf{IMT Atlantique}\\
    Filière par apprentissage (FIP)\\
    655 Avenue du Technopôle\\
    29280 Plouzané\\
    \textbf{Téléphone} : \tel{+33 2 29 00 11 11}\\
    \textbf{URL} : \url{www.imt-atlantique.fr}\\
\end{textblock*}

\begin{textblock*}{21cm}(0cm,14cm) % {block width} (coords) 
    \begin{center}
\noindent{\LARGE IMT Atlantique – Formation ingénieur par apprentissage\\
\thePromotion\\
\theYear\\
{\normalsize \theversion~-- \today}}
    \end{center}
    
\end{textblock*}

\begin{textblock*}{15.92cm}(2cm,20cm)
    \begin{multicols}{2}
        \theBottomCoverPage
    \end{multicols}
\end{textblock*}

\AddToShipoutPicture*{\unitlength=1cm
\put(1,1){\includegraphics[width=5cm]{sty/img/imta_logo.pdf}}}
\AddToShipoutPicture*{\unitlength=1cm
\put(14,1){\theOtherEntityImage}}

\manualVisibility
\mbox{}

\newpage
\mbox{}

\restoregeometry
\ClearShipoutPicture
\clearpage
\pagenumbering{arabic}
\setcounter{page}{1}
\resetHead
\resetFoot
}

% Page de garde 
\newcommand{\pageGarde}{
    \newpage

\noHeadFoot

\begin{center}

\vspace*{\fill}
{\Huge \textbf{\theReportType}}

\vspace{\fill}
\theVolumes

\vspace{\fill}
Rédigé par :

\textbf{\theauthor}

\theAuthorJobtitle

\vspace{\fill}
\theDocumentCopies

\vspace*{\fill}
\end{center}
\resetHead
\resetFoot
}

%Prints index pages

\newcommand{\printIndex}{
    \chapter*{Index}
    \addcontentsline{toc}{chapter}{Index}
    
    \printglossary
    \printglossary[type=\acronymtype]
    \listoffigures{}
    \listoftables{}
}
