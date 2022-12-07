# -*- coding: utf-8 -*-
"""
모듈기능 : 네이버로부터 영화 번호 목록 전체를 수집한다.
작성자명 : 홍길동
작성일자 : 2022.11.08
기능버전 : 1.0
"""
import requests 
from bs4 import BeautifulSoup
import pandas as pd

    
#1크롤링 시작 함수
#매개 변수로 네이버 영화의 개봉 년도를 받음
def GetURL(code) :
    page = 1 #페이지는 1로 초기화 
    #df로 바꾸기위해 각 항목 리스트를 선언 
    title_list = [] 
    
    making_year_list = []
    
    release_year_list = []
    
    movie_code_list = []
    
    #각 년도당 영화의 마지막 페이지를 알아내기 위해 무한루프 반복문을 돌며 마지막 페이지 확인
    while True :
        
        url = "https://movie.naver.com/movie/sdb/browsing/bmovie.naver?open=" + str(code) + "&page=" + str(page)
        print(url)
        agent_head = {
            "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
            "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }
        
        response = requests.get(url,headers=agent_head)
                     
        soup = BeautifulSoup(response.text, "html.parser")
        
        


        #page_list = page_list.replace("https://movie.naver.com/movie/sdb/browsing/bmovie.naver?open=2023&page=","") 
        #페이징의 다음 표시 블럭을 가져옴
        obj = soup.find_all("td",class_ ="next")
        #print(len(obj))
        #마지막 블럭이 없으면 무한반복 종료
        if  len(obj) == 0 :
            #print(str(page))
            break
        #반복 한번 돌때마다 페이지 수 +1
        page += 1   
        
    #print(page)

    
    #2000~2022년도 까지의 영화 목록을 반복함
    for i in range(2000,2023) :
        
        #2중 반복문으로 년도별 영화의 위에서 구한 마지막 페이지까지 도는 로직 
        #ex.2000년도 영화가 10 페이지 까지라면 10 페이지 까지돌고 2001년으로 넘어감
        for page in range(1,page + 1) :
            url = "https://movie.naver.com/movie/sdb/browsing/bmovie.naver?open=" + str(i) + "&page=" + str(page)
            #print("URL:" + url)
            
            response = requests.get(url,headers=agent_head)
                 
            soup = BeautifulSoup(response.text, "html.parser")
            
            
            content = soup.select(".directory_list > li")
            #select 함수를 써서 여러 값을 한번에 가져와야하니 반복문으로 작업
            #class이름이 directory_list인 태그의 자식 li 태그를 선택해옴
            for item in content :
                
                #print(url)
                #a태그의 텍스트를 뽑아옴
                title = item.a.getText()
                print("영화제목:",title)
                #위와 동일
                making_year = item.ul.li.getText()
                print("제작년도:",making_year)
                #a태그의 주소값을 가져옴
                movie_code = item.a['href']
                #가져온 주소값에서 코드값을 빼고 리플레이스로 없앰
                movie_code = movie_code.replace("/movie/bi/mi/basic.naver?code=","")
                print("영화코드:",movie_code)            
                print("=" * 20)
                
                #class이름이 디테일인것중 2번째 디테일을 가져옴 
                #ex.디테일이란 클래스가 중복 되어 있을경우 사용
                release_year = soup.select_one(".detail :nth-child(2)")
                print(release_year)
                release_year = release_year.getText()
                print("개봉년도:",release_year)
                #위에서 선언한 각 항목별 리스트에 append(추가)
                
                title_list.append(title)
                making_year_list.append(making_year)
                release_year_list.append(release_year)
                movie_code_list.append(movie_code)
                
                
            
            if page == "" :
                break
        
        print(title_list)
        print("=" * 20)
        print(making_year_list)
        print("=" * 20)
        print(release_year_list)
        print("=" * 20)
        print(movie_code_list)
        print("=" * 20)
        
        #csv로 만들기전 데이터 프레임으로 만들어 각 시리즈를 합치는 작업 
        movie_info = {"title" : title_list, "making_year" : making_year_list, "release_year" : release_year_list, "movie_code" : movie_code_list}
        
        movie = pd.DataFrame(movie_info)
        
        
        print(movie)
        #위에서 만든 데이터프레임을 csv파일로 만듦
    movie.to_csv("./movie/movie.csv",encoding="utf8")
list = GetURL(2022)

