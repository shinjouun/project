# -*- coding: utf-8 -*-
"""
Created on Tue Nov  8 17:17:44 2022

@author: MYCOM
"""

import pandas as pd
import pymysql

from dbms.DBManager import DBManager 

def Toint(value) :
    try :
        value = int(value)
    except :
        value = 0
        
    return value


#수집된 영화 리뷰를 메모장에서 utf8 에서 ansi로 저장한 후 구동한다.
df = pd.read_csv("./data/movie_info_euckr.csv",encoding="cp949")
#print(df)
code = df['영화코드']
total = len(code)
print(total)

db = DBManager()
db.DBOpen()
for i in range(0,total) :
    print("%d / %d 번째 처리중..." %(i+1,total+1))
    score = str(df.iloc[i]['평점'])
    mcode = str(df.iloc[i]['영화코드'])
    mhobby = str(df.iloc[i]['장르'])
    mtime = str(Toint(df.iloc[i]['러닝타임'].replace("분","")))
    mposter = str(df.iloc[i]['표지이미지'])
    male = str(Toint(df.iloc[i]['남자']))
    female = str(Toint(df.iloc[i]['여자']))
    teenage = str(df.iloc[i]['10대'])
    twenty = str(df.iloc[i]['20대'])
    thirty = str(df.iloc[i]['30대'])
    forty = str(df.iloc[i]['40대'])
    fifty = str(df.iloc[i]['50대'])
    mstory = str(df.iloc[i]['줄거리'])
    
    sql = ""
    sql += "update movie set mscore = '"+ score + "', "
    sql += "mhobby = '" + mhobby + "', "
    sql += "mtime = '" + mtime + "', "
    sql += "mposter = '" + mposter + "', "
    sql += "male = '" + male + "', "
    sql += "female = '" + female + "', "
    sql += "teenage = '" + teenage + "', "
    sql += "twenty = '" + twenty + "', "
    sql += "thirty = '" + thirty + "', "
    sql += "forty = '" + forty + "', "
    sql += "fifty = '" + fifty + "', "
    sql += "mstory = '" + db._R(mstory) + "' "
    sql += "where mcode = " + mcode
    if db.RunSQL(sql) == False :
        break
    
db.DBClose()    
