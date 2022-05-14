COPY Worlds (year,role)
	FROM 'E:\Descargas\Datos\proyecyo_cool\worlds_cosas.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;

COPY champion(name,class,play_style,title)
	FROM 'E:\Descargas\Datos\proyecyo_cool\Champion.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;

COPY Ability(name_champion,name,key,base_range,base_cooldown)
	FROM 'E:\Descargas\Datos\proyecyo_cool\Ability.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;

COPY Play(year_Worlds,name_Champion, role_Worlds, pick_rate, ban_rate, win_rate, kills, deaths)
	FROM 'E:\Descargas\Datos\proyecyo_cool\play.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;
