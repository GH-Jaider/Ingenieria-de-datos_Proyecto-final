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
- [Base de datos y tablas](#base-de-datos-y-tablas)
- [Importación de datos](#importacion-de-datos)
- [Conexión con Python](#conexion-con-python)
- [Licencia](#licencia)
- [Limitación de responsabilidades - Solo BID](#limitación-de-responsabilidades)
- [Autor/es](#autores)

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
| Champion	     | Champ_ID,	Name,	Class, Play_style, Title| Worlds (M): Play Abilities (M): Have|
| Worlds        | Year, Role, Pick_rate, Ban_rate, Win_rate, Kills, Deaths | Champion (M): Play|
| Abilities     | Ability_ID,	Name,	Key, Base_cooldown, Base_Range| Champion (1): Have|

---
## Diagrama Entidad-Relacion

<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/Diagrama%20entidad-relacion.png"/></p> 

---
## Diagrama Relacional Normalizado

<p align="center"><img src="https://github.com/GH-Jaider/Ingenieria-de-datos_Proyecto-final/blob/main/diagrama_relacional_normalizado.png"/></p> 

---
## Base de datos y tablas


## Importación de datos
---
## Conexion con Python
