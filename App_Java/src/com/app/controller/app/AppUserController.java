package com.app.controller.app;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.controller.common.BaseController;
import com.app.service.UserService;
import com.app.util.AppUtil;

import net.sf.json.JSONObject;

/**
 * 首页
 * 
 */
@Controller
@RequestMapping(value = "/user")
public class AppUserController extends BaseController {
	public static Log log = LogFactory.getLog(AppUserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/userInfo")
	@ResponseBody
	public Map<String, Object> userInfo(){
		JSONObject jsonObject = getAppParams();
		String uidStr = jsonObject.getString("uid");
		Long uid = Long.parseLong(uidStr);
		Map<String, Object> userInfo = userService.queryUserInfoById(uid);
		System.out.println(userInfo);
		userInfo.put("id", AppUtil.encryptUserId(userInfo.get("id")+""));
		return userInfo;
	}
	
}
