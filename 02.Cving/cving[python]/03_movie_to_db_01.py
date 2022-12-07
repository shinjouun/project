# -*- coding: utf-8 -*-
"""
Created on Mon Nov  7 21:52:43 2022

@author: user
"""

import pandas as pd
import pymysql

from dbms.DBManager import DBManager 
#없음 이라고 만들었던애들을 0 으로 변환하기위해서
def toInt(value):
    try:
        int(value)
    except :
        value = 0
    return value

df = pd.read_csv("./movie/movie.csv",encoding="utf8")
code = df['영화코드'].index
total = len(code)
db = DBManager()
db.DBOpen()
df = df.astype('object')

#테이블 데이터 삭제 
#db.RunSQL("delete from genre")
#db.RunSQL("delete from movie")

for i in range(0,total) :
    print("%d / %d 진행중" %(i+1, total+1))
    mcode = str(df.iloc[i]["영화코드"]) #영화 코드   
    title = str(df.iloc[i]["영화제목"]) #영화 제목
    making_year = str(toInt(df.iloc[i]["제작년도"]))#제작 년도
    open_year   = str(toInt(df.iloc[i]["개봉년도"])) #개봉 년도
    title       = db._R(title)
    
    sql = ""
    sql = "insert into movie(mcode, mtitle, openyear, makingyear) "    
    sql += "values('" + mcode +"','" + title +"','"+ open_year +"','"+ making_year +"' )"
    if db.RunSQL(sql) == False :
        break

db.DBClose()
print("작업완료")



