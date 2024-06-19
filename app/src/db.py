import os
import psycopg2
import logging

class DB:
    def __init__(self):
        # Reading the variables from ENV
        self.db_host = os.getenv('DB_HOST')
        self.db_user = os.getenv('DB_USER')
        self.db_password = os.getenv('DB_PASSWORD')
        self.db_name = os.getenv('DB_NAME')
        self.db_conn = None


        logging.info(f"DB_HOST: {self.db_host}")
        logging.info(f"DB_USER: {self.db_user}")
        logging.info(f"DB_PASSWORD: {'******' if self.db_password else 'None'}")
        logging.info(f"DB_NAME: {self.db_name}")



    def connect(self):
        try:
            self.db_conn = psycopg2.connect(
                host=self.db_host,
                user=self.db_user,
                password=self.db_password,
                dbname=self.db_name
            )
            self.db_conn.autocommit = True
        except psycopg2.Error as e:
            print(f"Error connecting to PostgreSQL: {e}")

    def get_users(self):
        self.connect()
        cursor = self.db_conn.cursor()
        query = "SELECT id, name, surname, friends, home_page FROM users"
        cursor.execute(query)
        response = ""
        for (id, name, surname, friends, home_page) in cursor:
            response += f"{id} {name} {surname} {friends} {home_page}\n"
        cursor.close()
        return response

    def get_user_by_id(self, user_id):
        self.connect()
        cursor = self.db_conn.cursor()
        query = "SELECT id, name, surname, friends, home_page FROM users WHERE id = %s"
        cursor.execute(query, (user_id,))
        response = ""
        for (id, name, surname, friends, home_page) in cursor:
            response += f"{id} {name} {surname} {friends} {home_page}\n"
        cursor.close()
        return response

    def __del__(self):
        if self.db_conn is not None:
            self.db_conn.close()


# Example usage:
if __name__ == "__main__":
    db = DB()
    print("All users:")
    print(db.get_users())
    print("User with id=1:")
    print(db.get_user_by_id(1))
