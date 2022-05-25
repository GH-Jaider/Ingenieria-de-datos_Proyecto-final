import psycopg2

class Connection:
    
    def __init__(self):
        self.connection = None
    
    def openConnection(self):
        try:
            self.connection = psycopg2.connect(user="Usuario",
                                               password="Contraseña",
                                               database="database",
                                               host="Host", 
                                               port="Port")
        except Exception as e:
            print (e)

    def closeConnection(self):
        self.connection.close()
