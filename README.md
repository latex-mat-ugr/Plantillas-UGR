# Plantillas y modelos de documentos en LaTeX para la Universidad de Granada

*Clases de LaTeX* así como modelos de documentos que respeten los criterios de uso de la imagen corporativa de la Universidad de Granada.

## Objetivo

El objetivo de este repositorio es la creación de unas clases de LaTeX para la creación de documentos (certificados, cartas, exámenes,...) que respeten el [manual de identidad visual corporativa](https://secretariageneral.ugr.es/sites/webugr/secretariageneral/public/inline-files/Manual_IVC_UGR_1.pdf) de la Universidad de Granada. Para ello se ha hecho uso tanto de los [elementos de identidad visual corporativa](https://secretariageneral.ugr.es/informacion/servicios/identidad-visual/descarga) como del [repositorio de documentos administrativos](https://institucional.ugr.es/areas/coordinacion-y-proyectos/proyectos/homogeneizacion/documentos-administrativos/repositorio) de la Universidad de Granada. Ver para más detalles la sección [Algunas consideraciones sobre el diseño y los requisitos de la imagen institucional de la Universidad de Granada](#algunas-consideraciones-sobre-el-diseño-y-los-requisitos-de-la-imagen-institucional-de-la-universidad-de-granada)

## Clases y opciones
Actualmente se han creado tres clases: `UGR-generico.cls`, `UGR-carta.cls` y `UGR-examen.cls`. Para seleccionar dicha clase en nuestro documento LaTeX debemos usar el comando `\documentclass` al inicio del documento, p.e.:
```tex
\documentclass[monocromo, noDatosPie]{UGR-generico}
```
donde hemos cargado la clase `UGR-generico` con las opciones `monocromo` y `noDatosPie`. **Es importante respetar las mayúsculas y minúsculas al seleccionar una clase o una opción**.

### Opciones comunes
Todas las clases creadas comparten las siguientes opciones:
- `monocromo`: El logotipo y la marca de agua se imprimen en blanco y negro.
- `corporativo`: El logotipo y la marca de agua se imprimen en el color rojo corporativo.
- `marcaagua`: Imprime una marca de agua con el escudo de la Universidad de Granada en la parte inferior derecha de la página. El color de dicha marca de agua depende de las anteriores opciones.

Si no se selecciona ninguna de dichas opciones el logotipo (situado siempre en la parte superior izquierda de la página) se imprime en color y no se incluye la marca de agua.

### Opciones y variables específicas de cada clase
Cada clase proporciona opciones específicas así como *variables de clase* para la correcta configuración y personalización del documento. A continuación se detallan:

#### Clase `UGR-generico`
**Opciones de la clase**

- `noDatosCabecera`: No imprime los datos del autor del documento en la parte superior derecha de la cabecera.
- `noDatosPie`: No imprime los datos del autor del documento en el pie de página.

**Variables de la clase**

La clase proporciona las siguientes variables para fijar los datos del autor del documento y mostrarlos debidamente, bien en la cabecera o en el pie.
 
- `\Titulo{Título}`
- `\Nombre{Nombre Apellidos}`
- `\Telefono{958 000 000}`
- `\Email{profesor@ugr.es}`
- `\URL{www.ugr.es/~profesor}`
- `\Cargo{Cargo}`
- `\Departamento{Departamento}`
- `\Centro{Facultad o escuela}`
- `\Direccion{Fuentenueva s/n, 18071 Granada}`
- `\Universidad{Universidad de Granada}`

Para asignar un valor simplemente llamar al comando y encerrar entre llave `{` y `}` el valor.

Ver ejemplo [`certificado.tex`](generico/certificado.tex) o [`informe.tex`](generico/informe.tex).

#### Clase `UGR-carta`
**Opciones de la clase**
- `noDatosCabecera`: No imprime los datos del autor del documento en la parte superior derecha de la cabecera.
- `noDatosPie`: No imprime los datos del autor del documento en el pie de página.

**Variables de la clase**

Datos del remitente:

- `\Titulo{Título}`
- `\Nombre{Nombre Apellidos}`
- `\Telefono{958 000 000}`
- `\Email{profesor@ugr.es}`
- `\URL{www.ugr.es/~profesor}`
- `\Cargo{Profesor Titular}`
- `\Departamento{Departamento}`
- `\Centro{Facultad o escuela}`
- `\Direccion{Fuentenueva s/n, 18071 Granada}`
- `\Universidad{Universidad de Granada}`

Datos de destinatario
- `\desNombre{Destinatario}`
- `\desDireccion{Dirección}`
- `\desCP{Código postal}`
- `\desPoblacion{Población}`
- `\desPais{País}`

Ver ejemplo [`carta.tex`](carta/carta.tex).

#### Clase `UGR-examen`
**Opciones de la clase**

- `bandapie`: muestra una franja de color en el borde inferior del documento.
- `noInstrucciones`: No imprime las instrucciones del examen en el pie de la última página. Se puede usar alternativamente el comando `\printInstrucciones` donde se desee que aparezcan las instrucciones.
- `copyright`: Añade una marca de agua en todas las páginas con el texto *"(c) Universidad de Granada"*. Útil para publicar los examenes en PRADO.
- `dislexia`: Usa la fuente [Atkinson hyperlegible](https://www.brailleinstitute.org/freefont/)

**Variables de la clase**

- `\Grado{Grado}`
- `\Departamento{Departamento}`
- `\Asignatura{Asignatura}`
- `\CursoAcademico{Curso académico 23/24}`
- `\Convocatoria{ordinario o extraordinario}`
- `\Fecha{17 de julio de 2024}`
- `\Instrucciones{instrucciones sobre la realización del examen}`

Ver ejemplo [`examen.tex`](examen/examen.tex)

## Instalación y uso

Hay dos formas de usar las clases. La [primera de ellas](#descargar-y-uso) es más sencilla pero requiere que copiemos tanto el fichero de clase que queramos usar ([UGR-generico.cls](generico/UGR-generico.cls), [UGR-carta.cls](carta/UGR-carta.cls) o [UGR-examen.cls](examen/UGR-examen.cls)) como los ficheros de logos ([logos/](generico/logos)) en la carpeta del documento LaTeX. [La segunda](#instalación-de-las-clases-y-logos-el-el-arbol-local-de-tex) nos permitirá usar las clases en cualquier documento LaTeX de nuestro ordenador.

### Descargar y uso

En el siguiente ejemplo descargaremos las clases y crearemos un nuevo documento usando la clase `UGR-generico.cls`:

1. Descarga el repositorio. Para ello pulsa el botón verde  `< > Code` y selecciona *Download ZIP*.
2. Entra en la carpeta `generico` y crea un nuevo fichero `ejemplo-generico.tex` **en dicha carpeta**.
3. Copia el contenido de `certificado.tex` o `informe.tex` en tu documento `ejemplo-generico.tex``.
3. Edita dicho fichero con tu editor favorito añadiendo tus datos a las variables de clase y modificando el texto del cuerpo del mensaje.
4. Compila dicho documento mediante `pdfLaTeX`.


### Instalación de las clases y logos en el arbol local de TeX.

Es posible *instalar* tanto las clases como los logos de la UGR para que estén disponibles en cualquier documento de nuestro ordenador, ahorrándonos así los pasos (1) y (2) cada vez que queramos crear un documento con las plantillas. Para ello, hay que hacer **una única vez** los siguientes pasos:

1. Descarga el repositorio. Para ello pulsa el botón verde  `< > Code` y selecciona *Download ZIP*.
2. Localizar la carpeta del *arbol local de TeX* ('local texmf tree'). La ubicación de esta carpeta dependerá tanto de nuestro sistema operativo como de la *distribución* de LaTeX que tengamos instalada. A continuación hay un listado de las ubicaciones habituales:
    - Linux: `~/texmf`.
    - MacOS: `~/Library/texmf/`
    - Windows: `C:\Users\nombreUsuario\texmf`
3. Copiar los ficheros de clase ([UGR-generico.cls](generico/UGR-generico.cls), [UGR-carta.cls](carta/UGR-carta.cls) y [UGR-examen.cls](examen/UGR-examen.cls)) al subdirectorio `tex` en dicha carpeta (crear dicho directorio si no existe)
4. Copiar los ficheros de logos ([logo-ugr-horizontal](generico/logos/logo-ugr-horizontal.pdf), [logo-ugr-horizontal-monocromo](generico/logos/logo-ugr-horizontal-monocromo.pdf), [logo-ugr-color-corporativo](generico/logos/logo-ugr-color-corporativo.pdf) [marca-agua-logo-ugr-color](generico/logos/marca-agua-logo-ugr-color.pdf) y [marca-agua-logo-ugr](generico/logos/marca-agua-logo-ugr.pdf)) en el subdirectorio `tex/images` (crear dicho directorio si no existe)

Una vez hecho esto quizá sea necesario reiniciar el equipo.

Ahora crear un documento (por ejemplo `ejemplo-generico.tex`) en cualquier carpeta de nuestro equipo y copiar en él el contenido de `certificado.tex`. Editar el fichero añadiendo los datos y las opciones que creamos convenientes. Finalmente compilar el documento para ver el resultado.

## TODO
- Automatización y uso con `pandoc`


## Algunas consideraciones sobre el diseño y los requisitos de la imagen institucional de la Universidad de Granada

Para la elaboración de las plantillas se ha seguido, lo más fielmente posible, los modelos presentados en el [manual de identidad visual corporativa](https://secretariageneral.ugr.es/sites/webugr/secretariageneral/public/inline-files/Manual_IVC_UGR_1.pdf).

La tipografía oficial para el cuerpo del texto de un documento indicada en el [manual de identidad visual corporativa](https://secretariageneral.ugr.es/sites/webugr/secretariageneral/public/inline-files/Manual_IVC_UGR_1.pdf) de la Universidad de Granada es *Minion Pro Regular*. Puesto que se trata de una tipografía comercial que es posible que el usuario no tenga instalada en el sistema, en el mismo documento se proponen varias alternativas: Bembo, Garamond, Palatino o Sabon. En estas plantillas se ha decidido el uso de *Palatino* cargada mediante los paquetes
```tex
\usepackage[theoremfont,largesc,tighter,p,osf]{newpxtext}
\usepackage[noamssymbols]{newpxmath}
```
Como tipografía *sans-serif* se ha cargado el paquete `cabin` que proporciona un clon de *Gill Sans*, tipografía usada en el logotipo de la UGR.
```tex
  \usepackage[scaled=.95,type1]{cabin} 
```

En cuanto a la composición de página (ver pp. 73 y 75 del [manual de identidad visual corporativa](https://secretariageneral.ugr.es/sites/webugr/secretariageneral/public/inline-files/Manual_IVC_UGR_1.pdf)), el diseño de página es similar pero no respeta exactamente las medidas indicadas. 
