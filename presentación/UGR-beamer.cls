% Personal beamer template
% Francisco Torralbo
\NeedsTeXFormat{LaTeX2e}[2025]
\ProvidesClass{UGR-beamer}[2026/03/19 Plantilla beamer UGR]

\DeclareKeys[UGRBeamer]{
  subject.store = \UGRBeamer@subtitle,
  author.store = \UGRBeamer@author,
  collaborators.store = \UGRBeamer@collaborators,
  fundings.store = \UGRBeamer@fundings,
  event.store = \UGRBeamer@event,
  place.store = \UGRBeamer@place,
}

% Command for setting the options in the document
\NewDocumentCommand\UGRBeamerOptions{m}{%
  \SetKeys[UGRBeamer]{#1}%
}
\NewDocumentCommand\fundings{m}{%
  \SetKeys[UGRBeamer]{fundings=#1}%
}
\NewDocumentCommand\event{m}{%
  \SetKeys[UGRBeamer]{event=#1}%
}
\NewDocumentCommand\place{m}{%
  \SetKeys[UGRBeamer]{place=#1}%
}
\NewDocumentCommand\collaborators{m}{%
  \SetKeys[UGRBeamer]{collaborators=#1}%
}

\ProcessKeyOptions[UGRBeamer]

% The unknown options are passed to beamer class
\DeclareUnknownKeyHandler{%
  \PassOptionsToClass{\CurrentOption}{beamer}
}

\LoadClass{beamer}

% Packages
\RequirePackage{xstring}

\RequirePackage{graphicx, xcolor}
\graphicspath{{graphics/}{img/}{logos/}} % path to the graphics folder

\RequirePackage{tikz}

\RequirePackage{fontawesome7}

\RequirePackage{booktabs}
\RequirePackage{multicol}

\RequirePackage{amsmath,amssymb, amsthm}
\RequirePackage{mathtools}

% See https://tex.stackexchange.com/questions/621378/good-combination-of-sans-serif-font-text-and-math-mode-using-beamer-class
% \RequirePackage{arev}

\RequirePackage{nicefrac}

\RequirePackage[document]{ragged2e}

%----------------------------------------------------------
% CUSTOM COLORS ADAPTED FROM UNIVERSITY OF GRANADA STYLE SHEET
%----------------------------------------------------------
\definecolor{ugr}{RGB}{197, 59, 59}%{190, 57, 63} % {210, 47, 61}
\definecolor{ugrDark}{RGB}{190, 57, 63}
\definecolor{ugrText}{RGB}{26, 25, 25}
\definecolor{ugrGray}{RGB}{99, 100, 99}

\definecolor{beamerBackground}{RGB}{197, 59, 59}%{rgb}{0.93,0.93,0.93}

% ICONS
\NewDocumentCommand{\UGRBeamer@sectionIcon}{}{\faPenToSquare}
\NewDocumentCommand{\UGRBeamer@subsectionIcon}{}{\faAnglesDown}
\NewDocumentCommand{\UGRBeamer@remarkIcon}{}{\faClipboard}
\NewDocumentCommand{\UGRBeamer@dateIcon}{}{\faCalendar}
\NewDocumentCommand{\UGRBeamer@fundingsIcon}{}{\faIcon{money-bill-1}}
\NewDocumentCommand{\UGRBeamer@placeIcon}{}{\faMapPin}
\NewDocumentCommand{\UGRBeamer@eventIcon}{}{\faChalkboardUser}
\NewDocumentCommand{\UGRBeamer@collaboratorsIcon}{}{\faUsersLine}

% PARTICULAR BEAMER STYLE

% Beamer section style
\AtBeginSection[]
{
  % \sectionframe{\secname}
  \sectionframe{\insertsectionhead}
  % \begin{frame}<beamer>
  %   \frametitle{Contenidos}
  %   \tableofcontents[currentsection,currentsubsection]
  % \end{frame}
}
\AtBeginSubsection[]
{
  \subsectionframe{\insertsubsectionhead}
}

% \mode<presentation>
% {
\useinnertheme{default}
\useoutertheme{default} % split
\usecolortheme[named=ugrDark]{structure}
\usefonttheme[onlylarge]{structurebold}

\setbeamercovered{invisible}

\setbeamercolor{normal text}{fg=ugrText}
% Background and foreground color for block environment
\setbeamercolor{block body}{bg=black!5!white,fg=black}  %
\setbeamercolor{frametitle}{fg=ugr}
\setbeamercolor{framesubtitle}{fg=ugrGray}
\setbeamercolor{alerted text}{fg=ugr}
\setbeamercolor{math text displayed}{fg=black}

% Hide the navigation buttons
\setbeamertemplate{navigation symbols}{}

% beamer template changes
\setbeamertemplate{frametitle}{
  % \vspace{0.40em}
  \noindent
  % \hspace{-1em}
  \tikz[overlay,remember picture,baseline=0.3em]{\fill[fill=black]  (-0.2,-0.35) rectangle (0,0.9); } \textls{\MakeUppercase{\insertframetitle}}\\[-0.3em]  \hspace{0.1em} {\color{ugrGray}\normalsize\mdseries\textls{\MakeUppercase{\insertframesubtitle}}}%

  % \tikz[overlay,remember picture,baseline=0.3em]{\fill[fill=ugrDark]  (-0.2,0.05) rectangle (0,0.9); }~\textls{\MakeUppercase{\insertframetitle}}\hfill  {\color{ugrGray}\normalsize\textls{\MakeUppercase{\insertframesubtitle}}}%
}

\setbeamercolor{title}{fg=ugr}
\setbeamerfont{title}{size=\Large, series=\bfseries}
\setbeamertemplate{title}{
  \textbf{\textcolor{ugr}{\textls{\MakeUppercase{\inserttitle}}}}
}
\setbeamercolor{subtitle}{fg=ugrGray}
\setbeamerfont{subtitle}{size=\large}
\setbeamertemplate{subtitle}{
  \textcolor{ugrGray}{\textls{\MakeUppercase{\insertsubtitle}}}
}
\setbeamercolor{author}{fg=ugrText}
\setbeamerfont{author}{size=\large}
\setbeamertemplate{author}{
  \textcolor{ugrText}{\textls{\MakeUppercase{\insertauthor}}}
}

\setbeamercolor{date}{fg=white}
\setbeamertemplate{date}{
  \insertdate
}

% Portada
\pgfdeclareimage[height=\paperheight]{titlebackground}{logos/portada.pdf}

\setbeamertemplate{title page}{

  \begin{picture}(0,0)

    \put(-30,-163){%
      \pgfuseimage{titlebackground}
    }

    \put(130,0){%
      \begin{minipage}{0.6\textwidth}
        \usebeamertemplate{title}\par
        \vspace{1em}

        \usebeamertemplate{subtitle}\par
        \vspace{2em}

        \usebeamertemplate{author}\par
        \medskip

        % \faUsers\ \faUserGroup\ \faUserPlus\
        \textcolor{ugrGray}{
          \UGRBeamer@collaboratorsIcon\ \UGRBeamer@collaborators
        }
      \end{minipage}
    }
    \put(-20,-100){%
      \begin{minipage}{0.4\textwidth}
        \color{white}
        \begingroup
        \renewcommand{\arraystretch}{1.4}
        \begin{tabular}{rp{8em}}
          % \hline
          \UGRBeamer@dateIcon & \usebeamertemplate{date}\\\hline
          \UGRBeamer@eventIcon  & \UGRBeamer@event \\\hline
          \UGRBeamer@placeIcon  & \UGRBeamer@place \\\hline
          \UGRBeamer@fundingsIcon & \UGRBeamer@fundings
        \end{tabular}
        \endgroup
      \end{minipage}
    }
  \end{picture}
}

\ProvideDocumentCommand{\highlightframe}{m m m}{%
  {
    \setbeamercolor{background canvas}{bg=#1}
    \begin{frame}
      \hfill\vfill
      \begin{center}
        \Large
        \bfseries
        \color{#2}
        #3
      \end{center}
      \vfill
    \end{frame}
  }
}

\newcommand{\sectionframe}[1]{%
  \highlightframe{ugrGray}{white}{
    {\huge\UGRBeamer@sectionIcon}\quad
    \textls{\MakeUppercase{#1}}
  }
}
\newcommand{\subsectionframe}[1]{
  \highlightframe{ugrGray}{white}{{\huge\UGRBeamer@subsectionIcon}\\\bigskip
    \textls{\MakeUppercase{#1}}
  }
}

% Put color on cites
% \let\oldcite=\cite
% \renewcommand{\cite}[1]{\textcolor{ugr}{\oldcite{#1}}}

% Remark
\NewDocumentCommand{\remark}{m}{\textcolor{gray}{\UGRBeamer@remarkIcon\ \itshape\small #1}}

% Tipografía

\RequirePackage{carlito}
% \RequirePackage{soul} % Para aumenter el espacio entre letras
\RequirePackage{microtype}

%--------------------------------------------------------------
%  Insertar al inicio del documento
%--------------------------------------------------------------

\AtBeginDocument{
  % \setbeamertemplate{headline}[title_page]
  % \setbeamertemplate{footline}[title_page]
  % \csname beamer@calculateheadfoot\endcsname %recalculate head and foot dimension
  \begin{frame}[plain]
    \titlepage
  \end{frame}

  %head and foot for body text
  \setbeamertemplate{headline}[body]
  %\setbeamertemplate{footline}[body]

  \begin{frame}{Tabla de contenidos}
    \vskip 5mm
    \hfill  {\large \parbox{.95\textwidth}{\tableofcontents[hideallsubsections]}}
  \end{frame}
}

%--------------------------------------------------------------
%  Insertar al final del documento
%--------------------------------------------------------------
%\AtEndDocument{}
