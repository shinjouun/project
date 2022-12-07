# -*- coding: utf-8 -*-
"""
Created on Wed Nov  9 15:30:58 2022

@author: 727
"""

import requests 
from bs4 import BeautifulSoup
import pandas as pd
#################마지막페이지를 구함
def Get_Last_Page(year) :
    page = 1
    while True :
        url = "https://movie.naver.com/movie/sdb/browsing/bmovie.naver?open=" + str(year) +"&page=" + str(page)
        agent_head = {
            "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
            "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }
        
        response = requests.get(url,headers=agent_head)
                     
        soup = BeautifulSoup(response.text, "html.parser")
        obj = soup.select_one("td.next")
        if obj == None :
            break
        page+=1
    return page
################# 
#################년도별 크롤링
def GetHTML(year,page) :
        url = "https://movie.naver.com/movie/sdb/browsing/bmovie.naver?open=" + str(year) +"&page=" + str(page)
        agent_head = {
            "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
            "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }
        
        html = requests.get(url,headers=agent_head)
                     
        soup = BeautifulSoup(html.text, "html.parser")
        
        return soup
    
#################           
title_list = []
open_list = []
making_list = []
code_list = []

for year in range(2000, 2023) :
    for pageno in range(1, Get_Last_Page(year) + 1): # <=없어서 +1 해준거임 
        soup = GetHTML(year, pageno)
        content = soup.select(".directory_list > li")
        for item in content :
            #print(url)
            
            #영화 제목
            title = item.a.getText()
            pos = title.find("(")
            if pos > 1 :
                title = title[:pos].strip()
            print("영화제목:",title)
            
            #가져온 주소값에서 코드값을 빼고 리플레이스로 없앰
            movie_code = item.a['href']
            movie_code = movie_code.replace("/movie/bi/mi/basic.naver?code=","")
            print("영화코드:",movie_code)
            
            #개봉년도
            open_year = year
            print("개봉년도:",open_year)
            
            #제작년도
            making_year = item.ul.li.getText()
            print("제작년도:",making_year)
            
            print("*" * 30)
            
            title_list.append(title) #append추가
            open_list.append(open_year)
            making_list.append(making_year)
            code_list.append(movie_code)
     
movie_info = {"영화제목" : title_list, "개봉년도" : open_list, "제작년도" : making_list, "영화코드" : code_list}
        
movie = pd.DataFrame(movie_info) #데이터 프레임으로 만들어


#위에서 만든 데이터프레임을 csv파일로 만듦
movie.to_csv("./movie/movie.csv",encoding="utf-8",index=False)
    
print("작업완료!!!")
