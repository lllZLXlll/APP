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

/**
 * 首页
 * 
 */
@Controller
@RequestMapping(value = "/app")
public class AppIndexController extends BaseController {
	public static Log log = LogFactory.getLog(AppIndexController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/index")
	@ResponseBody
	public Map<String, Object> login(){
		Map<String, Object> userInfo = userService.queryUserInfo();
		System.out.println(userInfo);
		return userInfo;
	}
	
}
