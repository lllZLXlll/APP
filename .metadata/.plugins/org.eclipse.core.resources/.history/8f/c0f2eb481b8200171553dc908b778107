package com.pjzb.controller.admin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pjzb.controller.common.BaseController;

/**
 * 登录
 * 
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminIndexController extends BaseController {
	public static Log log = LogFactory.getLog(AdminIndexController.class);
	
	@RequestMapping(value = "/login")
	public String login(){
		return "/admin/login/login.jsp";
	}
	
}
