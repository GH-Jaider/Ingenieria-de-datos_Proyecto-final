COPY Worlds (year)
	FROM 'E:\Descargas\Datos\Entrega3\worlds.csv' 
		WITH DELIMITER ';';

COPY Play_style (id,name)
	FROM 'E:\Descargas\Datos\Entrega3\play_style.csv'
		WITH DELIMITER ',';
		
COPY Class(id,name)
	FROM 'E:\Descargas\Datos\Entrega3\class.csv'
		WITH DELIMITER ';'
		CSV HEADER;

COPY Role(id,name)
	FROM 'E:\Descargas\Datos\Entrega3\role.csv'
		WITH DELIMITER ';';

COPY Champion(name,id_class,id_play_style,title)
	FROM 'E:\Descargas\Datos\Entrega3\Champion.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;

COPY Ability(name_champion,name,key,base_range,base_cooldown)
	FROM 'E:\Descargas\Datos\Entrega3\ability.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;

COPY Play(year_Worlds,name_Champion, id_role, pick_rate, ban_rate, win_rate, kills, deaths)
	FROM 'E:\Descargas\Datos\Entrega3\play.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;