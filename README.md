<h1 align="center"> LoL Worlds games stats</h1>
<p align="center"> League of Legends </p>
<p align="center"><img src="https://codigoesports.com/wp-content/uploads/2017/12/WORLDSLOGOFINAL.png"/></p> 

## Tabla de contenidos:
---

- [Glosario](#glosario)
- [Descripción y contexto](#descripción-y-contexto)
- [Reglas de negocio](#reglas-de-negocio)
- [Tabla ER](#tabla-er)
- [Diagrama Entidad-Relacion](#diagrama-entidad-relacion)
- [Diagrama Relacional](#diagrama-relacional)
- [Diagrama Relacional normalizado](#diagrama-relacional-normalizado)
- [Base de datos](#base-de-datos)
- [Importación de datos](#importación-de-datos)
- [Conexión con Python](#conexion-con-python)
- [Analisis de escenarios con DASH](#analisis-de-escenarios-con-dash)
- [Conclusiones](#conclusiones)
- [Autores](#autores)

---
## Glosario
-	Summoner: Nombre que reciben los jugadores de LoL en el contexto del videojuego.
-	Champion (campeón): Personajes que son invocados al mapa del juego por cada uno de los jugadores. (LoL cuenta con 159 campeones diferentes en la versión actual)
-	Pick rate (PR%): Corresponde a la tasa de selección que tiene un campeón a lo largo de un determinado número de partidas
-	Ban: En la jerga del LoL se refiere a bloquear un campeón para que no pueda jugarse en una partida. (En cada partida se pueden banear 5 campeones por equipo)
-	Ban rate (BR%): Corresponde a la tasa de baneo que tiene un campeón a lo largo de un determinado número de partidas
-	Meta: Proviene del inglés Most Efficient Tactic Available o táctica más eficiente disponible y se refiere a los campeones que las modificaciones de la versión del juego se encuentran dando mejores resultados en la partida.
-	Win rate (WR%): Corresponde a la tasa de victorias que tiene un campeón en un determinado número de partidas.
-	Play-style: Hace referencia a la manera en que se juega a cada campeón durante las partidas.
-	Role: El LoL cuenta con 5 roles diferente, que corresponden a las posiciones del mapa en que se juega a cada campeón.
-	Class: Categorías que permiten agrupar a los campeones de acuerdo con su play- style. El role en que va cada campeón suele estar influenciado directamente por su class.
-	KD: Hace referencia a las Kills (asesinatos) y Deads (muertes) que tiene un campeón en un determinado número de partidas.
- Coodown: Es la cantidad de tiempo antes de que una habilidad de campeón pueda usarse nuevamente después de la activación.
- Range: Es el alcance (medido en "puntos") que tiene una determinada habilidad.

---
## Descripción y contexto

League of Legends, también conocido como LoL, es un juego de estrategia en el que dos equipos de cinco jugadores se enfrentan para ver quién destruye antes la base del otro. Mundialmente conocido como el e-sport más importante.

Se han seleccionado 4 sets de datos donde se dan a conocer estadísticas de los campeones de LoL[^1] , sus habilidades[^2] y las estadísticas de estos[^3] presentadas en la copa mundial del e-sport, llamada Worlds. Basándonos en la recopilación y selección de ciertas columnas específicas de estos sets de datos, hemos identificado el siguiente problema a trabajar:


[^1]: League of Legends - Champions & Items' Stats: https://www.kaggle.com/datasets/barthetur/league-of-legends-champions-items-stats 
[^2]: League of Legends Champions Abilities 10.15: https://www.kaggle.com/datasets/fernandorubiogarcia/league-of-legends-champions-abilities-1015
[^3]: LoL Worlds Champion Pick and Ban Rate: https://www.kaggle.com/datasets/vincentbarletta/league-of-legends-worlds-champion-pb-dataset?select=Worlds+2021+Main+Event+-+Champion+Stats+-+OraclesElixir.csv


 #### **¿Cuáles son los campeones que se han mantenido constantes en el escenario competitivo a pesar del estado del metagame?** 
 
 ---
 ## Reglas de negocio
1.	El juego tiene varios campeones.
2.	Cada campeón tiene un ID y un nombre único.
3.	Cada campeón posee un nombre, ID, clase, playstyle y un título dentro del juego.
4.	Los campeones tienen roles.
5.	El juego registra el PR%, BR%, WR%, KD de los campeones con base en el rol y en un año durante el Worlds.
6.	Un campeón puede jugarse en varios roles.
7.	Un campeón puede tener varias habilidades.
8.	Una habilidad solo puede ser usada por un campeón.
9.	Una habilidad tiene un único ID, un nombre, una key, un rango base y un cooldown base.
10.	En un Worlds participan varios campeones en distintos roles.

---
## Tabla ER

| Entidad       | Atributos     | Relaciones          |
| ------------- | ------------- | -------------       |
| Champion	     | Name,	Class, Play_style, Title| Worlds (M): Play Abilities (M): Have|
| Worlds        | Year, Role, Pick_rate, Ban_rate, Win_rate, Kills, Deaths | Champion (M): Play|
| Abilities     | Ability_ID,	Name,	Key, Base_cooldown, Base_Range| Champion (1): Have|

---
## Diagrama Entidad-Relacion

<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Diagrama%20entidad-relacion.jpg"/></p> 

---
## Diagrama Relacional

<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/diagrama_relacional_v2.png"/></p> 

## Diagrama Relacional Normalizado

<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/relacional_normalizado_v3.png"/></p> 

---
## Base de datos

El código ddl que genera las tablas en la base de datos, se encuentra en la carpeta ‘Entrega2’ como: *League_of_Legends_DDL.sql* En este archivo se crean las tablas en sentencias SQL, las cuales son: Champion, Worlds, Play y Ability. Cada una con sus columnas correspondientes. </p>

Creación base de datos: https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Entrega2/League_of_Legends_DDL.sql

---
## Importación de datos

Las sentencias SQL para realizar la carga de datos se encuentran en la carpeta ‘Entrega3’ como: *DML_lol.sql* Se aprovecharon las funciones de carga masiva de datos de la siguiente manera:
~~~
COPY table_name (table_column_1, table_column_2)
	FROM 'file_route.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;
~~~
<p align="right"><sup>Los archivos DML en 'Entrega3' solo tienen el nombre del archivo.csv, es importante que al ejecutar se cambien por la ruta</sup>

Importación de datos: https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Entrega2/DML_lol.sql


---
## Conexion con Python

El script conexion_python.py tiene la función de realizar consultas simples en la base de datos, permitiendo acceder a una o más columnas de una determinada tabla.
~~~
INGRESE EL NOMBRE DE LA TABLA QUE DESEA BUSCAR
*ingrese exit para salir
champion
INGRESE EL NOMBRE DE LA COLUMNA QUE DESEA BUSCAR
*ingrese back para volver
name
****NAME****
Aatrox;
Ahri;
Akali;
Akshan;
Alistar;
Amumu;
~~~
<p align="right"><sup>Este ejemplo muestra una consulta de la columna "Name" de la tabla "Champion".</sup>

---
	
## Analisis de escenarios con DASH
### En los Worlds ¿Predominan los campeones de rango o melé?
	
Gracias a la relación que puede generarse entre las habilidades de un campeón y las veces que se ha jugado en el escenario competitivo, es posible realizar un analisis comparativo en que se promedia el rango de las habilidades - para determinar si un campeon se puede considerar "de rango" (promedio de rango mayor a 2000 puntos) - y se vincula este dato a los campeones se han jugado en los worlds.

Con el fin de facilitar el analisis de la información que se obtiene se muestran los datos mediante gráficos.
	
Sentencia SQL empleada para obtener los datos necesarios para el analisis:
	
~~~		SELECT cp.name as champion, AVG(a.base_range)::real as range
    		FROM (Champion c INNER JOIN Play p ON (c.name = p.name_Champion)) cp
    		INNER JOIN Ability a on (cp.name = a.name_Champion)
		GROUP BY cp.name
~~~

Gráfico de barras entre rango y campeón:
<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Entrega3/Graficas/newplot.png"/></p>

Gráfico de líneas entre rango y campeón:
<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Entrega3/Graficas/newplot%20(1).png"/></p>

Para este caso, se realizaron dos diagramas: uno de barras y uno de líneas. Ambos nos presentan la información del rango con respecto a cada campeón jugado en Worlds.
En ambos, el panorama general presenta los campeones que han sido jugados y se puede evidenciar que la mayoría de estos tienen un rango menor a 2000. Con esto, es posible decir que la mayoría de los campeones jugados en el torneo son campeones de melé. 

Sin embargo con el diagrama de líneas podemos evidenciar picos que están prácticamente igualados a los 2000, por lo que puede que existan más campeones de rango jugados a los evidenciados. Esto se debe a que al calcular la media del rango de cada campeón, es posible que los de rango hayan tenido una habilidad que desviara su media haciéndolos pasar por melé. 
Así, las desventajas de ambos diagramas recaen en los valores que quedan muy cercanos al límite. Sin embargo, nos permiten tener una perspectiva bastante acertada de la dominancia de los campeones a melé jugados en los Worlds.

### ¿Cuál es el campeón con más deaths registradas a lo largo de la historia de los Worlds?
Este es un analisis relativamente sencillo que se obtiene a partir de filtrar la suma de las Deaths que ha tenido un campeon a lo largo de sus historial competitivo, que, anque a priori no seune como uan información sumamente relevante, permite hacerse una idea más allá de simplemente "cuál es el campeon que más muere", ya que es posible empezar a inferir cuales son los campeones que más se utilizan en el competitivo, dado que la relación entre muertes y partidas jugadas crece de forma directamente proporcional.

Los gráficos permiten entender esta idea de forma más sencilla.

Sentencia SQL empleada para obtener los datos necesarios para el analisis:
~~~
		SELECT c.name as champion, SUM(p.deaths) Total_Deaths
    		FROM Champion c INNER JOIN Play p ON (c.name = p.name_Champion)
    		GROUP BY c.name
   		ORDER BY Total_Deaths DESC
~~~

Grafíco de dispersión de deaths totales de un campeón:
<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Entrega3/Graficas/newplot%20(2).png"/></p>

Gráfico circular de los campeones con más deaths registradas:
<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Entrega3/Graficas/newplot%20(3).png"/></p>


Con el fin de complementar el analisis previo, que era con respecto a las Deaths, se realizó una consulta similar que permite obtener el acumulado de Kills realizadas por un campeón e su historia competitiva.

~~~
		SELECT c.name as champion, SUM(p.kills) Total_Kills
   		FROM Champion c INNER JOIN Play p ON (c.name = p.name_Champion)
    		GROUP BY c.name
    		ORDER BY Total_Kills DESC
~~~

Grafíco de dispersión de kills totales de un campeón:
<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Entrega3/Graficas/newplot%20(4).png"/></p>

Gráfico circular de los campeones con más kills registradas:
<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Entrega3/Graficas/newplot%20(5).png"/></p>


### ¿Cuál es el campeón con mayor rendimiento y el de peor rendimiento según su KD en los Worlds?

Para este punto, y gracias a las dos analisis previos, ya seria relativamente factible empezar a inferir que personajes predominan en el escenario competitivo del LoL; sin embargo, dado que los analisis anteriores son facilmente influenciables por partidas atípicas, lo mejor para una analisis de este estilo seria utilizar una medida especializada en representar el rendimeinto de un campeón, llamada KD, y repressenta la razon entre las Kills y las Deaths que tiene un campeón. Para efectos de facilitar este analisis se realizó un cálculo generalizado del KD, esto es: 
<p align="center"><img src="[https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Entrega3/Graficas/newplot%20(6).png](https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/A%C3%B1adidos/SUMA.png)"/></p>
	Donde n representa el número de partidas jugadas con un campeón

https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/A%C3%B1adidos/SUMA.png
~~~
		(SELECT c.name champion, SUM(p.kills)::real KD 
		 FROM Champion c INNER JOIN Play p ON (c.name = p.name_Champion)
		 GROUP BY c.name 
		 HAVING SUM(p.deaths) = 0)
		UNION
		(SELECT c.name, SUM(p.Kills)/SUM(p.Deaths)::real KD
		 FROM Champion c INNER JOIN Play p ON (c.name = p.name_Champion)
		 GROUP BY c.name
		 HAVING SUM(p.Deaths)>0)
~~~

Gráfica de barras de relación de KD con campeón:
<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Entrega3/Graficas/newplot%20(6).png"/></p>

Gráfica de dispersión en relación al KD de cada campeón:
<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Entrega3/Graficas/newplot%20(7).png"/></p>

### ¿Hay campeones que no se han jugado en el escenario competitivo de LoL? ¿Cuáles son?

~~~
		SELECT c.name champions
		FROM Champion c LEFT JOIN Play p ON (c.name = p.name_Champion)
		WHERE p.pick_rate is NULL
~~~
	
	
---
## Conclusiones 
	
	awadeuwu
---
## Autores

- Natalia Martínez Neira
- Juan Andrés Alayón Ariza
- Jaider Duván Velasco Díaz
