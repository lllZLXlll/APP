package com.app.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.app.controller.common.BaseController;
import com.app.util.AppUtil;
import com.app.util.Constants;
import com.app.util.ConvertUtil;
import com.app.util.IConstants;
import com.app.util.JSONUtils;

public class AppRequestParamsInterceptor extends BaseController implements HandlerInterceptor {
	public static Log log = LogFactory.getLog(AppRequestParamsInterceptor.class);

	private List<String> uncheckUrls;

	public List<String> getUncheckUrls() {
		return uncheckUrls;
	}

	public void setUncheckUrls(List<String> uncheckUrls) {
		this.uncheckUrls = uncheckUrls;
	}

	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			String requestURI = request.getRequestURI();
			if (IConstants.ISDEMO.equals("1")) {
				requestURI = requestURI.substring(requestURI.indexOf("/app") + 5, requestURI.length());
			}
			log.info("============URI=============" +requestURI);
			if (!uncheckUrls.contains(requestURI.trim())) {
				JSONObject jsonObject = getAppParams();
				if (jsonObject != null) {
					String userIdStr =ConvertUtil.objToStrConvert(jsonObject.get("uid"));
					if (userIdStr == null) {
						jsonMap.put("error", "-999");
						jsonMap.put("msg", "您的登录已超时，请重新登录！");
						JSONUtils.printObject(jsonMap, response);
						return false;
					} else {
						String userId = AppUtil.checkUserId(userIdStr);
						if (!userId.equals("-8")) {
							request.setAttribute(Constants.APPPARAMS, jsonObject);
							return true;
						} else {
							jsonMap.put("error", "-999");
							jsonMap.put("msg", "您的身份验证失败");
							JSONUtils.printObject(jsonMap, response);
							return false;
						}
					}
				} else {
					jsonMap.put("error", "-1");
					jsonMap.put("msg", "非法请求");
					JSONUtils.printObject(jsonMap, response);
					return false;
				}
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonMap.put("error", "-2");
			jsonMap.put("msg", "非法请求");
			JSONUtils.printObject(jsonMap, response);
		}
		return false;
	}

}
