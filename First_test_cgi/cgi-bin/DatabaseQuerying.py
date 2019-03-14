import mysql.connector as MySQL
import base64 as b

class Database_Connection:
    __pwd = 'cm9vdA=='
    def __init__(self):
        self.db=MySQL.connect(host="localhost", user="root", password="root", db="employee_db1")
        self.crsr = self.db.cursor()
    def query_data(self,query):
        self.crsr.execute(query)
        return self.crsr.fetchall()
    def query_col_names(self,query):
        self.crsr.execute(query)
        return [i[0].encode('utf8') for i in self.crsr.description]

    def query_table_to_list(self,query):
        self.crsr.execute(query)
        header = self.query_col_names(query)
        res = self.query_data(query)
        res.insert(0, header)
        return res
    def __del__(self):
        self.db.close()
