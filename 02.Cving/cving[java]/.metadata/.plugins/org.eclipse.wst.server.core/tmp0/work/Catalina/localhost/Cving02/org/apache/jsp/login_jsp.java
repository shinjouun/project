/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.51
 * Generated at: 2022-11-16 06:45:14 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t<meta charset=\"EUC-KR\">\r\n");
      out.write("\t<title>CVING</title>\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/cving.css\">\r\n");
      out.write("\t<script src=\"./jquery-3.6.0.js\"></script>\r\n");
      out.write("\t</head>\r\n");
      out.write("\t\r\n");
      out.write("\t<script>\r\n");
      out.write("\twindow.onload = function()\r\n");
      out.write("\t{\r\n");
      out.write("\t\t$(\"#btn_login\").click(function(){\r\n");
      out.write("\t\t\tDoLogin();\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#btn_join\").click(function(){\r\n");
      out.write("\t\t\tdocument.location = \"./join.jsp\";\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"input\").keyup(function(e){\r\n");
      out.write("\t\t\tif(e.keyCode == 13) //13?????????\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tDoLogin();\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction DoLogin()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif($(\"#id\").val()== \"\")\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"???????????? ???????????????\");\r\n");
      out.write("\t\t\t$(\"#id\").focus();\r\n");
      out.write("\t\t\treturn;\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif($(\"#pw\").val() == \"\")\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"??????????????? ???????????????\");\r\n");
      out.write("\t\t\t$(\"#pw\").focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t$(\"#login\").submit();\r\n");
      out.write("\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"login_box\">\r\n");
      out.write("\t\t\t\t<div class=\"login_in\">\r\n");
      out.write("\t\t\t\t\t<img src=\"./img/logoback.png\" style=\"width:250px; height:100px; margin-left:120px;\">\r\n");
      out.write("\t\t\t\t\t<form id=\"login\" name=\"login\" method=\"post\" action=\"./loginok.jsp\">\r\n");
      out.write("\t\t\t\t\t\t<div align=\"center\" style=\"margin-top:20px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"id\" name=\"id\" placeholder=\"?????????\"\r\n");
      out.write("\t\t\t\t\t\t\t\tmaxlength=\"15\" value=\"\" style=\"height:35px; width:350px;\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t\t<div align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"password\" id=\"pw\" name=\"pw\" placeholder=\"????????????\"\r\n");
      out.write("\t\t\t\t\t\t\t\tmaxlength=\"16\" style=\"height:35px; width:350px;\" >\r\n");
      out.write("\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t\t    <br><br><br>\r\n");
      out.write("\t\t\t\t\t\t<div align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"button\" id=\"btn_login\" name=\"btn_login\" value=\"????????? ??????\"\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"height:30px; width:360px;\" >\r\n");
      out.write("\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t    <br>\r\n");
      out.write("\t\t\t\t\t\t<div align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"button\" id=\"btn_join\" name=\"btn_login\" id=\"btn_login\" value=\"???????????? ??????\"\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"height:30px; width:360px;\">\r\n");
      out.write("\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div> \r\n");
      out.write("\t\t\t<footer>\r\n");
      out.write("\t\t\t\t<article class=\"foot_menu\">\r\n");
      out.write("\t\t\t\t \t<hr style=\"background-color:white;\">\r\n");
      out.write("\t\t\t\t\t??????: ???????????? ?????? | ????????????: ?????? ???4048 | ???????????????: 2022. 10. 14 | ??????: CVING<br>\r\n");
      out.write("\t\t\t\t\t??????: C team  | ?????????: ???????????? ????????? ????????? ????????? ????????????????????? 4??? 407???<br>\r\n");
      out.write("\t\t\t\t\tCVING??? ???????????? ??????????????? ????????? ????????????, ?????? ??????, ??????, ?????? ?????? ????????????.<br>\r\n");
      out.write("\t\t\t\t</article>\r\n");
      out.write("\t\t\t</footer>\r\n");
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
