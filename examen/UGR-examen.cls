\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UGR-examen}[2024/03/07 Clase de documento para examen siguiendo las directrices del manual de identidad corporativa de la Universidad de Granada] 



% ===================================================================
% Variables de la clase
% ===================================================================

\RequirePackage{xspace}
\def\Grado#1{\def\@Grado{#1}}
\newcommand{\printGrado}{\@Grado\xspace}
\def\Departamento#1{\def\@Departamento{#1}}
\newcommand{\printDepartamento}{\@Departamento\xspace}
\def\Asignatura#1{\def\@Asignatura{#1}}
\newcommand{\printAsignatura}{\@Asignatura\xspace}
\def\CursoAcademico#1{\def\@CursoAcademico{#1}}
\newcommand{\printCursoAcademico}{\@CursoAcademico\xspace}
\def\Convocatoria#1{\def\@Convocatoria{#1}}
\newcommand{\printConvocatoria}{\@Convocatoria\xspace}
\def\Fecha#1{\def\@Fecha{#1}}
\newcommand{\printFecha}{\@Fecha\xspace}
\def\Instrucciones#1{\def\@Instrucciones{#1}}
\newcommand{\printInstrucciones}{\@Instrucciones\xspace}

% ===================================================================
% OPCIONES DE LA CLASE
% ===================================================================

\newcommand{\marcaAgua}{marca-agua-logo-ugr-color}
\newcommand{\accentColor}{ugr}
\newcommand{\logocabecera}{logo-ugr-horizontal}

\DeclareOption{monocromo}{
  \renewcommand{\logocabecera}{logo-ugr-horizontal-monocromo}
  \renewcommand{\marcaAgua}{marca-agua-logo-ugr}
  \renewcommand{\accentColor}{ugrGray}
}

\DeclareOption{corporativo}{
  \renewcommand{\logocabecera}{logo-ugr-horizontal-color-corporativo}
  \renewcommand{\marcaAgua}{marca-agua-logo-ugr-color}
  \renewcommand{\accentColor}{ugr}
}

\def\boolmarcaagua{0}
\DeclareOption{marcaagua}{
  \def\boolmarcaagua{1}
}

\def\boolbandapie{0}
\DeclareOption{bandapie}{
  \def\boolbandapie{1}
}

\def\boolnoInstrucciones{0}
\DeclareOption{noInstrucciones}{
  \def\boolnoInstrucciones{1}
}

\def\boolCopyright{0}
\DeclareOption{copyright}{
  \def\boolCopyright{1}
}

\def\booldislexia{0}
\DeclareOption{dislexia}{
  \def\booldislexia{1}
}
\ProcessOptions\relax


% ===================================================================
% Clase base scrartcl
% ===================================================================

\LoadClass[fontsize=10pt, parskip=full, paper=a4, twoside=false, footinclude=false,headinclude=true, DIV=12]{scrartcl}

% Increase text height so the footer is put closer to the bottom boundary of the page.
\setlength{\textheight}{1.1\textheight}
\setlength{\headheight}{51pt}
% \setlength{\marginparwidth}{1em}

\RequirePackage[
  headsepline=false,
  headwidth=\textwidth,
  footwidth=\textwidth,
]{scrlayer-scrpage}
\clearpairofpagestyles

\ihead{
  \hspace*{-23mm}\includegraphics[width=0.4\textwidth]{\logocabecera}
}
\ohead{\upshape \printDepartamento \\ \printCursoAcademico}

\pagestyle{empty}

\setkomafont{title}{\itshape\large}



% -------------------------------------------------------------------
% PAQUETES Y OPCIONES
% -------------------------------------------------------------------
\RequirePackage[utf8]{inputenc} 

\RequirePackage[english, spanish, es-nodecimaldot, es-noindentfirst, es-tabla,es-noquoting]{babel}
  \unaccentedoperators % Desactiva los acentos en los operadores matemáticso (p.e. \lim, \max, ...). Eliminar esta opción si queremos que vayan acentuados

\RequirePackage{iftex}

\ifxetex
% No cargamos microtype pues tiene incompatibilidades con el motor xelatex
\else
\RequirePackage[activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=1100,stretch=10,shrink=10]{microtype}
\fi

\usepackage[toc,eqno,enum,bib,lineno]{tabfigures}

% Las tipografías elegidas para el documento, siguiendo la guía de estilo de la UGR, son las siguientes
% Normal font: 			URW Palladio typeface. 
% Sans-serif font: 	Gill Sans (paquete cabin)
% Monospace font: 	Inconsolata
\RequirePackage[T1]{fontenc}
\if\booldislexia0
  \RequirePackage[theoremfont,largesc,tighter,p,osf]{newpxtext}
  \RequirePackage[noamssymbols]{newpxmath}

  % Clon de Gill Sans
  \IfFileExists{cabin.sty}{
    \RequirePackage[scaled=.95,type1]{cabin} 
  } %else
  {
    % Si cabin da ERROR usar el siguiente comando en su lugar
    \renewcommand{\sfdefault}{iwona} 
  }
  \RequirePackage{inconsolata}
    \useosf % old-style figures in text, not in math
    \linespread{1.05} % Palatino needs more leading (space between lines)
\else
  \RequirePackage{cmbright}
  \renewcommand*\sfdefault{cmss}
  \renewcommand*\ttdefault{cmtt}
  \RequirePackage[sfdefault]{atkinson}
\fi


\RequirePackage{setspace}

\RequirePackage{xurl}

\RequirePackage{hyperref}

\hypersetup{%
  % hidelinks,            % Enlaces sin color ni borde. El borde no se imprime
  linkbordercolor=0.8 0 0,
  citebordercolor=0 0.8 0,
  citebordercolor=0 0.8 0,
  colorlinks = true,            % Color en texto de los enlaces. Comentar esta línea o cambiar `true` por `false` para imprimir el documento.
  linkcolor = [rgb]{0.5, 0, 0}, % Color de los enlaces internos
  urlcolor = [rgb]{0, 0, 0.5},  % Color de los hipervínculos
  citecolor = [rgb]{0, 0.5, 0}, % Color de las referencias bibliográficas
  pdfsubject={Examen, \textcopyright Universidad de Granada},%
	pdfkeywords={},%
	pdfcreator={pdfLaTeX},%
}

% -------------------------------------------------------------------
% TABLAS, GRÁFICOS Y COLORES
% -------------------------------------------------------------------
\RequirePackage{booktabs}
% \renewcommand{\arraystretch}{1.5} % Aumenta el espacio vertical entre las filas de un entorno tabular

\RequirePackage{graphicx}
  \setkeys{Gin}{width=\linewidth,totalheight=\textheight,keepaspectratio}
  % Carpeta donde buscar los archivos de imagen por defecto
  \graphicspath{{img/}{logos/}}

\RequirePackage{xcolor}
  \definecolor{ugr}{RGB}{233, 44, 48} % {210, 47, 61}
  \definecolor{ugrDark}{RGB}{233, 44, 48}
  \definecolor{ugrText}{RGB}{26, 25, 25}
  \definecolor{ugrGray}{RGB}{99, 100, 99}
  \newcommand{\alert}[1]{\textcolor{ugr}{#1}}

% -------------------------------------------------------------------
% Marca de agua
% -------------------------------------------------------------------

\if\boolmarcaagua1
\RequirePackage{eso-pic}
\newcommand\AtPageLowerRight[1]{
  \put(\LenToUnit{\paperwidth-0pt},0){\llap{\raisebox{0pt}{#1}}}
  \if\boolbandapie1
    \put(0,0){\color{\accentColor}\rule{\paperwidth}{1cm}}
  \fi
}
\AddToShipoutPictureBG{\AtPageLowerRight{\includegraphics[width=0.6\pdfpagewidth]{\marcaAgua}}}
\fi

% -------------------------------------------------------------------
% Copyright en marca de agua
% -------------------------------------------------------------------

\if\boolCopyright1
\RequirePackage{eso-pic}
\AddToShipoutPictureBG{\AtPageLowerLeft{
{\color{lightgray}
  \raisebox{5em}{
    \rotatebox[origin=l]{54}{
      \scalebox{6.3}{\quad\copyright\ Universidad de Granada}
    }
  }
}}}
\fi


% -------------------------------------------------------------------
% Título
% -------------------------------------------------------------------
  
\renewcommand{\maketitle}{
  % Bloque cabecera examen
  \vspace*{-2em}
  \begin{center}
    \itshape
    {\large \printConvocatoria. \printFecha}\\\medskip
    \printAsignatura. \printGrado.
  \end{center}
  \vspace{-1em}   
  \normalsize{Apellidos, Nombre}: \hrulefill\hrulefill\hrulefill\hrulefill\hrulefill\hrulefill Grupo: \hrulefill 
}

\AtBeginDocument{
  \maketitle\thispagestyle{scrheadings}
  % Los siguientes dos comandos hacen que todos los enumerate de segundo nivel se escriban con números romanos en minúsculas y entre paréntesis.
  \renewcommand{\labelenumii}{\theenumii} 
  \renewcommand{\theenumii}{(\roman{enumii})}
}

\if\boolnoInstrucciones0
  \AtEndDocument{
    \vfill
    {
      \footnotesize
      \printInstrucciones
    }
  }
\fi
