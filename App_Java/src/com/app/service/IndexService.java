package com.app.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.controller.common.PageBean;
import com.app.dao.FabulousDao;
import com.app.dao.SendArticleDao;
import com.app.util.AppUtil;

import net.sf.json.JSONObject;

@Service
public class IndexService {

	@Autowired
	private SendArticleDao sendArticleDao;
	
	@Autowired
	private FabulousDao fabulousDao;
	
	// 首页数据查询
	public PageBean queryIndexContent(JSONObject appParams) {
		Long totalNum = sendArticleDao.queryIndexContentCount();
		
		Long pageNum = Long.parseLong(appParams.getString("pageNum"));
		Long pageSize = Long.parseLong(appParams.getString("pageSize"));
		
		List<Map<String, Object>> page = sendArticleDao.queryIndexContent((pageNum - 1) * pageSize, pageSize);
		
		for (Map<String, Object> map : page) {
			// userId加密
			map.put("userId", AppUtil.encryptUserId(map.get("userId")+""));
			
			/** 
			 * 	转换图片数据格式，前台必须是格式:[{url: 'image url'}...]，
			 * 	但数据库中存储的就是图片的路径，多张就以逗号隔开
			 * 
			 */
			Object articleImages = map.get("articleImages");
			if (articleImages != null) {
				String arr[] = articleImages.toString().split(",");
				List<Map<String, Object>> imsges = new ArrayList<Map<String, Object>>();
				for (String str : arr) {
					Map<String, Object> imsge = new HashMap<String, Object>();
					imsge.put("url", str);
					imsges.add(imsge);
				}
			
				map.put("articleImages", imsges);
			}
			else {
				map.put("articleImages", null);
			}
		}
		
		return new PageBean(pageNum, pageSize, totalNum, page);
	}
	
	// 点赞帖子，加上同步锁，防止两个人同时点赞时取得相同的数据，或修改相同的数据
	public synchronized Map<String, Object> investFabulousArticle(JSONObject appParams) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		// 用户id
		long userId = Long.parseLong(AppUtil.checkUserId(appParams.getString("uid")));
		// 帖子id
		long articleId = Long.parseLong(appParams.getString("articleId"));
		String fabulousCountStr =  fabulousDao.queryFabulousCount(articleId);
		int fabulousCount = 0;
		if (fabulousCountStr != null && !fabulousCountStr.equals("null") && !fabulousCountStr.equals("")) 
			fabulousCount = Integer.parseInt(fabulousCountStr);
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("userId", userId);
		insertMap.put("articleId", articleId);
		insertMap.put("fabulousCount", fabulousCount + 1);
		insertMap.put("fabulousDate", new Date());
		
		long result = fabulousDao.investFabulous(insertMap);
		
		if (result <= 0 ) {
			jsonMap.put("error", "1");
			jsonMap.put("msg", "点赞失败");
		}
		jsonMap.put("error", "0");
		jsonMap.put("msg", "点赞成功");
		return jsonMap;
	}
	
	// 点赞评论，加上同步锁，防止两个人同时点赞时取得相同的数据，或修改相同的数据
	public synchronized PageBean investFabulousComment(JSONObject appParams) {
		// 用户id
		Long userId = Long.parseLong(AppUtil.checkUserId(appParams.getString("uid")));
		//　评论id
		Long commentUserId = Long.parseLong(appParams.getString("commentId"));
		
		return null;
	}
	
	
	
}
