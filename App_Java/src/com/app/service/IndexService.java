package com.app.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.controller.common.PageBean;
import com.app.dao.ArticleCommentDao;
import com.app.dao.FabulousDao;
import com.app.dao.SendArticleDao;
import com.app.dao.StampedeDao;
import com.app.util.AppUtil;

import net.sf.json.JSONObject;

@Service
public class IndexService {

	@Autowired
	private SendArticleDao sendArticleDao;

	@Autowired
	private FabulousDao fabulousDao;

	@Autowired
	private StampedeDao stampedeDao;

	@Autowired
	private ArticleCommentDao articleCommentDao;

	// 首页数据查询
	public PageBean queryIndexContent(JSONObject appParams) {
		Long totalNum = sendArticleDao.queryIndexContentCount();

		// 用户id
		Long userId = Long.parseLong(AppUtil.checkUserId(appParams.getString("uid")));

		Long pageNum = Long.parseLong(appParams.getString("pageNum"));
		Long pageSize = Long.parseLong(appParams.getString("pageSize"));

		// 如果用户登录了那么根据用户id查询出用户是否对此帖有过赞或踩，如果没有登录则不用查询，暂时查询出来
		List<Map<String, Object>> page = sendArticleDao.queryIndexContent((pageNum - 1) * pageSize, pageSize, userId);

		for (Map<String, Object> map : page) {
			// userId加密
			map.put("userId", AppUtil.encryptUserId(map.get("userId") + ""));

			/**
			 * 转换图片数据格式，前台必须是格式:[{url: 'image url'}...]，
			 * 但数据库中存储的就是图片的路径，多张就以逗号隔开
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
			} else {
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

		String fabulousCountStr = fabulousDao.queryFabulousCount(articleId);
		int fabulousCount = 0;
		if (fabulousCountStr != null && !fabulousCountStr.equals("null") && !fabulousCountStr.equals(""))
			fabulousCount = Integer.parseInt(fabulousCountStr);
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("userId", userId);
		insertMap.put("articleId", articleId);
		insertMap.put("fabulousCount", fabulousCount + 1);
		insertMap.put("fabulousDate", new Date());
		// 向点赞记录表增加一条数据
		long result = fabulousDao.investFabulous(insertMap);

		// 把发帖记录表中点赞数量更新
		result = sendArticleDao.updateArticleFabulousCount(articleId, fabulousCount + 1);

		if (result <= 0) {
			jsonMap.put("error", "1");
			jsonMap.put("msg", "点赞失败");
			return jsonMap;
		}

		jsonMap.put("error", "0");
		jsonMap.put("msg", "点赞成功");
		return jsonMap;
	}

	// 点赞评论，加上同步锁，防止两个人同时点赞时取得相同的数据，或修改相同的数据
	public synchronized Map<String, Object> investFabulousComment(JSONObject appParams) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		// 用户id
		Long userId = Long.parseLong(AppUtil.checkUserId(appParams.getString("uid")));
		// 评论id
		Long commentId = Long.parseLong(appParams.getString("commentId"));

		String commentCountStr = fabulousDao.queryStampedeCount(commentId);
		int commentCount = 0;
		if (commentCountStr != null && !commentCountStr.equals("null") && !commentCountStr.equals(""))
			commentCount = Integer.parseInt(commentCountStr);
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("userId", userId);
		insertMap.put("commentId", commentId);
		insertMap.put("fabulousCount", commentCount + 1);
		insertMap.put("fabulousDate", new Date());
		// 向点赞记录表增加一条数据
		long result = fabulousDao.investFabulous(insertMap);

		// 修改帖子评论表中的点赞数量
		result = articleCommentDao.updateArticleCommentFabulousCount(commentId, commentCount + 1);

		if (result <= 0) {
			jsonMap.put("error", "1");
			jsonMap.put("msg", "点赞失败");
			return jsonMap;
		}

		jsonMap.put("error", "0");
		jsonMap.put("msg", "点赞成功");
		return jsonMap;
	}

	// 帖子，踩
	public synchronized Map<String, Object> investArticleStampede(JSONObject appParams) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		// 用户id
		Long userId = Long.parseLong(AppUtil.checkUserId(appParams.getString("uid")));
		// 帖子id
		Long articleId = Long.parseLong(appParams.getString("articleId"));

		String articleCountStr = stampedeDao.queryStampedeCount(articleId);
		int stampedeCount = 0;
		if (articleCountStr != null && !articleCountStr.equals("null") && !articleCountStr.equals(""))
			stampedeCount = Integer.parseInt(articleCountStr);
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("userId", userId);
		insertMap.put("articleId", articleId);
		insertMap.put("stampedeCount", stampedeCount + 1);
		insertMap.put("stampedeDate", new Date());
		// 向点赞记录表增加一条数据
		long result = stampedeDao.investStampede(insertMap);

		// 把发帖记录表中点赞数量更新
		result = sendArticleDao.updateArticleStampedeCount(articleId, stampedeCount + 1);

		if (result <= 0) {
			jsonMap.put("error", "1");
			jsonMap.put("msg", "踩失败");
			return jsonMap;
		}

		jsonMap.put("error", "0");
		jsonMap.put("msg", "踩成功");
		return jsonMap;
	}

	// 查看帖子详情中的评论
	public PageBean queryArticleDetails(JSONObject appParams) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		// 用户id
		Long userId = Long.parseLong(AppUtil.checkUserId(appParams.getString("uid")));
		// 帖子id
		Long articleId = Long.parseLong(appParams.getString("articleId"));

		Long totalNum = articleCommentDao.queryArticleDetailsCount(articleId);

		Long pageNum = Long.parseLong(appParams.getString("pageNum"));
		Long pageSize = Long.parseLong(appParams.getString("pageSize"));

		// 如果用户登录了那么根据用户id查询出用户是否对此帖有过赞或踩，如果没有登录则不用查询，暂时查询出来
		List<Map<String, Object>> page = articleCommentDao.queryArticleDetails((pageNum - 1) * pageSize, pageSize,
				articleId, userId);
		
		// 查询该贴子评论数量，赞数量
		long commentCount = articleCommentDao.queryArticleCommentCount(articleId);

		for (Map<String, Object> map : page) {
			// userId加密
			map.put("userId", AppUtil.encryptUserId(map.get("userId") + ""));
		}

		return new PageBean(pageNum, pageSize, totalNum, page);
	}

	public PageBean queryArticleDetailsComment(JSONObject appParams) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		// 用户id
		Long userId = Long.parseLong(AppUtil.checkUserId(appParams.getString("uid")));
		// 帖子id
		Long commentId = Long.parseLong(appParams.getString("commentId"));

		Long totalNum = articleCommentDao.queryArticleDetailsCommentCount(commentId);

		Long pageNum = Long.parseLong(appParams.getString("pageNum"));
		Long pageSize = Long.parseLong(appParams.getString("pageSize"));

		// 如果用户登录了那么根据用户id查询出用户是否对此帖有过赞或踩，如果没有登录则不用查询，暂时查询出来
		List<Map<String, Object>> page = articleCommentDao.queryArticleDetailsComment((pageNum - 1) * pageSize, pageSize,
				commentId, userId);

		for (Map<String, Object> map : page) {
			// userId加密
			map.put("userId", AppUtil.encryptUserId(map.get("userId") + ""));
		}

		return new PageBean(pageNum, pageSize, totalNum, page);
	}

}
