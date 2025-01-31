---
lang: es
format:
  pdf:
    template: UGR-examen-pandoc-template.tex
    asignatura: "Álgebra"
    curso: "Curso 2023/24"
    convocatoria: "Convocatoria ordinaria"
    fecha: "Junio 2024"
    grado: "Grado en Estadística"
    opciones: "monocromo, marcaagua, bandapie"
    instrucciones: "Todas las respuestas han de estar razonadas. Todos los ejercicios tienen la misma puntuación. Las hojas deben entregarse numeradas y llevar todas el nombre y grupo, situando esta hoja la primera."
---


1. Responde de forma razonada a las siguientes questiones.

    a. Sea $f\colon \mathbb{R}^n\to \mathbb{R}^m$. Si $m< n$, entonces $f$ no puede ser inyectiva.

    b. Sea $V$ un espacio vectorial euclídeo de dimensión $n$ y sea $X$ un conjunto de elementos de $V$ que son ortogonales dos a dos. Demuestra que el cardinal de $X$ es menor o igual que $n$.

    c. Sea $f\colon \mathbb{R} \to \mathbb{R}^n$, con $n$ un entero positivo, de forma que $f(1)$ es no nulo. Sea $A$ la matriz asociada a $f$ respecto de las bases canónicas de $\mathbb{R}$ y $\mathbb{R}^n$. Demuestra que $A$ tiene inversa a la izquierda.

2. Sea $f\colon \mathbb{R}^3\to \mathbb{R}^3$, $f(x,y,z)=(-x+y,x-y,-2z)$. 
    
    a. Encuentra la matriz asociada a $f$ respecto de la base usual de $\mathbb{R}^3$, a la que llamamos $A$ Calcula la forma escalonada reducida por filas de $A$.

    b. Encuentra el núcleo de $f$. Demuestra que el núcleo de $f$ es ortogonal al espacio generado por las filas de $A$ respecto al producto escalar usual.

    c. Encuentra $P$ ortogonal de forma que $P^t A P$ sea diagonal. Calcula $A^{2024}$.

3. En el espacio afín $\mathbb{R}^3$ cosideramos la recta $r$ que pasa por $P=(1,1,1)$ y con vector director $v=(a,1-a,2-a)$, y sea $\pi$ el plano con ecuación cartesiana $x-y+z=6$ (respecto de el sistema de coordenadas usual).

    a. Encuentra un valor de $a$ para el que $r$ es paralela a $\pi$.

    b. Encuentra una recta $s$ que sea perpendicular a $\pi$ y que pase por $P$. Escribe las ecuaciones cartesianas de $s$.

    c. Dependiendo del valor de $a$, calcula la distancia de $r$ a $\pi$.

4. Sea $A\in \mathcal{M}_{4\times 3}(\mathbb{R})$ la matriz
    $$
    A=\left(
        \begin{array}{rrr}
            -1 & 0 & 1\\-1 & 1 & 1\\-1 & 3 & 1\\1 & -2 & -1
        \end{array}
    \right).
    $$

    a. Encuentra la descomposición de rango pleno de $A$.

    b. Calcula $A^\dagger$, la inversa generalizada de $A$.

    c. Para $b=(1,1,1,1)$, calcula la solución mínimo cuadrática de norma mínima del sistema $Ax=b$.
