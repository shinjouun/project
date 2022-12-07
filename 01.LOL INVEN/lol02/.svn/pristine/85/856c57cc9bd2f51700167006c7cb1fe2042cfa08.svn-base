<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/mainhead.jsp" %>
<script>
	var ageArr = new Array();
	window.onload = function()
	{
		PrintList();
		
		$("#btn_delete").click(function(){
		
			//삭제 버튼을 누르면 체크박스를 배열로 얻어와서 그 크기만큼 반복문을 실행한다.
			var checked_value = "";
		
			$("input:checkbox[name='check_cpno']").each(function()
			{				
				if(this.checked == true)
				{
					if(checked_value != "") checked_value += ",";
					checked_value += this.value;
					//checked_value = checked_value + this.value;
				}
			});
			
			if(confirm("정말 삭제 하시겠습니까?"))
			{
				window.open("../admin/cpdelete.jsp?cpno=" + checked_value, "_cpdelete",
				"width=600,height=550");	
			}
		});
		
		$("#key").keyup(function(){
			PrintList();
		});
	}
	
	function DoCpAdd()
	{
		window.open("../admin/cpadd.jsp", "_cpadd",
		"width=600,height=550");	
	}
	
	
	function DoCpDelete()
	{
		window.open("../admin/cpdelete.jsp", "_cpadd",
		"width=600,height=550");
	}
	
	//매개변수 받아오는 값 순cpno, cpstdimg, cpkname, cpename, cpinfo
	//마우스 over시 발동되는 메소드
	
	function DoDetail(cpno, img, name, ename, info)
	{
		//메소드가 실행되면 div가 보여지게함
		$.ajax({
				type : "get",
				url: "../champion/position.jsp?cpno=" + cpno,
				dataType: "html",
				success : function(data)
				{	
					// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.	
					data = data.trim();
					$("#cpdetail").css("display","");
					$("#td_name").html(name);
					$("#td_ename").html(ename);
					$("#td_info").html(info);
			
					$("#td_position").html(data);
					$("#td_position").css("color","lightgray");
					$("#td_img").attr("src","../upload/"+img);
					//마우스가 움직일때 따라다니는 코드
				},
				error : function(xhr, status, error) 
				{
					// 통신 오류 발생시
				}
			});
		
		$(document).mousemove(
				function(e) {
			      mouseX = e.pageX;
			      mouseY = e.pageY;
			      $('#cpdetail').css("left", mouseX+15).css("top", mouseY+15);
			 });
			
			//마우스가 떠나면 보이지 않게함.
			$(this).mouseleave(
				function()
				{
					$("#cpdetail").css("display","none");
				}		
			);
	}
	
	//챔피언 목록 테이블을 출력한다.
	function PrintList()
	{
		checked_value = "";
		$("input:checkbox[name='search_pos']").each(function()
		{				
			if(this.checked == true)
			{
				if(checked_value != "") checked_value += ",";
				checked_value += this.value;
			}
		});
		//alert(checked_value);
		
		var key = $("#key").val();
		
		
		$.ajax({
			type : "get",
			url: "sublist.jsp?key=" + key + "&pos=" + checked_value,
			dataType: "html",
			success : function(data)
			{	
				// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.	
				data = data.trim();
				$("#cpList").html(data);
			},
			error : function(xhr, status, error) 
			{
				// 통신 오류 발생시
			}
		});		
	}
</script>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<table  class="inner" border="0" style="width:100%;">
	<tr>
		<td>챔피언 목록입니다.</td>
		<%
		if(loginVO != null && loginVO.getUadmin().equals("A"))
		{
			%>
			<td align="center"><a href="javascript:DoCpAdd();">챔피언 추가</a></td>
			<td align="center"><a href="#" id="btn_delete">챔피언 삭제</a></td>
			<%		
		}
		%>
	</tr>
</table>
<div class= "inner_a">
	<table border="0" style="width:100%;">
		<tr>
			<td><a>역할필터</a></td>
		</tr>
		<tr>
			<td align="center" >
			<input type="checkbox" id="search_pos" name="search_pos" value="전사" onchange="PrintList();">&nbsp;&nbsp;전사&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" id="search_pos" name="search_pos" value="마법사" onchange="PrintList();">&nbsp;&nbsp;마법사&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" id="search_pos" name="search_pos" value="원거리" onchange="PrintList();">&nbsp;&nbsp;원거리
			</td>
		</tr>
		<tr>
			<td  class="search" align="right">			
			<input type="text" id="key" name="key" size="10" value=""> <a href="../champion/cplist.jsp">초기화</a>
			</td>
		</tr>	
	</table>
</div>
<div class="divnull">
	<br>
</div>
<form id="frmDelete" name="frmDelete" method="post" action="../admin/cpdelete.jsp">
</form>
<table border="0" style="width:100%;height:600px;">
	<tr>
		<td valign="top" style="background-color:#fafafa;"><div id="cpList"></div></td>
	</tr>
</table>
<div id="cpdetail" style="display:none; width:500px;">
<table border="0" style="background-color:black;">
 	<tr>
 		<td rowspan="3" style="width:30px;"><img id="td_img" src=""></td>
 		<td id="td_name" style="color:#F6700E;"></td>
 	</tr>
 	<tr>
 		<td id="td_ename" style="color:#8eb3b8;"></td>
 	</tr>
 	<tr>
 		<td id="td_position" style="color:#white;"></td>
 	</tr>
 	<tr>
 		<td colspan="2" id="td_info" style="color:#a0acbd;"></td>
 	</tr>
</table>
</div>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="../include/maintail.jsp" %>
