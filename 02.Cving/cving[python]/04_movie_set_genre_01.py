# -*- coding: utf-8 -*-
"""
Created on Tue Nov  8 17:17:44 2022

@author: MYCOM
"""

import pandas as pd
import pymysql
from dbms.DBManager import DBManager 


db = DBManager()
db2 = DBManager()
db.DBOpen()
db2.DBOpen()

sql  = "select mcode,mhobby from movie "
sql += "where used = 'Y' "
sql += "order by mhobby desc"
db.OpenQuery(sql)
total = db.GetTotal()

for rowno in range(0,total) :
    mcode = str(db.GetValue(rowno, "mcode"))
    mhobby = str(db.GetValue(rowno, "mhobby"))
    array = mhobby.split(",")
    print(mcode + "==>" + mhobby)
    for genre in array :
        sql = "insert into genre (mcode,mhobby) "
        sql += "values ('" + mcode + "','" + genre + "') "
        #print(sql)
        db2.RunSQL(sql)
db.CloseQuery()
    
db.DBClose()    
db2.DBClose()

print("작업이 완료되었습니다.")

