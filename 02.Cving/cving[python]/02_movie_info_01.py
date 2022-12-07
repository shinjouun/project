import requests 
from bs4 import BeautifulSoup
import pandas as pd
import os #파일관련된것

#공백,개행 등을 없앤다.#내가 원하는 카테고리에 원하는 요소에
def ObjGetText(soup,selecter,default,attr=""): #태그의 정보를 가지고오게하는것,태그위치,값이없을때형식으로가져와라,attr 속성의 값을 가져와라 !
    #========================================
    value = ""
    if attr == "" :
        obj   = soup.select_one(selecter) #정보를 한개만
        if obj == None :
            value = default
        else:
            value = obj.getText()        
    else :
        try :
            value = soup.select_one(selecter)[attr] #속성값이랑 같이 가지고와라 !
        except :
            value = default 

    value = value.strip()#앞뒤로 공백 없애주는것 !
    value = value.replace(" ","")
    value = value.replace("\r\n","")
    value = value.replace("\t","")
    value = value.replace("\n","")
    value = value.replace(" ","")
    value = value.replace("<br>","")
    return value
    #========================================
    
#공백,개행 등을 없앤다.#줄거리 처리
def ObjGetStory(soup,selecter,default,attr=""):
    #========================================
    value = ""
    if attr == "" :
        obj   = soup.select_one(selecter) 
        if obj == None :
            value = default
        else:
            value = obj.getText()        
    else :
        try :
            
            value = soup.select_one(selecter)[attr]
        except :
            value = default

    value = value.replace("<br>","")
    value = value.replace("\"","")
    value = value.replace(","," ")
    
    return value
    #========================================    

#남/여 선호도 값 추출
def GetGender(html,start_pos) :
    #========================================
    gender = ""
    e_pos  = -1 #못찾으면 -1이나옴
    s_pos  = html.find('"iPer": ',start_pos) #s_pos iper에 0번째부터 
    if s_pos == None :
        gender = "없음"
    else :
        if s_pos > 0  :
            e_pos = html.find(',',s_pos) # ,기준으로 s_pos만큼자른다
            if e_pos > 0  :
                s_pos += 8   #스타트포스 8자만 보여주는것
                gender = html[s_pos:e_pos] # 스타트포스부터 엔딩포스까지해서 문자를 짜르는것
        #실수 -> 반올림 작업
        if gender == "" :
            gender = "없음"
        else :
            gender = float(gender[:4]) #4번째 자리까지 자른다.
            gender = round(gender) # 반올림
    return gender, e_pos
    #========================================


#CSV에 컬럼 저장
def SaveCSVValue(file,value,comma=",") :
    file.write("\"" + str(value) + "\"" + comma)    
    
#CSV파일 헤더 작성
def SetMovieInfo(filename):
    file = open(filename,"a",encoding="utf8")    
    file.write("영화코드,")    
    file.write("URL,")        
    file.write("평점,")    
    file.write("장르,")    
    file.write("러닝타임,")    
    #file.write("연령대,")    
    file.write("표지이미지,")    
    file.write("남자,")    
    file.write("여자,")    
    file.write("10대,")    
    file.write("20대,")    
    file.write("30대,")    
    file.write("40대,")    
    file.write("50대,") 
    file.write("줄거리\n")
    file.close()
    
#각 영화별 상세 정보 크롤링 
def GetMoveInfo(code,filename) :
    code  = str(code)#코드가 문자열로 형변환.
    mURL  = "https://movie.naver.com/movie/bi/mi/basic.naver?code=" + code
    #print(mURL)
    agent = { "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36", "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" }    
    html  = requests.get(mURL,headers=agent).text #페이지 text정보를 html 로 넣어준다.
    soup  = BeautifulSoup(html, "html.parser")    

        
    #관람객 평점 추출 
    score = ObjGetText(soup, "#pointNetizenPersentBasic", "0") #0 default 값
    score = score.replace("관람객 평점","")
    #print("관람객 평점:",score)  
    
    #줄거리
    text = ObjGetStory(soup,"p.con_tx","내용없음") #내용없음 default값
    #print(text)
    
    #span 갯수가 4개이하인 경우는 자료 없음으로 처리 
    genre = "알수없음"
    time  = "0"
    age   = "알수없음"
    
    span_item = soup.select(".info_spec > dd > p > span")
    if len(span_item) >= 4 :       
        #장르
        genre = ObjGetText(soup,".info_spec > dd > p > span","알수없음")
        #print("장르:",genre)
        
        #러닝타임
        time = ObjGetText(soup,"p > span:nth-child(3)","0")
        #print("러닝타임:",time)
        
        #연령제한
        age  = ObjGetText(soup,".info_spec :nth-child(5)","알수없음")
        age = age.replace("도움","")
        #print("연령제한:",age)

    #포스터 이미지 
    img  = ObjGetText(soup,".poster > a > img","","src")
    #print("이미지:",img)
      
    #관람객(남자)
    gen_m , e_pos = GetGender(html,0)
    #print("남:" , gen_m)
    
    #관람객(여자)
    gen_w , e_pos = GetGender(html,e_pos)
    try :
        gen_w = 100 - gen_m
    except :
        gen_w = "없음"
    #print("여:" , gen_w)    
    
    
    #연령별 선호도 
    age_set = { "10" : 0, "20" : 0, "30" : 0, "40" : 0, "50" : 0 }
    obj = soup.select(".bar_graph > .graph_box:nth-child(-n+5)")[:5]
    html = ""
    for item in obj :
        data = item.getText()        
        if len(data) <= 0:
            continue
        data = data.replace("\r\n","")
        data = data.replace("\n","")
        data = data.replace("%",",")
        data = data.replace("대","")
        data = data.replace(" 이상","")
        data = data.strip()  
        list = data.split(",")
        #print(list)
        #print("-" * 30)
        age_set[list[1]] = int(list[0])
        #html += data
    #print(age_set)
    #print("=" * 30)
    
    file = open(filename,"a",encoding="utf-8")    
    SaveCSVValue(file,code)    
    SaveCSVValue(file,mURL)    
    SaveCSVValue(file,score)    
    SaveCSVValue(file,genre)
    SaveCSVValue(file,time)    
    #file.write(age + ",")    
    SaveCSVValue(file,img)    
    SaveCSVValue(file,gen_m)    
    SaveCSVValue(file,gen_w)    
    SaveCSVValue(file,age_set["10"])    
    SaveCSVValue(file,age_set["20"])    
    SaveCSVValue(file,age_set["30"])    
    SaveCSVValue(file,age_set["40"])    
    SaveCSVValue(file,age_set["50"])    
    SaveCSVValue(file,text, "\n")    
    file.close()          


#영화별 상세 정보크롤링을 위해 movie csv파일을 파이썬으로 읽어옴
file_path  = "./movie/movie.csv"
movie      = pd.read_csv(file_path,encoding="utf8")
movie_code = movie["영화코드"]

filename = "./data/movie_info_all.csv"

if os.path.isfile(filename):
    os.remove(filename)
  
SetMovieInfo(filename)
total = len(movie['영화코드'])
count = 1

for code in movie_code :
    print(count, "/", total, "진행중!")
    print("영화코드:" + str(code))
    GetMoveInfo(code,filename)
    count += 1

print("작업이 완료되었습니다!!!!!!!!!!!")    

review_info = pd.read_csv(filename,encoding="utf8",sep=",")


#print(df.head(10))
#movie__end = pd.concat([movie,review_info], axis=1)
    
#movie__end.to_csv("movie__end.csv",encoding="UTF-8")

