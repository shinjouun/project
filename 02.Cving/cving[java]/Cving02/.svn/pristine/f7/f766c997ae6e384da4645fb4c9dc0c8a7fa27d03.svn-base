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
request.setCharacterEncoding("euc-kr");

String key = request.getParameter("key");

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>search</title>
		<link rel="stylesheet" href="css/cving.css">
		<script src="./jquery-3.6.0.js"></script>
	</head>
	<script>
		window.onload = function()
		{
			$("input").keyup(function(e){
				if(e.keyCode == 13)
				{
					DoSearch();
				}
			});
			
			$("#btn_search").click(function(){
				DoSearch();
			});
		}
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
					<img src="./img/logoback.png" style="width: 100%; height: 100%;">
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
			<section class="search_movie">
			</section>
			<div id="wrap">
			<div class="m_imgin" style="padding:50px 0px 100px 0px;">
			<h1>'<%= key %>'(이)가 포함된 장르별 검색 결과</h1>
			<%
			
			DBManager db = new DBManager();
			db.DBOpen();
			String sql = "";
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
			
			sql = "";
			sql  = "select mimg, mcode  from (select mimg, mcode from movie ";
			sql += "where used = 'Y' and mtitle like + '%"+ key +"%' ";
			sql += "order by rand() limit 0, 100 ) x limit 0, 8 ";
			int count = 1;
			boolean isCheckData = false;
			db.OpenQuery(sql);
			while(db.GetNext()) //여러줄을 가져와야해서 while반복문을 써서 계속 가져오게 하는것 
			{
				isCheckData = true;
				String mimg = db.GetValue("mimg");
				String mcode = db.GetValue("mcode");
				mimg = mimg.replace("https://movie-phinf.pstatic.net","");
				mimg = "./img/" + mimg.replace("/","_");
				if(mimg.equals("없음"))
				{
					%>
					<a href="./info.jsp?code=<%= mcode %>"><img src="./img/img_null.png"></a>
					<%
				}
				else
				{
					%>
					<a href="./info.jsp?code=<%= mcode %>"><img src="<%= mimg %>"></a>
					<%
				}
				if(count % 4 == 0)
				{
					%>
					</div>
					<div class="m_imgin" style="padding:50px 0px 100px 0px;">
					<%
				}
				count++;
			}
			db.CloseQuery();
			
			if(isCheckData == false)
			{
				%>
				<div align="center">'<%= key %>'로검색된 데이터가 없습니다</div>
				<%
			}
			%>
			
			
			
			<h1>'<%= key %>'(이)가 포함된 장르별 검색 결과</h1>
			<%
			
			sql = "";
			sql  = "select mimg, mcode  from (select mimg, mcode from movie ";
			sql += "where used = 'Y' and mhobby like + '%"+ key +"%' ";
			sql += "order by rand() limit 0, 100 ) x limit 0, 8 ";
			int con = 1;
			boolean isCheckhobby = false;
			db.OpenQuery(sql);
			while(db.GetNext()) //여러줄을 가져와야해서 while반복문을 써서 계속 가져오게 하는것 
			{
				isCheckhobby = true;
				String mimg = db.GetValue("mimg");
				String mcode = db.GetValue("mcode");
				mimg = mimg.replace("https://movie-phinf.pstatic.net","");
				mimg = "./img/" + mimg.replace("/","_");
				if(mimg.equals("없음"))
				{
					%>
					<a href="./info.jsp?code=<%= mcode %>"><img src="./img/img_null.png"></a>
					<%
				}
				else
				{
					%>
					<a href="./info.jsp?code=<%= mcode %>"><img src="<%= mimg %>"></a>
					<%
				}
				if(con % 4 == 0)
				{
					%>
					</div>
					<div class="m_imgin" style="padding:50px 0px 100px 0px;">
					<%
				}
				con++;
			}
			db.CloseQuery();
			
			if(isCheckhobby == false)
			{
				%>
				<div align="center">'<%= key %>'로검색된 데이터가 없습니다</div>
				<%
				String gen = "";
				if(LoginVO.getUgender().equals("M"))
				{
					gen = "남성";
				}else
				{
					gen = "여성";
				}
				%>
				</div>
				<h1>[ <%= LoginVO.getUname() %> ]님이 좋아하실만한 다른 장르 영화 추천</h1>
				<div id="wrap" style="margin-top:30px; width:100%; height:300px; display:flex;">
					<%
					String gender = "";
					String age = "";
					
					if(LoginVO != null && LoginVO.getUage().equals("10"))
					{
						age = "teenage";
					}else if(LoginVO != null && LoginVO.getUage().equals("20"))
					{
						age = "twenty";
					}else if(LoginVO != null && LoginVO.getUage().equals("30"))
					{
						age = "thirty";
					}else if(LoginVO != null && LoginVO.getUage().equals("40"))
					{
						age = "forty";
					}else if(LoginVO != null && LoginVO.getUage().equals("50"))
					{
						age = "fifty";
					}
					if(LoginVO != null && LoginVO.getUgender().equals("M"))
					{
						gender = "male";
					}else if(LoginVO != null && LoginVO.getUgender().equals("W"))
					{
						gender = "female";
					}
					String subsql = "select sum(x." +gender +") as gender,sum(x." +age + ") as age,y.mhobby ";
					subsql+= "from movie x inner join genre y ";
					subsql+="on x.mcode = y.mcode ";
					subsql+="group by y.mhobby "; 
					subsql+="order by gender desc, age desc ";
					//System.out.print(subsql);
					
					db.OpenQuery(subsql);
					String new_hobby = "";
					int hit = 0;
					
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
							if( hit == 3)
								break;
						}
						
					}
					System.out.println("만들어진 추천장르 : " + new_hobby);
					db.CloseQuery();
					
					String hobby_list[] = new_hobby.split(",");
					for(int i = 0; i < hobby_list.length; i++)
					{
						
						System.out.println(hobby_list[i]);
					}
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
						String mimg = db.GetValue("mimg");
						%>
						<div class="m_imgin" style="padding:0px 0px 100px 0px;">
							<a href="info.jsp?code=<%= mcode %>"><img src="<%= mimg %>"></a>
						</div>
						<%
					}
					db.CloseQuery();
			}
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
		</div>
	</body>
</html>
<% 
db.DBClose();
%>