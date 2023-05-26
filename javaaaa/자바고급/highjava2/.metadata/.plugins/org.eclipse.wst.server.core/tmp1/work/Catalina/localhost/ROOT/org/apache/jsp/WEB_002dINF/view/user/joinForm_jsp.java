/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.59
 * Generated at: 2023-05-26 08:19:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class joinForm_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<title>RedApp</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://moku.store/css/fonts.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath() );
      out.write("/css/register.css\">\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.4.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"wrapper\">\r\n");
      out.write("<div class=\"register\">\r\n");
      out.write("    <a href=\"index.jsp\" class=\"logo-link\">RedApp</a>\r\n");
      out.write("    <h5 class=\"register-title\">회원가입</h5>\r\n");
      out.write("    <form action=\"");
      out.print(request.getContextPath());
      out.write("/user/insertUser.do\" method=\"POST\" id=\"registerForm\" name=\"registerForm\">\r\n");
      out.write("        <input type=\"hidden\" name=\"token\" value=\"\">\r\n");
      out.write("        <div class=\"form-floating mb-3\">\r\n");
      out.write("            <label for=\"floatingInput\" class=\"subject\">유저아이디</label>\r\n");
      out.write("            <span class=\"id_ok\">사용 가능한 아이디입니다.</span>\r\n");
      out.write("            <span class=\"id_already\">누군가 이 아이디를 사용하고 있어요.</span>\r\n");
      out.write("            <input type=\"text\" id=\"userid\" name=\"userid\" class=\"form-control userid_check\" id=\"floatingInput\" placeholder=\"유저아이디\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"form-floating mb-3\">\r\n");
      out.write("            <label for=\"floatingPassword\" class=\"subject\">닉네임</label>\r\n");
      out.write("            <input type=\"text\" id=\"nick\" name=\"nick\" class=\"form-control\" id=\"floatingPassword\" placeholder=\"닉네임\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"form-floating mb-3\">\r\n");
      out.write("            <label for=\"floatingPassword\" class=\"subject\">비밀번호</label>\r\n");
      out.write("            <input type=\"password\" id=\"password\" name=\"password\" class=\"form-control\" id=\"floatingPassword\" placeholder=\"비밀번호\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"form-floating mb-3\">\r\n");
      out.write("            <label for=\"floatingPasswordre\" class=\"subject\">비밀번호 확인</label>\r\n");
      out.write("            <input type=\"password\" id=\"password_re\" name=\"password_re\" class=\"form-control\" id=\"floatingPasswordre\" placeholder=\"비밀번호 확인\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"btn-register\">\r\n");
      out.write("            <button type=\"submit\" onclick=\"joinform_check();\">회원가입</button>\r\n");
      out.write("        </div>\r\n");
      out.write("    </form>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"footer\">\r\n");
      out.write("  <p class=\"copyright\">ⓒ RedApp Corporation All Rights Reserved.</p>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("$(document).ready(function() {\r\n");
      out.write("\t$(\".userid_check\").on(\"keyup\", function(){\r\n");
      out.write("\t\tvar userid   = $('#userid').val();\r\n");
      out.write("    \r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl: '");
      out.print( request.getContextPath());
      out.write("/user/idCheck.do',\r\n");
      out.write("\t\t\ttype: 'post',\r\n");
      out.write("\t\t\tdata: { \r\n");
      out.write("\t\t\t\tuserid : userid\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tsuccess: function(response) {\r\n");
      out.write("\t\t\t  if (response == 'success') {\r\n");
      out.write("            $('.id_ok').css(\"display\",\"block\"); \r\n");
      out.write("            $('.id_already').css(\"display\", \"none\");\r\n");
      out.write("\t\t\t\t} else {\r\n");
      out.write("            $('.id_already').css(\"display\",\"block\");\r\n");
      out.write("            $('.id_ok').css(\"display\", \"none\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},\r\n");
      out.write("      error : function(request) {\r\n");
      out.write("          alert(\"code:\" + request.status);\r\n");
      out.write("      }\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("//joinform_check 함수로 유효성 검사\r\n");
      out.write("function joinform_check() {\r\n");
      out.write("  //변수에 담아주기\r\n");
      out.write("  var userid = document.getElementById(\"userid\");\r\n");
      out.write("  var password = document.getElementById(\"password\");\r\n");
      out.write("  var passwordre = document.getElementById(\"passwordre\");\r\n");
      out.write("\r\n");
      out.write("  if (userid.value == \"\") {\r\n");
      out.write("    alert(\"아이디를 입력하세요.\");\r\n");
      out.write("    userid.focus();\r\n");
      out.write("    return false;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  if(idck==0){\r\n");
      out.write("    alert(\"아이디 중복체크를 해주세요\");\r\n");
      out.write("    return false;\r\n");
      out.write("  }\r\n");
      out.write("  if (password.value == \"\") {\r\n");
      out.write("    alert(\"비밀번호를 입력하세요.\");\r\n");
      out.write("    password.focus();\r\n");
      out.write("    return false;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식\r\n");
      out.write("  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;\r\n");
      out.write("\r\n");
      out.write("  if (!pwdCheck.test(password.value)) {\r\n");
      out.write("    alert(\"비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.\");\r\n");
      out.write("    userid.focus();\r\n");
      out.write("    return false;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  if (passwordre.value !== password.value) {\r\n");
      out.write("    alert(\"비밀번호가 일치하지 않습니다.\");\r\n");
      out.write("    passwordre.focus();\r\n");
      out.write("    return false;\r\n");
      out.write("  }\r\n");
      out.write("  document.join_form.submit(); \r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
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
