# -*- coding: utf-8 -*-
"""
모듈기능 : DB에 팝업이미지를 넣는다.
작성자명 : 박상진 외 3명
작성일자 : 2022.11.09
기능버전 : 1.0
"""
import pandas as pd
from dbms.DBManager import DBManager 


# 파일에서 읽어온다
df = pd.read_csv("./movie/img.csv", encoding="utf8")

# 샘플로 10개만
#df = df[:10]

#컬럼중에 'code','img'만 가져옴
df = df[['code','img']]


# df의 갯수 출력
total = len(df["code"])
#print(len(df["code"]))

# nan제거
df = df.fillna("없음")
#print(df)
#print("%" * 30)

count = 0
db = DBManager()
db.DBOpen() 
for index, row in df.iterrows() : 
    count += 1
    print(count, "/", total+1, "진행중")
    code = row['code']
    img = row['img']
    sql = ""
    sql += "update movie set mimg = '" + img + "' where mcode = " + str(code)
    
    if db.RunSQL(sql) == False :
        break
    
    #print(index, ":" , row['code'], row['img'])
db.DBClose()    

print("작업완료!!!!")
'''
for i in range(0, total) :
    code = df.iloc[i]['code']
    img = df.iloc[i]['img']
    print(code)
    print(img)
    if i > 100 :
        break
'''