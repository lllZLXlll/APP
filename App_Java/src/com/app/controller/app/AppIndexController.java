package com.app.controller.app;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.controller.common.BaseController;
import com.app.controller.common.PageBean;
import com.app.service.IndexService;

/**
 * 首页
 * 
 */
@Controller
@RequestMapping(value = "/home")
public class AppIndexController extends BaseController {
	public static Log log = LogFactory.getLog(AppIndexController.class);
	
	@Autowired
	private IndexService indexService;
	
	// 首页数据查询
	@RequestMapping(value = "/index")
	@ResponseBody
	public PageBean index(){
		return indexService.queryIndexContent(getAppParams());
	}
	
	// 点赞 帖子
	@RequestMapping(value = "/fabulous")
	@ResponseBody
	public Map<String, Object> fabulous(){
		return indexService.investFabulousArticle(getAppParams());
	}
	
	// 点赞 评论
	@RequestMapping(value = "/comment")
	@ResponseBody
	public Map<String, Object> comment(){
		return indexService.investFabulousComment(getAppParams());
	}
	
	// 踩
	@RequestMapping(value = "/stampede")
	@ResponseBody
	public Map<String, Object> stampede(){
		return indexService.investArticleStampede(getAppParams());
	}
	
	// 查看帖子详情中的评论 1级
	@RequestMapping(value = "/queryArticleDetails")
	@ResponseBody
	public PageBean queryArticleDetails(){
		return indexService.queryArticleDetails(getAppParams());
	}

	// 查看帖子详情中的评论的评论 2级
	@RequestMapping(value = "/queryArticleDetailsComment")
	@ResponseBody
	public PageBean queryArticleDetailsComment(){
		return indexService.queryArticleDetailsComment(getAppParams());
	}
	
}
