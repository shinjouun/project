# -*- coding: utf-8 -*-
"""
모듈기능 : 네이버로부터 영화 포스터를 가져온다.
작성자명 : 박상진 외 3명
작성일자 : 2022.11.09
기능버전 : 1.0
"""
import requests 
from bs4 import BeautifulSoup
import pandas as pd

########################## url을 통해서 img태그의 src속성의 값을 구하는 함수!
def GetImg(code):
    url = "https://movie.naver.com/movie/bi/mi/photoViewPopup.naver?movieCode=" + str(code)
    agent_head = {
    "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
    "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
    }
    
    response = requests.get(url,headers=agent_head)
     
    soup = BeautifulSoup(response.text, "html.parser")
    #obj에 img태그를 넣는다
    obj = soup.find("img")
    
    #가져온 img가 있으면
    if obj != None :      
        obj = obj.get("src")
    else :
        obj = "null"
    return obj
####################### 함수 끝

#데이터프레임 형태로 movie.csv를 가져온다!
df = pd.read_csv("./movie/movie.csv",encoding="utf8")
#print(df["movie_code"])
#코드를 담을 리스트
code_list = []
#img소스를 담을 리스트 
img_list = []
#코드의 개수를 구하는 거
total = len(df["영화코드"])
#실시간 완료 개수 구하는 것
count = 0

#df["movie_code"]의 값을 code라는 변수에 넣는다.
for code in df["영화코드"] :
    count += 1
    #현재 진행도 출력!
    print("%d / %d 진행중" %(count, total))
    
    #code에 들어간 값을 code_list에 넣는다 
    code_list.append(code)
    
    #code를 이용한 GetImg함수의 값을 img_list에 넣는다 
    img_list.append(GetImg(code))

#완성된 리스트를 dic이라는 딕셔너리로 만들어준다
dic = {"code" : code_list, "img" : img_list}

#완성된 딕셔너리를 이용해서 데이터 프레임을 만든다.
new_df = pd.DataFrame(dic)

#완성된 데이터프레임을 이용해서 img.csv를 만들어준다.(to_csv = 데이터프레임을 csv형태로 저장하는 함수)
new_df.to_csv("./movie/img.csv",encoding="utf8")

print("작업완료!!!!")
    

