\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UGR-generico}[2023/06/15 Clase de documento genérico siguiendo las directrices del manual de identidad corporativa de la Universidad de Granada] 


% ===================================================================
% Variables de la clase
% ===================================================================

\RequirePackage{xspace}
\def\Titulo#1{\def\@Titulo{#1}}\newcommand{\printTitulo}{\@Titulo\xspace}
\def\Nombre#1{\def\@Nombre{#1}}\newcommand{\printNombre}{\@Nombre\xspace}
\def\Telefono#1{\def\@Telefono{#1}}\newcommand{\printTelefono}{\@Telefono\xspace}
\def\Email#1{\def\@Email{#1}}\newcommand{\printEmail}{\href{mailto:\@Email}{\@Email}\xspace}
\def\URL#1{\def\@URL{#1}}\newcommand{\printURL}{\url{\@URL}\xspace}
\def\Cargo#1{\def\@Cargo{#1}}\newcommand{\printCargo}{\@Cargo\xspace}
\def\Departamento#1{\def\@Departamento{#1}}\newcommand{\printDepartamento}{\@Departamento\xspace}
\def\logoDepartamento#1{\def\@logoDepartamento{#1}}\newcommand{\printlogoDepartamento}{\@logoDepartamento\xspace}
\def\Centro#1{\def\@Centro{#1}}\newcommand{\printCentro}{\@Centro\xspace}
\def\Direccion#1{\def\@Direccion{#1}}\newcommand{\printDireccion}{\@Direccion\xspace}
\def\Universidad#1{\def\@Universidad{#1}}\newcommand{\printUniversidad}{\@Universidad\xspace}

\LoadClass[fontsize=10pt, parskip=full, paper=a4, twoside=false, footinclude=false,headinclude=true, DIV=9]{scrartcl}

% Increase text height so the footer is put closer to the bottom boundary of the page.
\setlength{\textheight}{1.1\textheight}
\setlength{\headheight}{51pt}

\RequirePackage[
  headsepline=false,
  headwidth=\textwidth+1.5\marginparwidth,
  footwidth=\textwidth+1.5\marginparwidth,
]{scrlayer-scrpage}
\clearpairofpagestyles

\ihead{
  \includegraphics[width=0.4\textwidth]{logo-ugr-horizontal}
}
% \chead{\pagemark}
\ohead{\upshape \printNombre \\ \printCargo \\\printDepartamento \\ \printCentro}
\ifoot{\upshape \printDireccion}
\cfoot{\upshape Tlf.\ +34 \printTelefono}
\ofoot{\upshape \printEmail · \printURL}
% Alternativamente podemos centrar
% \cfoot{\upshape \miDireccion · Tlf.\ +34 \miTelefono · \miEmail}

\pagestyle{empty}

\setkomafont{title}{\itshape\large}

% ===================================================================
% OPCIONES DE LA CLASE
% ===================================================================

\newcommand{\marcaAgua}{marca-agua-logo-ugr-color}
\newcommand{\accentColor}{ugr}

\DeclareOption{monocromo}{
  \renewcommand{\marcaAgua}{marca-agua-logo-ugr}
  \renewcommand{\accentColor}{ugrGray}
  \ihead{
    \includegraphics[width=0.4\textwidth]{logo-ugr-horizontal-monocromo}
  }
}

\DeclareOption{corporativo}{
  \renewcommand{\marcaAgua}{marca-agua-logo-ugr-color}
  \renewcommand{\accentColor}{ugr}
  \ihead{
    \includegraphics[width=0.4\textwidth]{logo-ugr-horizontal-color-corporativo}
  }
}

\DeclareOption{noDatosCabecera}{
  \ohead{}
}

\DeclareOption{noDatosPie}{
  \ifoot{}\cfoot{}\ofoot{}
}

\def\boolmarcaagua{0}
\DeclareOption{marcaagua}{
  \def\boolmarcaagua{1}
}
\ProcessOptions\relax
% -------------------------------------------------------------------
% PAQUETES Y OPCIONES
% -------------------------------------------------------------------
\RequirePackage[utf8]{inputenc} 

\RequirePackage[english, spanish, es-nodecimaldot, es-noindentfirst, es-tabla,es-noquoting]{babel}
  \unaccentedoperators % Desactiva los acentos en los operadores matemáticso (p.e. \lim, \max, ...). Eliminar esta opción si queremos que vayan acentuados

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
\RequirePackage[theoremfont,largesc,tighter,p,osf]{newpxtext}
\RequirePackage[noamssymbols]{newpxmath}
  \useosf % old-style figures in text, not in math
  \linespread{1.05} % Palatino needs more leading (space between lines)

% Clon de Gill Sans
\IfFileExists{cabin.sty}{
  \RequirePackage[scaled=.95,type1]{cabin} 
} %else
{
  % Si cabin da ERROR usar el siguiente comando en su lugar
  \renewcommand{\sfdefault}{iwona} 
}
\RequirePackage{inconsolata}

\RequirePackage{setspace}
\RequirePackage{xspace} % Para problemas de espaciado al definir comandos

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
  pdfsubject={},%
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
% ESTILOS DE LA CLASE KOMA
% -------------------------------------------------------------------
% Selecciona el tipo de fuente para los títulos (capítulo, sección, subsección) del documento.
\setkomafont{disposition}{\sffamily\bfseries}

% \recalctypearea % Necesario tras definir la tipografía a usar.

% -------------------------------------------------------------------
% PORTADA Y PÁGINA DE TÍTULO
% -------------------------------------------------------------------

% Definición de la imagen de fondo (ver comando \archivoportada).
\if\boolmarcaagua1
\RequirePackage{eso-pic}
\newcommand\AtPageLowerRight[1]{\put(\LenToUnit{\paperwidth-0pt},0){\llap{\raisebox{0pt}{#1}}}}
\AddToShipoutPictureBG{\AtPageLowerRight{\includegraphics[width=0.6\pdfpagewidth]{\marcaAgua}}}
\fi

\AtBeginDocument{\thispagestyle{scrheadings}}

% \AtEndDocument{
% % Para firmar el documento digitalmente, eliminar el siguiente bloque te texto.
% \vfill\vfill
% \begin{center}
%   Granada, \today
%
%   \includegraphics[width=7cm]{img/firma}
%
%   \printNombre
% \end{center}
% \vfill
% }
