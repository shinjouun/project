
import pandas as pd
import pymysql
from dbms.DBManager import DBManager 
import requests 
import shutil

db = DBManager()
db.DBOpen()

sql  = "select mimg from movie "
db.OpenQuery(sql)
total = db.GetTotal()

for rowno in range(0,total) :
    print("%d / %d 진행중.." %(rowno+1, total+1))
    mimg = str(db.GetValue(rowno, "mimg"))
    filename = mimg.replace("https://movie-phinf.pstatic.net","")
    filename = "./img/" + filename.replace("/","_")
    agent_head = {
    "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
    "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
    }
    try:
        response = requests.get(mimg,headers=agent_head)
        file = open(filename,"wb")
        file.write(response.content)
        file.close()
    except :
        #이미지가 없으면 blank.jpg 파일을 해당 이미지로 복사한다.
        #print("이미지 없음....")
        shutil.copyfile("img_null.png", filename)
db.CloseQuery()
    
db.DBClose()    

print("작업이 완료되었습니다.")