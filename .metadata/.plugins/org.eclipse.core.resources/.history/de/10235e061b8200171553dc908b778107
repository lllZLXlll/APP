package com.pjzb.controller.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import nl.bitwalker.useragentutils.OperatingSystem;
import nl.bitwalker.useragentutils.UserAgent;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.pjzb.util.Constants;
import com.pjzb.util.ConvertUtil;
import com.pjzb.util.IInformTemplateConstants;

public class BaseController {
	public static Log log = LogFactory.getLog(BaseController.class);

	private PrintWriter out;
	private HttpServletResponse response;

	// public Map<String, Object> jsonMap=new HashMap<String, Object>();

	// public PageBean pageBean=new PageBean();

	// 创建request
	public HttpServletRequest request() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}

	public HttpServletResponse response() {
		return response;
	}

	// 创建session
	public HttpSession session() {
		return request().getSession();
	}

	// 创建application
	public ServletContext application() {
		return request().getSession().getServletContext();
	}

	// 获取用户session
//	public User getSessionUserInfo() {
//		return (User) session().getAttribute(Constants.SESSION_USER);
//	}
//
//	// 获取用户session
//	public Admin getSessionAdminInfo() {
//		return (Admin) session().getAttribute(Constants.SESSION_ADMIN);
//	}
//
//	// 获取用户session
//	public Long getSessionUserId() {
//		return getSessionUserInfo().getId();
//	}

	// 获取request参数
	public String requestGetParameter(String name) {
		return request().getParameter(name);
	}

	// 设置request值
	public void requestSetAttribute(String name, Object object) {
		request().setAttribute(name, object);
	}

	// 设置session值
	public void sessionSetAttribute(String name, Object object) {
		session().setAttribute(name, object);
	}

	// 设置application值
	public void applicationSetAttribute(String name, Object object) {
		application().setAttribute(name, object);
	}

	// 获取request值
	public Object requestGetAttribute(String name) {
		return request().getAttribute(name);
	}

	// 获取request JSONObject对象值
	public JSONObject requestJSONGetAttribute(String name) {
		return (JSONObject) request().getAttribute(name);
	}

	// 获取request JSONObject对象值
	/**
	 * app要拦截的取值方式
	 * 
	 * @return
	 */
	public JSONObject requestAppJSONGetAttribute() {
		return (JSONObject) request().getAttribute(Constants.APPPARAMS);
	}

	// 获取session值
	public Object sessionGetAttribute(String name) {
		return session().getAttribute(name);
	}

	// 获取application值
	public Object applicationGetAttribute(String name) {
		return application().getAttribute(name);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> getInformTemplate() {
		return (Map<String, Object>) ContextLoader.getCurrentWebApplicationContext().getServletContext().getAttribute(IInformTemplateConstants.INFORM_TEMPLATE_APPLICATION);
	}

	// 移除request值
	public void requestRemoveAttribute(String name) {
		request().removeAttribute(name);
	}

	// 移除session值
	public void sessionRemoveAttribute(String name) {
		session().removeAttribute(name);
	}

	// 移除application值
	public void applicationRemoveAttribute(String name) {
		application().removeAttribute(name);
	}

	// 获取basePath
	public String getBasePath() {

		int port = request().getServerPort();
		String portStr = "";
		if (port != 80) {
			portStr = ":" + port;
		}
		String path = request().getScheme() + "://" + request().getServerName() + portStr + request().getContextPath() + "/";
		return path;
	}

	// 获得绝对路径
	public String getProjectRealPath() {
		return request().getSession().getServletContext().getRealPath("/");
	}

	// object转 JSONObject对象值
	public JSONObject objToJSON(Object object) {
		return JSONObject.fromObject(object);
	}

	public String getPageTypeFlag() {
		String pageType = chosese();
		String pageTypeFlag = "";
		if (pageType.equals(pageType.equals(Constants.PC))) {
			pageTypeFlag = "PC";
		} else {
			pageTypeFlag = "移动";
		}
		return pageTypeFlag + "端";
	}

	public String chosese() {
		UserAgent userAgent = UserAgent.parseUserAgentString(request().getHeader("User-Agent"));
		OperatingSystem os = userAgent.getOperatingSystem();
		String osSystem = os.toString();
		log.info("os:" + os);
		if (osSystem.equalsIgnoreCase("MAC_OS_X_IPHONE") || osSystem.equalsIgnoreCase("ANDROID") || osSystem.equalsIgnoreCase("UNKNOWN")) {
			return Constants.PHONEPAGE;
		} else {
			return Constants.PC;
		}
	}

	protected Map<String, String> getAppAuthMap(HttpServletResponse response) throws IOException {
		return getRequestMap("auth", response);

	}

	protected Map<String, String> getAppInfoMap(HttpServletResponse response) throws IOException {
		return getRequestMap("info", response);
	}

	@SuppressWarnings("unchecked")
	private Map<String, String> getRequestMap(String requestAttr, HttpServletResponse response) throws IOException {
		HttpServletRequest request = request();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}
		Map<String, String> jsonMap = new HashMap<String, String>();
		System.out.println("request url==>" + request.getContextPath());
		Map<String, String[]> paraMap = request().getParameterMap();
		System.out.println("session==>" + session());
		Set<String> keySet = paraMap.keySet();
		System.out.println("=============request value start===============");
		for (String key : keySet) {
			Object val = paraMap.get(key);
			if (val instanceof String[]) {
				System.out.println(key + "==>" + Arrays.toString((String[]) val));
			} else {
				System.out.println(key + "==>" + val);
			}
		}
		System.out.println("=============request value end===============");
		/*
		 * try { String name = new
		 * String(request(requestAttr).getBytes("utf-8"),"UTF-8");
		 * System.out.println("============================"+name); } catch
		 * (UnsupportedEncodingException e) { e.printStackTrace(); }
		 */
		String json = "";
		try {
			json = java.net.URLDecoder.decode(requestGetParameter(requestAttr), "UTF-8");// 中文解码
			json = json.replaceAll(" ", "+");// 如果解码后有空格，替换成+
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println("解码后的值==>" + json);
		String retUrl = request.getHeader("Referer");
		System.out.println("-------------------" + retUrl);

		// ServletContext application =
		// request().getSession().getServletContext();
		// Map<String,String> networkMap = (Map<String, String>)
		// applicationGetAttribute(IConstants.Session_CLOSENETWORK);
		// Object objStatus = networkMap.get("status");
		//
		// String str = objStatus.toString();
		// int status = Integer.valueOf(str);
		//
		// //Integer status=Convert.strToInt(networkMap.get("status"),-1);
		// System.out.println("网站关闭状态："+status);
		// if(status==2){
		// jsonMap.put("error", "100");
		// jsonMap.put("msg", networkMap.get("content"));
		// JSONUtils.printObject(jsonMap, response);
		// return null;
		// }
		System.out.println(request.getRequestURL());
		Map<String, String> map = (Map<String, String>) JSONObject.toBean(JSONObject.fromObject(json), HashMap.class);
		if (map == null) {
			map = new HashMap<String, String>();
		}
		return map;

	}

	/**
	 * 获取前台ajax数据
	 * 
	 * @return
	 * @throws IOException
	 */
	public JSONObject getAjaxParam() {
		Map<String, String[]> paraMap = request().getParameterMap();
		Set<String> keySet = paraMap.keySet();
		String data = null;
		for (String key : keySet) {
			data = key;
		}
		data = ConvertUtil.objToStrConvert(data);
		log.info("==========请求数据============" + data);
		if (data != null) {
			return JSONObject.fromObject(data);
		} else {
			return null;
		}
	}

	/**
	 * app端获取数据（Android，ios）
	 * 
	 * @return
	 * @throws IOException
	 */
	public JSONObject getAppParams() {
		try {
			// 如果是通过react native发送过来的请求，使用这个方法解析参数
			StringBuilder buffer = new StringBuilder();
			BufferedReader reader = request().getReader();
			String line;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			String body = ConvertUtil.objToStrConvert(buffer.toString());
			log.info("============URL=============" + request().getRequestURL());
			log.info("============IP==============" + getRemortIp());
			log.info("==========请求数据============" + body);
			if (body != null) {
				return JSONObject.fromObject(body);
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.info("app端数据解析异常");
			return null;
		}
	}

	public String getRemortIp() {
		if (request().getHeader("x-forwarded-for") == null) {
			return request().getRemoteAddr();
		}
		return request().getHeader("x-forwarded-for");
	}

	public PrintWriter getOut() throws Exception {
		response().setCharacterEncoding("UTF-8");
		response().setContentType("text/html; charset=UTF-8");
		out = response().getWriter();
		return out;
	}

	public Map<String, Object> ajaxDoneInfo(String statusCode, String message, String closeCurrent, String tabid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("statusCode", statusCode);
		map.put("message", message);
		map.put("closeCurrent", closeCurrent);
		map.put("tabid", tabid);
		return map;
	}

	public Map<String, Object> ajaxDoneForward(String statusCode, String message, String closeCurrent, String tabid, String forward) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("statusCode", statusCode);
		map.put("message", message);
		map.put("closeCurrent", closeCurrent);
		map.put("tabid", tabid);
		map.put("forward", forward);
		return map;
	}

	public String serverRootDirectory() {
		return request().getRealPath(File.separator);
	}

	protected void export(HSSFWorkbook wb, String fileName, HttpServletResponse response) throws IOException {
		// 设置response的编码方式
		response.setContentType("application/x-msdownload");

		// 写明要下载的文件的大小
		// response.setContentLength((int)fileName.length());

		// 设置附加文件名
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);

		// 解决中文乱码
		// response.setHeader("Content-Disposition","attachment;filename="+new
		// String
		// (filename.getBytes("gbk"),"iso-8859-1"));
		OutputStream output = response.getOutputStream();
		wb.write(output);

		output.flush();
		output.close();
	}

	protected void sendHtml(String html, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		out = response.getWriter();
		out.println(html);
		out.flush();
		out.close();
	}

}
