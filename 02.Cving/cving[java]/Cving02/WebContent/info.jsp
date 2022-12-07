<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./config/config.jsp"%>
<%
UserVO LoginVO = (UserVO)session.getAttribute("login");
if(LoginVO == null)
{
	//로그인을 하지 않으면 login페이지로 넘겨준다.
	response.sendRedirect("login.jsp");
	return;
}

String code = request.getParameter("code");
if(code == null) // 코드가 없는 코드다.
{
	response.sendRedirect("index.jsp"); //바로 보내버린다.
}
DBManager db = new DBManager();

db.DBOpen();

String sql = "";
sql  = "select mtitle, mhobby, mscore, mtime, openyear, makingyear, male, " ; 
sql += "female, teenage, twenty, thirty, forty, fifty, mstory, mimg " ;
sql += "from movie where mcode = " + code;

db.OpenQuery(sql);

db.GetNext(); // 값을 가져옴.

String mtitle = db.GetValue("mtitle");
String mhobby = db.GetValue("mhobby");
String mscore = db.GetValue("mscore");
String mtime = db.GetValue("mtime");
String openyear = db.GetValue("openyear");
String makingyear = db.GetValue("makingyear");
String male = db.GetValue("male");
String female = db.GetValue("female");
String teenage = db.GetValue("teenage");
String twenty = db.GetValue("twenty");
String thirty = db.GetValue("thirty");
String forty = db.GetValue("forty");
String fifty = db.GetValue("fifty");
String mstory = db.GetValue("mstory");
mstory = mstory.replace("?", "<br>");
String mimg = db.GetValue("mimg");

db.CloseQuery();

sql = "";
sql = "select hobby from hobby where uno = " + LoginVO.getUno(); //hobby 테이블에 로그인한 유저 vo의 번호와 uno가 맞으면 hobby컬럼을 가지고 온다.
db.OpenQuery(sql);
String hobby = "";
while(db.GetNext())
{
	if(!hobby.equals("")) hobby += ","; 
	hobby += db.GetValue("hobby");
}
System.out.println("내 장르:" + hobby);
String realhobby[] = hobby.split(","); //쉼표를 기준으로 문자열을 나눠서 배열을 만들어준다.
db.CloseQuery();
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>CVING</title>
	<link rel="stylesheet" href="css/cving.css">
	<script src="./jquery-3.6.0.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script>
		$(document).ready(function(){
			$("input").keyup(function(e){
				if(e.keyCode == 13)
				{
					DoSearch();
				}
			});
			
			$("#btn_search").click(function(){
				DoSearch();
			});
			
			$('.slider').bxSlider({
		        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
		        pager: true, // 페이지 표시 보여짐
		        minSlides : 4,
		        maxSlides : 4,
		        slideMargin : 1,
		        slideWidth : 800,
		        moveSlides : 1,
		        infiniteLoop : false,
		        hideControlOnEnd: true,
		        caption: true,
			});
			//도넛 차트
			new Chart(document.getElementById("doughnut-chart"),{
	    		type: 'doughnut',
	    		data:{
	    				labels: ["남자","여자"],
	    					
	      				datasets: [{
	          				label: "성별 (%)",
				         	backgroundColor: ["#86C8FC","#FF7E5A"],
				        	borderColor:"gray",
				          	data: ['<%= male %>', '<%= female %>']
	        			}],
	    			},
				options:{
					legend: {
						position: "bottom",
						labels: {
				                // 이 더 특정한 폰트 속성은 전역 속성을 덮어씁니다
			              	  fontColor: 'black'
			           		}
						},
					title:{
				        display: true,
				        text: '성별 선호도',
				        fontColor: 'black',
				        
				       
				       			        
	      			},
	      			//애니메이션 제거
	      			animation: {
	      		        duration: 0
	      		    },
	      		    //원 차트 시작위치 12시로 만들기
	      		    rotation :-1.5 * Math.PI,
	    		}
			});	
			//바  차트
			new Chart(document.getElementById("bar-chart"), {
			    type: 'bar',
			    data: {
			      labels: ["10대", "20대", "30대", "40대", "50대이상"],
			     	
			      datasets: [
			        {
			          //label: "나이별 (%)",
						backgroundColor: ["#f8a1a4", "#ffcca9","#fffa99","#98e0ad","#aaaeeb"],
						data: ['<%= teenage %>','<%= twenty %>','<%= thirty %>','<%= forty %>','<%= fifty %>']
			        }
			      ]
			    },
			    options: {
			      legend: { display: false },
			      title: {
			        display: true,
			        text: '나이별 선호도',
			        fontColor: 'black'
			      },
			      animation: {
	      		        duration: 0
	      		    },
			      scales: {
						yAxes: [{
							display: true,
							ticks: {
								suggestedMax: 100,    // minimum will be 0, unless there is a lower value.
								// OR //
								beginAtZero: true   // minimum value will be 0.
							}
						}]
					},
			    }
			});
		});
		
		function DoSearch()
		{
			if($("#search").val() == "")
			{
				alert("검색어를 입력하세요!");
				$("#search").foucus();
				return;
			}
			document.location = "search.jsp?key=" + $("#search").val();
		}
	</script>
	<body>
		<div class="container">
			<header id = "header">
				<div class="logo">
					<a href="./index.jsp">
					<img src="./img/logoback.png" style="width:100%; height:100%;">
					</a>
				</div>
				<div class="logout">
					<a href="./logout.jsp">로그아웃</a>
				</div>				
				<div class="search">
					<input type="text" id="search" name="search" placeholder=" 제목 장르 검색 해보세요 ">
				</div>
				<div class="b_search">
					<img src="./img/search.png">
				</div>
			</header>
			<div class="info_top">
				<div class="info_post">
					<img src="<%= mimg %>">
				</div>
				<div>
					<!-- 영화제목 -->
					<div class="info_moviename">
						<font class="info_maintext"><b><%= mtitle %></b></font>
					</div>
					<!-- 영화평점 및 장르 등 -->
					<div class="info_total">
						<font class="info_subtext_1">
							평점( <%= mscore %> ) | <%= mhobby %> | 시간( <%= mtime %>분) 
						</font>
					</div>
					<div class="info_year">
						<font class="info_subtext_2">
							개봉 : <%= openyear %> | 제작 : <%= makingyear %>
						</font>
					</div>
					<!-- 영화 줄거리 -->
					<div class="info_summary">
						<font class="info_subtext_3"><b>줄거리</b></font>
						<div class="info_textdiv">
							<font class="info_summarytext">
								<%= mstory %>
 							</font>
						</div>
					</div>
					<!-- 성별 나이별 관람 추이 -->
					<div class="info_hobby">
						<font class="info_subtext"><b>성별 나이별 관람 추이</b></font>
						<div class="info_hobbylist">
							<!-- 성별 그래프 표시부분 -->
							<div class="info_gender">
							<%
							if(male.equals("0") && female.equals("0"))
							{
								%>
								&nbsp;&nbsp;성별 데이터가 없습니다.
								<%
							}
							else
							{
								%>
								<canvas id="doughnut-chart" width="300" height="273" style="background-color:#cccccce6;"></canvas>
								<%
							}
							%>
							</div>
							<!-- 나이별 그래프 표시부분 -->
							<div class="info_age">
							<%
							if(twenty.equals("0") && thirty.equals("0") && forty.equals("0") && fifty.equals("0"))
							{
								%>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나이별 데이터가 없습니다.
								<%
							}
							else
							{
								%>
								<canvas id="bar-chart" width="300" height="170" style="background-color:#cccccce6;"></canvas>
								<%
							}
							%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="margin-top:200px; margin-left:20px;">
				<h1>[ <%= LoginVO.getUname() %> ]님이 좋아하실만한 다른 장르 영화 추천</h1>
			</div>
			<div id="wrap" style="margin-top:30px; width:100%; height:300px; display:flex;">
				<%
				String gender = "";
				String age = "";
				
				age = LoginVO.getUage();
				
				if(LoginVO != null && LoginVO.getUgender().equals("M"))
				{
					gender = "male";
				}else if(LoginVO != null && LoginVO.getUgender().equals("W"))
				{
					gender = "female";
				}
				sql = "select sum(x." +gender +") as gender,sum(x." +age + ") as age,y.mhobby ";
				sql += "from movie x inner join genre y ";
				sql +="on x.mcode = y.mcode ";
				sql +="group by y.mhobby "; 
				sql +="order by gender desc, age desc ";
				//System.out.print(subsql);
				
				db.OpenQuery(sql);
				String new_hobby = "";
				int count = 0;
				
				while(db.GetNext())
				{	
					if(hobby.indexOf(db.GetValue("mhobby")) > -1)
					{
						continue;
					}
					else
					{
						if(!new_hobby.equals(""))
							new_hobby += ",";
						
						new_hobby += db.GetValue("mhobby");
						count++;
						if( count == 3)
							break;
					}
					
				}
				System.out.println("만들어진 추천장르 : " + new_hobby);
				db.CloseQuery();
				
				String hobby_list[] = new_hobby.split(",");
				
				sql = "select mcode,mhobby,mscore,mimg  from( ";
				sql += "select mcode, mhobby, mscore, mimg from movie ";
				sql += "where 1=1 "; //무조건 참 
				sql += "and mscore < 9.50 "; //평점9.50보다 작은거
				sql += "and mscore > 8.30 ";
				sql += "and used = 'Y' "; //영화가 정상적인 영화인지 ..
				if(gender.equals("male"))
				{
					sql += "and male > female ";
					//sql += "and male < 100 "; 
				}else
				{
					sql += "and male < female ";
					//sql += "and female < 100 ";
				}
				sql += "and " + age + " > 30 ";
				String sub_sql = "";
				
				for(int i = 0; i < hobby_list.length; i++)
				{
					if( !sub_sql.equals(""))
					{
						sub_sql += " or ";
					}
					sub_sql +=  " mhobby in (select mhobby from genre where mhobby like '%"+ hobby_list[i] +"%') ";
				}
				if( !sub_sql.equals(""))
				{
					sql += "and(" + sub_sql + ") ";
				}
				sql += "order by rand() limit 0, 100 ) x ";
				sql += "limit 0, 4 ";//점수기준 평점 내림차순으로 
				db.OpenQuery(sql);
				while(db.GetNext())
				{
					String mcode = db.GetValue("mcode");
					mimg = db.GetValue("mimg");
					%>
					<div class="m_imgin" style="padding:0px 0px 100px 0px;">
						<a href="info.jsp?code=<%= mcode %>"><img src="<%= mimg %>"></a>
					</div>
					<%
				}
				db.CloseQuery();
				%>
			</div>
			<footer>
				<article class="foot_menu">
				 	<hr style="background-color:white;">
					명칭: 주식회사 이젠 | 등록번호: 전북 소4048 | 등록연월일: 2022. 10. 14 | 제호: CVING<br>
					발행: C team  | 발행소: 전라북도 전주시 덕진구 금암동 이젠컴퓨터학원 4층 407호<br>
					CVING의 콘텐츠는 저작권법의 보호를 받으므로, 무단 전재, 복사, 배포 등을 금합니다.<br>
				</article>
			</footer>
		</div>
	</body>
</html>
<%
db.DBClose();
%>