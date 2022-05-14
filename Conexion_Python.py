import psycopg2

user_in = input("Ingrese su usuario de Postgres: ")
password_in  = input("Ingrese su contraseña de Postgres: ")
database_in  = input("Ingrese el nombre de la base de datos: ")
host_in  = input("Ingrese el host: ")
port_in  = input("Ingrese el puerto: ")

tables ={"champion":("name", "class", "play_style", "title"),
        "worlds": ("year", "role"),
        "ability": ("ability_id", "name", "key", "base_cooldown", "base_range", "name_champion"),
        "play": ("pick_rate", "ban_rate", "win_rate", "kills", "deaths", "year_worlds", "role_worlds", "name_champion")
        }

a = "moro"
print(a.upper())

try:
    conexion = psycopg2.connect(user=user_in,
                                password=password_in,
                                database=database_in,
                                host=host_in,
                                port=port_in)
    print("Conexión correcta!")
    

    table = input("INGRESE EL NOMBRE DE LA TABLA QUE DESEA BUSCAR\n*ingrese exit para salir\n")
    while table!="exit":
        column = input(f"INGRESE EL NOMBRE DE LA COLUMNA QUE DESEA BUSCAR\nColumnas de {table}: {tables[table]}\n*ingrese back para volver\n")
        
        while column != "back":
            
            sql1 = f"""select {column}
                from {table}
                order by 1;"""
            
        #Se ejecuta la sentencia para mostrar los nombres de los paísesa
            cursor = conexion.cursor()
            cursor.execute(sql1)
            country = cursor.fetchone()
            print(f"****{column.upper()}****")
            while country:
                for i in range(len(country)):
                    print(country [i], end=";\t")
                print("")
                country = cursor.fetchone()
                
            column = input(f"INGRESE EL NOMBRE DE LA COLUMNA QUE DESEA BUSCAR\nColumnas de {table}: {tables[table]}\n*ingrese back para volver\n")
    
        table = input("INGRESE EL NOMBRE DE LA TABLA QUE DESEA BUSCAR\n*ingrese exit para salir\n")
    
    cursor.close()
    conexion.close()
    
except psycopg2.Error as e:
    print("Ocurrió un error al consultar: ", e)