"""
MySQL 라이브러리 설치 
pip install pymysql
"""

"""
MySQL 원격 접속 허용
create user 'root'@'%' identified by 'ezen';
grant all privileges on  *.* to 'root'@'%';
flush privileges;
"""

import pymysql
import pandas as pd

class DBManager :      
    Monitoring = True
    def DBOpen(self) :
        try :
            self.con = pymysql.connect(
                host="192.168.0.57",
                port=3306, 
                user="root", 
                passwd="ezen",
                db="cving", charset ="euckr")
            if self.con != None :
                self.cursor = self.con.cursor()
                return True
            return False
        except :
            return False
    
    def DBClose(self) :
        self.con.close()
        
    
    def RunSQL(self,sql) :
        if self.Monitoring == False :
            print(sql)
        try :
            self.cursor.execute(sql)
            self.con.commit()
            return True
        except :        
            print("error====>",sql)            
            return False            
    
    def OpenQuery(self,sql):
        if self.Monitoring == True :
            print(sql)
            
        try :
            self.cursor.execute(sql)
            self.data = self.cursor.fetchall()
            
            columns = []
            for name in self.cursor.description:
                columns.append(name[0])
                
            self.df = pd.DataFrame(self.data,columns = columns)
            print(self.df)
            self.num_fields = len(self.cursor.description)
                
            return True
        except :
            return False       
        
    def CloseQuery(self) :
        self.cursor.close()
        
    def GetTotal(self):
        return len(self.data)
    
    def GetValue(self,rowno,column):
        return self.df.iloc[rowno][column]
    
    def _R(self,data) :
        data = data.replace("–", "-")
        data = data.replace("'","''")
        return data
    
    
        """
        colmun_no = -1
        for name in self.cursor.description:
            colmun_no = colmun_no + 1            
            if name[0] == column:
                return self.data[rowno][colmun_no]
        return "" # 없으면 공백 !
        """
