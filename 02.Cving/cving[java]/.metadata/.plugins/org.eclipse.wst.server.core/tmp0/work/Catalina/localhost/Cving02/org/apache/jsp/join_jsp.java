/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.51
 * Generated at: 2022-12-05 03:13:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class join_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write(" \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<meta charset=\"EUC-KR\">\r\n");
      out.write("\t\t<title>join</title>\r\n");
      out.write("\t\t<script src=\"./jquery-3.6.0.js\"></script>\r\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"css/cving.css\">\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<script>\r\n");
      out.write("\tvar isCheckID = false;\r\n");
      out.write("\tvar isCheckPW = false;\r\n");
      out.write("\twindow.onload = function()\r\n");
      out.write("\t{\r\n");
      out.write("\t\t$(\"#user_ID\").focus();\r\n");
      out.write("\t\t// 아이디 중복체크 버튼\r\n");
      out.write("\t\t$(\"#btn_IDcheck\").click(function(){//  실시간하는것!\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\ttype : \"get\",\r\n");
      out.write("\t\t\t\turl: \"./idcheck.jsp?id=\" + $(\"#user_ID\").val(),\r\n");
      out.write("\t\t\t\tdataType: \"html\",\r\n");
      out.write("\t\t\t\tsuccess : function(data)\r\n");
      out.write("\t\t\t\t{\t\r\n");
      out.write("\t\t\t\t\t// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.\t\r\n");
      out.write("\t\t\t\t\tdata = data.trim();\r\n");
      out.write("\t\t\t\t\tif(data == \"SUCESS\")\r\n");
      out.write("\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\tisCheckID = true;\r\n");
      out.write("\t\t\t\t\t\talert(\"사용할 수 있는 아이디입니다\");\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\telse\r\n");
      out.write("\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\tisCheckID = false;\r\n");
      out.write("\t\t\t\t\t\talert(\"중복된 아이디입니다.\");\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t},\r\n");
      out.write("\t\t\t\terror : function(xhr, status, error) \r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t// 통신 오류 발생시\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t//비밀번호 확인 버튼\r\n");
      out.write("\t\t$(\"#btn_PWcheck\").click(function(){\r\n");
      out.write("\t\t\tif($(\"#user_PW1\").val() == $(\"#user_PW2\").val())\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tisCheckPW = true; \r\n");
      out.write("\t\t\t\talert(\"비밀번호가 일치합니다.\");\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"비밀번호가 일치하지 않습니다.\");\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t//회원가입 버튼\r\n");
      out.write("\t\t$(\"#btn_join\").click(function(){\r\n");
      out.write("\t\t\tDoCheckJoin();\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction DoCheckJoin()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif($(\"#user_ID\").val() == \"\")\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"아이디를 입력하세요\");\t\r\n");
      out.write("\t\t\t$(\"#user_ID\").focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\t\t\t\r\n");
      out.write("\t\tif($(\"#user_PW1\").val() == \"\")\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"비밀번호 입력하세요\");\t\r\n");
      out.write("\t\t\t$(\"#user_PW1\").focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\t\t\t\r\n");
      out.write("\t\tif($(\"#user_PW2\").val() == \"\")\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"비밀번호 입력하세요\");\t\r\n");
      out.write("\t\t\t$(\"#user_PW2\").focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\t\t\t\r\n");
      out.write("\t\tif($(\"#user_name\").val() == \"\")\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"이름을 입력하세요\");\t\r\n");
      out.write("\t\t\t$(\"#user_name\").focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\t\t\t\r\n");
      out.write("\t\tif($(\"#birth\").val() == \"\")\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"생년월일을 입력하세요\");\t\r\n");
      out.write("\t\t\t$(\"#birth\").focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(isCheckID == false)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"아이디 중복검사를 해주세요!\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(isCheckPW == false)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"비밀번호 중복검사를 해주세요!\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(!$('input[name=gender]').is(\":checked\"))\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"성별을 선택해주세요!\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(confirm(\"회원가입을 하시겠습니까?\") == 1)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif(isCheckID == true && isCheckPW == true )\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\t$(\"#join\").submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<a href=\"./login.jsp\"><img src=\"./img/logoback.png\" style=\" position:absolute;  width:150px; height:80px; top:30px; left:50px; \"></a>\r\n");
      out.write("\t\t\t<section class=\"join_title\">\r\n");
      out.write("\t\t\t\t<h1>회원가입</h1>\r\n");
      out.write("\t\t\t</section>\r\n");
      out.write("\t\t\t<section class=\"join_section\">\r\n");
      out.write("\t\t\t\t<form name=\"join\" method=\"post\" id=\"join\" action=\"joinok.jsp\">\r\n");
      out.write("\t\t\t\t\t<div class=\"join_list\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"join_textbox1\" id=\"user_ID\" name=\"user_ID\" placeholder=\"아이디 입력\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"button\" class=\"btn_joinbox\" id=\"btn_IDcheck\" name=\"btn_IDcheck\" value=\"아이디 확인\">\r\n");
      out.write("\t\t\t\t\t\t<br><br>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"password\" class=\"join_textbox2\" id=\"user_PW1\" name=\"user_PW1\"\r\n");
      out.write("\t\t\t\t\t\t\t placeholder=\"비밀번호 입력\">\r\n");
      out.write("\t\t\t\t\t\t<br><br>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"password\" class=\"join_textbox1\" id=\"user_PW2\" name=\"user_PW2\"\r\n");
      out.write("\t\t\t\t\t\t \tplaceholder=\"비밀번호 재입력\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"button\" class=\"btn_joinbox\" id=\"btn_PWcheck\" name=\"btn_PWcheck\" value=\"비밀번호 확인\">\r\n");
      out.write("\t\t\t\t\t\t<br><br>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"join_textbox2\" id=\"user_name\" name=\"user_name\" placeholder=\"이름\">\r\n");
      out.write("\t\t\t\t\t\t<br><br>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"join_textbox2\" id=\"birth\" name=\"birth\"placeholder=\"생년월일 (YYYYMMDD)\" \r\n");
      out.write("\t\t\t\t\t\t\toninput=\"this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\\..*)\\./g, '$1');\" />\r\n");
      out.write("\t\t\t\t\t\t<br><br>\r\n");
      out.write("\t\t\t\t\t\t<!-- 라디오 박스 div 묶어놓음 -->\r\n");
      out.write("\t\t\t\t\t\t<div class=\"join_radio\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"radio\" name=\"gender\" value=\"M\" id=\"gender\">\r\n");
      out.write("\t\t\t\t\t\t\t<label for=\"man\">남자</label>\r\n");
      out.write("\t\t\t\t\t\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"radio\" name=\"gender\" value=\"W\" id=\"gender\">\r\n");
      out.write("\t\t\t\t\t\t\t<label for=\"woman\">여자</label>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<br><br>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"btn_join\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"button\" id=\"btn_join\" name=\"btn_join\" value=\"회원가입\">\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</section>\r\n");
      out.write("\t\t<footer>\r\n");
      out.write("\t\t\t<article class=\"foot_menu\">\r\n");
      out.write("\t\t\t\t<hr style=\"background-color:white;\">\r\n");
      out.write("\t\t\t\t명칭: 주식회사 이젠 | 등록번호: 전북 소4048 | 등록연월일: 2022. 10. 14 | 제호: CVING<br>\r\n");
      out.write("\t\t\t\t발행: C team  | 발행소: 전라북도 전주시 덕진구 금암동 이젠컴퓨터학원 4층 407호<br>\r\n");
      out.write("\t\t\t\tCVING의 콘텐츠는 저작권법의 보호를 받으므로, 무단 전재, 복사, 배포 등을 금합니다.<br>\r\n");
      out.write("\t\t\t</article>\r\n");
      out.write("\t\t</footer>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}