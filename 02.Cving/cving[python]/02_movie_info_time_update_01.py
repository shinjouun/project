# -*- coding: utf-8 -*-
"""
Created on Thu Nov 10 15:20:30 2022

@author: 727
"""

import pandas as pd
from dbms.DBManager import DBManager

def Toint(value) :
    try :
        value = int(value)
    except :
        value = 0
        
    return value

df = pd.read_csv("./data/movie_info_euckr.csv",encoding="cp949")
df = df[['영화코드','러닝타임']]
db = DBManager()
db.DBOpen()
count = 1
total = len(df['영화코드'])
for index, row in df.iterrows() : 
    print(count, "/", total+1, "진행중")
    code = row['영화코드']
    time = row['러닝타임'].replace("분","")
    time = str(Toint(time))
    sql = "update movie set mtime = '"+ time +"' where mcode = " + str(code)
    count += 1
    
    #print(sql)
    if db.RunSQL(sql) == False :
        break
db.DBClose() 
