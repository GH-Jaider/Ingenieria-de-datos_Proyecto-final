COPY Worlds (year,role)
	FROM 'Worlds.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;

COPY champion(name,class,play_style,title)
	FROM 'Champion.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;

COPY Ability(name_champion,name,key,base_range,base_cooldown)
	FROM 'Ability.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;

COPY Play(year_Worlds,name_Champion, role_Worlds, pick_rate, ban_rate, win_rate, kills, deaths)
	FROM 'Play.csv' 
		WITH DELIMITER ';' 
		CSV HEADER;
