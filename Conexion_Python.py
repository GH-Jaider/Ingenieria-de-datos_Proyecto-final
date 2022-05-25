import psycopg2

user_in = input("Ingrese su usuario de Postgres: ")
password_in  = input("Ingrese su contraseña de Postgres: ")
database_in  = input("Ingrese el nombre de la base de datos: ")
host_in  = input("Ingrese el host: ")
port_in  = input("Ingrese el puerto: ")

try:
    conexion = psycopg2.connect(user=user_in,
                                password=password_in,
                                database=database_in,
                                host=host_in,
                                port=port_in)
    print("Conexión correcta!")
    

    table = input("INGRESE EL NOMBRE DE LA TABLA QUE DESEA BUSCAR\n*ingrese exit para salir\n")
    while table!="exit":
        column = input(f"INGRESE EL NOMBRE DE LA COLUMNA QUE DESEA BUSCAR\n*ingrese back para volver\n*")
        
        while column != "back":
            
            sql1 = f"""select {column}
                from {table}
                order by 1;"""
            
        #Se ejecuta la sentencia para mostrar los nombres de los paísesa
            cursor = conexion.cursor()
            cursor.execute(sql1)
            consult = cursor.fetchone()
            print(f"****{column.upper()}****")
            while consult:
                for i in range(len(consult)):
                    print(consult [i], end=";\t")
                print("")
                consult = cursor.fetchone()
                
            column = input(f"INGRESE EL NOMBRE DE LA COLUMNA QUE DESEA BUSCAR\n*ingrese back para volver\n*")
    
        table = input("INGRESE EL NOMBRE DE LA TABLA QUE DESEA BUSCAR\n*ingrese exit para salir\n")
    
    cursor.close()
    conexion.close()
    
except psycopg2.Error as e:
    print("Ocurrió un error al consultar: ", e)
