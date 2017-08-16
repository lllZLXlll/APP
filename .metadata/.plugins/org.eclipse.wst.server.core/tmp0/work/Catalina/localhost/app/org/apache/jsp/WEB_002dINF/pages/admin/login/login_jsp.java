package org.apache.jsp.WEB_002dINF.pages.admin.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.util.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/WEB-INF/pages/admin/login/../../../../include/base.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	if(application.getAttribute("basePath")==null){
		application.setAttribute("basePath",basePath);
	}

      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var basePath=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${basePath}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\";\r\n");
      out.write("</script>\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>系统登录</title>\r\n");
      out.write("<script src=\"../resources/admin/bjui/BJUI/js/jquery-1.7.2.min.js\"></script>\r\n");
      out.write("<script src=\"../resources/admin/bjui/BJUI/js/jquery.cookie.js\"></script>\r\n");
      out.write("<script src=\"../resources/admin/bjui/js/sha256.js\"></script>\r\n");
      out.write("<link href=\"../resources/admin/bjui/BJUI/themes/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("* {font-family: \"Verdana\", \"Tahoma\", \"Lucida Grande\", \"Microsoft YaHei\", \"Hiragino Sans GB\", sans-serif;}\r\n");
      out.write("body {\r\n");
      out.write("    background: url(../resources/admin/bjui/images/loginbg_01.jpg) no-repeat center center fixed;\r\n");
      out.write("    -webkit-background-size: cover;\r\n");
      out.write("    -moz-background-size: cover;\r\n");
      out.write("    -o-background-size: cover;\r\n");
      out.write("    background-size: cover;\r\n");
      out.write("}\r\n");
      out.write("a:link {color: #285e8e;}\r\n");
      out.write(".main_box {\r\n");
      out.write("    position: absolute; top:50%; left:50%; margin-top:-260px; margin-left: -300px; padding: 30px; width:600px; height:460px;\r\n");
      out.write("    background: #FAFAFA; background: rgba(255,255,255,0.5); border: 1px #DDD solid;\r\n");
      out.write("    border-radius: 5px;\r\n");
      out.write("    -webkit-box-shadow: 1px 5px 8px #888888; -moz-box-shadow: 1px 5px 8px #888888; box-shadow: 1px 5px 8px #888888;\r\n");
      out.write("}\r\n");
      out.write(".main_box .setting {position: absolute; top: 5px; right: 10px; width: 10px; height: 10px;}\r\n");
      out.write(".main_box .setting a {color: #FF6600;}\r\n");
      out.write(".main_box .setting a:hover {color: #555;}\r\n");
      out.write(".login_logo {margin-bottom: 20px; height: 45px; text-align: center;}\r\n");
      out.write(".login_logo img {height: 45px;}\r\n");
      out.write(".login_msg {text-align: center; font-size: 16px;}\r\n");
      out.write(".login_form {padding-top: 20px; font-size: 16px;}\r\n");
      out.write(".login_box .form-control {display: inline-block; *display: inline; zoom: 1; width: auto; font-size: 18px;}\r\n");
      out.write(".login_box .form-control.x319 {width: 319px;}\r\n");
      out.write(".login_box .form-control.x164 {width: 164px;}\r\n");
      out.write(".login_box .form-group {margin-bottom: 20px;}\r\n");
      out.write(".login_box .form-group label.t {width: 120px; text-align: right; cursor: pointer;}\r\n");
      out.write(".login_box .form-group.space {padding-top: 15px; border-top: 1px #FFF dotted;}\r\n");
      out.write(".login_box .form-group img {margin-top: 1px; height: 32px; vertical-align: top;}\r\n");
      out.write(".login_box .m {cursor: pointer;}\r\n");
      out.write(".bottom {text-align: center; font-size: 12px;}\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var COOKIE_NAME = 'sys__username';\r\n");
      out.write("$(function() {\r\n");
      out.write("    choose_bg();\r\n");
      out.write("\t//changeCode();\r\n");
      out.write("\tif ($.cookie(COOKIE_NAME)){\r\n");
      out.write("\t    $(\"#j_username\").val($.cookie(COOKIE_NAME));\r\n");
      out.write("\t    $(\"#j_password\").focus();\r\n");
      out.write("\t    $(\"#j_remember\").attr('checked', true);\r\n");
      out.write("\t} else {\r\n");
      out.write("\t\t$(\"#j_username\").focus();\r\n");
      out.write("\t}\r\n");
      out.write("\t$(\"#captcha_img\").click(function(){\r\n");
      out.write("\t\tchangeCode();\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#login_form\").submit(function(){\r\n");
      out.write("\t\tvar issubmit = true;\r\n");
      out.write("\t\tvar i_index  = 0;\r\n");
      out.write("\t\t$(this).find('.in').each(function(i){\r\n");
      out.write("\t\t\tif ($.trim($(this).val()).length == 0) {\r\n");
      out.write("\t\t\t\t$(this).css('border', '1px #ff0000 solid');\r\n");
      out.write("\t\t\t\tissubmit = false;\r\n");
      out.write("\t\t\t\tif (i_index == 0)\r\n");
      out.write("\t\t\t\t\ti_index  = i;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\tif (!issubmit) {\r\n");
      out.write("\t\t\t$(this).find('.in').eq(i_index).focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tvar $remember = $(\"#j_remember\");\r\n");
      out.write("\t\tif ($remember.attr('checked')) {\r\n");
      out.write("\t\t\t$.cookie(COOKIE_NAME, $(\"#j_username\").val(), { path: '/', expires: 15 });\r\n");
      out.write("\t\t} else {\r\n");
      out.write("\t\t\t$.cookie(COOKIE_NAME, null, { path: '/' });  //删除cookie\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t$(\"#login_ok\").attr(\"disabled\", true).val('登陆中..');\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t\t  $form.ajaxSubmit(options);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t//\twindow.location.href = 'adminInit.do'; /*注意：生产环境时请删除此行*/\r\n");
      out.write("        return false;\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("var options = {    \r\n");
      out.write("\t       dataType: \"json\",\r\n");
      out.write("\t       success:     callback ,  // post-submit callback    \r\n");
      out.write("\t       timeout:   10000\r\n");
      out.write("\t   };\r\n");
      out.write("\r\n");
      out.write("function callback(resp){\r\n");
      out.write("\talert(resp);\r\n");
      out.write("}\r\n");
      out.write("\t   \r\n");
      out.write("function genTimestamp(){\r\n");
      out.write("\tvar time = new Date();\r\n");
      out.write("\treturn time.getTime();\r\n");
      out.write("}\r\n");
      out.write("function changeCode(){\r\n");
      out.write("\t$(\"#captcha_img\").attr(\"src\", \"../imageCode.do?t=\"+genTimestamp()+\"&pageId=adminLogin\");\r\n");
      out.write("}\r\n");
      out.write("function choose_bg() {\r\n");
      out.write("\tvar bg = Math.floor(Math.random() * 9 + 1);\r\n");
      out.write("\t$('body').css('background-image', 'url(../resources/admin/bjui/images/loginbg_0'+ bg +'.jpg)');\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<!--[if lte IE 7]>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("#errorie {position: fixed; top: 0; z-index: 100000; height: 30px; background: #FCF8E3;}\r\n");
      out.write("#errorie div {width: 900px; margin: 0 auto; line-height: 30px; color: orange; font-size: 14px; text-align: center;}\r\n");
      out.write("#errorie div a {color: #459f79;font-size: 14px;}\r\n");
      out.write("#errorie div a:hover {text-decoration: underline;}\r\n");
      out.write("</style>\r\n");
      out.write("<div id=\"errorie\"><div>您还在使用老掉牙的IE，请升级您的浏览器到 IE8以上版本 <a target=\"_blank\" href=\"http://windows.microsoft.com/zh-cn/internet-explorer/ie-8-worldwide-languages\">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href=\"http://down.tech.sina.com.cn/content/40975.html\" target=\"_blank\">谷歌 Chrome</a></div></div>\r\n");
      out.write("<![endif]-->\r\n");
      out.write("<div class=\"main_box\">\r\n");
      out.write("    <div class=\"setting\"><a href=\"javascript:;\" onclick=\"choose_bg();\" title=\"更换背景\"><span class=\"glyphicon glyphicon-th-large\"></span></a></div>\r\n");
      out.write("\t<div class=\"login_box\">\r\n");
      out.write("        <div class=\"login_logo\">\r\n");
      out.write("        \t<br/>\r\n");
      out.write("            <img src=\"../resources/admin/bjui/images/logo.png\" >\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--\r\n");
      out.write("\t\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("        -->\r\n");
      out.write("        <div class=\"login_form\">\r\n");
      out.write("            <input type=\"hidden\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${randomKey }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" id=\"j_randomKey\" />\r\n");
      out.write("    \t\t<form action=\"adminlogin.do\" id=\"login_form\" method=\"post\">\r\n");
      out.write("                <input type=\"hidden\" name=\"jfinal_token\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${jfinal_token }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" />\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                <label for=\"j_username\" class=\"t\">&nbsp;&nbsp;&nbsp;&nbsp;</label>\r\n");
      out.write("               <span style=\"color: red;\"> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${msg }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("</span>\r\n");
      out.write("                </div>\r\n");
      out.write("    \t\t\t<div class=\"form-group\">\r\n");
      out.write("    \t\t\t\t<label for=\"j_username\" class=\"t\">用户名：</label> <input id=\"j_username\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userName }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"username\" type=\"text\" class=\"form-control x319 in\" autocomplete=\"off\" maxlength=\"20\">\r\n");
      out.write("    \t\t\t</div>\r\n");
      out.write("    \t\t\t<div class=\"form-group\">\r\n");
      out.write("    \t\t\t\t<label for=\"j_password\" class=\"t\">密　码：</label> <input id=\"j_password\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pwd }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" name=\"password\" type=\"password\" class=\"form-control x319 in\" maxlength=\"25\">\r\n");
      out.write("    \t\t\t</div>\r\n");
      out.write("    \t\t\t<div class=\"form-group\">\r\n");
      out.write("    \t\t\t\t<label for=\"j_captcha\" class=\"t\">验证码：</label> <input id=\"j_captcha\" name=\"code\" type=\"text\" class=\"form-control x164 in\" maxlength=\"4\">\r\n");
      out.write("    \t\t\t\t<img id=\"captcha_img\" alt=\"点击更换\" title=\"点击更换\" src=\"../imageCode.do?&pageId=adminLogin\" class=\"m\">\r\n");
      out.write("    \t\t\t</div>\r\n");
      out.write("    \t\t\t<div class=\"form-group\">\r\n");
      out.write("                    <label class=\"t\"></label>\r\n");
      out.write("                    <label for=\"j_remember\" class=\"m\"><input id=\"j_remember\" type=\"checkbox\" value=\"true\">&nbsp;记住登陆账号!</label>\r\n");
      out.write("    \t\t\t</div>\r\n");
      out.write("    \t\t\t<div class=\"form-group space\">\r\n");
      out.write("                    <label class=\"t\"></label>　　　\r\n");
      out.write("    \t\t\t\t<input type=\"submit\" id=\"login_ok\" value=\"&nbsp;登&nbsp;录&nbsp;\" class=\"btn btn-primary btn-lg\">&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("    \t\t\t\t<input type=\"reset\" value=\"&nbsp;重&nbsp;置&nbsp;\" class=\"btn btn-default btn-lg\">\r\n");
      out.write("    \t\t\t</div>\r\n");
      out.write("    \t\t</form>\r\n");
      out.write("        </div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"bottom\"></a></div>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else log(t.getMessage(), t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /WEB-INF/pages/admin/login/login.jsp(140,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${!empty message}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null, false)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t<div class=\"login_msg\">\r\n");
          out.write("\t      \t\t<font color=\"red\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${message }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
          out.write("</font>\r\n");
          out.write("\t    \t</div>\r\n");
          out.write("\t    ");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_annotationprocessor, _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }
}
