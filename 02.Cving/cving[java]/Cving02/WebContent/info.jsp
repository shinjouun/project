<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./config/config.jsp"%>
<%
UserVO LoginVO = (UserVO)session.getAttribute("login");
if(LoginVO == null)
{
	//�α����� ���� ������ login�������� �Ѱ��ش�.
	response.sendRedirect("login.jsp");
	return;
}

String code = request.getParameter("code");
if(code == null) // �ڵ尡 ���� �ڵ��.
{
	response.sendRedirect("index.jsp"); //�ٷ� ����������.
}
DBManager db = new DBManager();

db.DBOpen();

String sql = "";
sql  = "select mtitle, mhobby, mscore, mtime, openyear, makingyear, male, " ; 
sql += "female, teenage, twenty, thirty, forty, fifty, mstory, mimg " ;
sql += "from movie where mcode = " + code;

db.OpenQuery(sql);

db.GetNext(); // ���� ������.

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
sql = "select hobby from hobby where uno = " + LoginVO.getUno(); //hobby ���̺��� �α����� ���� vo�� ��ȣ�� uno�� ������ hobby�÷��� ������ �´�.
db.OpenQuery(sql);
String hobby = "";
while(db.GetNext())
{
	if(!hobby.equals("")) hobby += ","; 
	hobby += db.GetValue("hobby");
}
System.out.println("�� �帣:" + hobby);
String realhobby[] = hobby.split(","); //��ǥ�� �������� ���ڿ��� ������ �迭�� ������ش�.
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
		        mode: 'horizontal', // �����̵� ��� ('fade', 'horizontal', 'vertical' �� ����)
		        pager: true, // ������ ǥ�� ������
		        minSlides : 4,
		        maxSlides : 4,
		        slideMargin : 1,
		        slideWidth : 800,
		        moveSlides : 1,
		        infiniteLoop : false,
		        hideControlOnEnd: true,
		        caption: true,
			});
			//���� ��Ʈ
			new Chart(document.getElementById("doughnut-chart"),{
	    		type: 'doughnut',
	    		data:{
	    				labels: ["����","����"],
	    					
	      				datasets: [{
	          				label: "���� (%)",
				         	backgroundColor: ["#86C8FC","#FF7E5A"],
				        	borderColor:"gray",
				          	data: ['<%= male %>', '<%= female %>']
	        			}],
	    			},
				options:{
					legend: {
						position: "bottom",
						labels: {
				                // �� �� Ư���� ��Ʈ �Ӽ��� ���� �Ӽ��� ����ϴ�
			              	  fontColor: 'black'
			           		}
						},
					title:{
				        display: true,
				        text: '���� ��ȣ��',
				        fontColor: 'black',
				        
				       
				       			        
	      			},
	      			//�ִϸ��̼� ����
	      			animation: {
	      		        duration: 0
	      		    },
	      		    //�� ��Ʈ ������ġ 12�÷� �����
	      		    rotation :-1.5 * Math.PI,
	    		}
			});	
			//��  ��Ʈ
			new Chart(document.getElementById("bar-chart"), {
			    type: 'bar',
			    data: {
			      labels: ["10��", "20��", "30��", "40��", "50���̻�"],
			     	
			      datasets: [
			        {
			          //label: "���̺� (%)",
						backgroundColor: ["#f8a1a4", "#ffcca9","#fffa99","#98e0ad","#aaaeeb"],
						data: ['<%= teenage %>','<%= twenty %>','<%= thirty %>','<%= forty %>','<%= fifty %>']
			        }
			      ]
			    },
			    options: {
			      legend: { display: false },
			      title: {
			        display: true,
			        text: '���̺� ��ȣ��',
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
				alert("�˻�� �Է��ϼ���!");
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
					<a href="./logout.jsp">�α׾ƿ�</a>
				</div>				
				<div class="search">
					<input type="text" id="search" name="search" placeholder=" ���� �帣 �˻� �غ����� ">
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
					<!-- ��ȭ���� -->
					<div class="info_moviename">
						<font class="info_maintext"><b><%= mtitle %></b></font>
					</div>
					<!-- ��ȭ���� �� �帣 �� -->
					<div class="info_total">
						<font class="info_subtext_1">
							����( <%= mscore %> ) | <%= mhobby %> | �ð�( <%= mtime %>��) 
						</font>
					</div>
					<div class="info_year">
						<font class="info_subtext_2">
							���� : <%= openyear %> | ���� : <%= makingyear %>
						</font>
					</div>
					<!-- ��ȭ �ٰŸ� -->
					<div class="info_summary">
						<font class="info_subtext_3"><b>�ٰŸ�</b></font>
						<div class="info_textdiv">
							<font class="info_summarytext">
								<%= mstory %>
 							</font>
						</div>
					</div>
					<!-- ���� ���̺� ���� ���� -->
					<div class="info_hobby">
						<font class="info_subtext"><b>���� ���̺� ���� ����</b></font>
						<div class="info_hobbylist">
							<!-- ���� �׷��� ǥ�úκ� -->
							<div class="info_gender">
							<%
							if(male.equals("0") && female.equals("0"))
							{
								%>
								&nbsp;&nbsp;���� �����Ͱ� �����ϴ�.
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
							<!-- ���̺� �׷��� ǥ�úκ� -->
							<div class="info_age">
							<%
							if(twenty.equals("0") && thirty.equals("0") && forty.equals("0") && fifty.equals("0"))
							{
								%>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���̺� �����Ͱ� �����ϴ�.
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
				<h1>[ <%= LoginVO.getUname() %> ]���� �����ϽǸ��� �ٸ� �帣 ��ȭ ��õ</h1>
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
				System.out.println("������� ��õ�帣 : " + new_hobby);
				db.CloseQuery();
				
				String hobby_list[] = new_hobby.split(",");
				
				sql = "select mcode,mhobby,mscore,mimg  from( ";
				sql += "select mcode, mhobby, mscore, mimg from movie ";
				sql += "where 1=1 "; //������ �� 
				sql += "and mscore < 9.50 "; //����9.50���� ������
				sql += "and mscore > 8.30 ";
				sql += "and used = 'Y' "; //��ȭ�� �������� ��ȭ���� ..
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
				sql += "limit 0, 4 ";//�������� ���� ������������ 
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
					��Ī: �ֽ�ȸ�� ���� | ��Ϲ�ȣ: ���� ��4048 | ��Ͽ�����: 2022. 10. 14 | ��ȣ: CVING<br>
					����: C team  | �����: ����ϵ� ���ֽ� ������ �ݾϵ� ������ǻ���п� 4�� 407ȣ<br>
					CVING�� �������� ���۱ǹ��� ��ȣ�� �����Ƿ�, ���� ����, ����, ���� ���� ���մϴ�.<br>
				</article>
			</footer>
		</div>
	</body>
</html>
<%
db.DBClose();
%>