package com.app.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.controller.app.AppIndexController;
import com.app.controller.common.BaseController;
import com.app.controller.common.PageBean;
import com.app.dao.ArticleCommentDao;
import com.app.dao.FabulousDao;
import com.app.dao.SendArticleDao;
import com.app.dao.StampedeDao;
import com.app.util.AppUtil;
import com.app.util.FileUtils;
import com.app.util.ServletUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class IndexService extends BaseController {
	public static Log log = LogFactory.getLog(IndexService.class);

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

		// 查询该贴子评论数量，赞数量 -begin
		long commentCount = articleCommentDao.queryArticleCommentCount(articleId);
		String fabulousCountStr = fabulousDao.queryFabulousCount(articleId);
		int fabulousCount = 0;
		if (fabulousCountStr != null && !fabulousCountStr.equals("null") && !fabulousCountStr.equals(""))
			fabulousCount = Integer.parseInt(fabulousCountStr);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("articleCommentCount", commentCount);
		dataMap.put("articleFabulousCount", fabulousCount);
		// 查询该贴子评论数量，赞数量 -end

		for (Map<String, Object> map : page) {
			// userId加密
			map.put("userId", AppUtil.encryptUserId(map.get("userId") + ""));
		}

		PageBean pageBean = new PageBean(pageNum, pageSize, totalNum, page);
		pageBean.setDataMap(dataMap);
		return pageBean;
	}

	public PageBean queryArticleDetailsComment(JSONObject appParams) {
		// 用户id
		Long userId = Long.parseLong(AppUtil.checkUserId(appParams.getString("uid")));
		// 帖子id
		Long commentId = Long.parseLong(appParams.getString("commentId"));

		Long totalNum = articleCommentDao.queryArticleDetailsCommentCount(commentId);

		Long pageNum = Long.parseLong(appParams.getString("pageNum"));
		Long pageSize = Long.parseLong(appParams.getString("pageSize"));

		// 如果用户登录了那么根据用户id查询出用户是否对此帖有过赞或踩，如果没有登录则不用查询，暂时查询出来
		List<Map<String, Object>> page = articleCommentDao.queryArticleDetailsComment((pageNum - 1) * pageSize,
				pageSize, commentId, userId);

		for (Map<String, Object> map : page) {
			// userId加密
			map.put("userId", AppUtil.encryptUserId(map.get("userId") + ""));
			// 三级回复，被回复的用户id, 前端页面根据回复级数是3判断，显示3级回复的样式 --------------
			map.put("revertUserId", AppUtil.encryptUserId(map.get("revertUserId") + ""));
		}

		return new PageBean(pageNum, pageSize, totalNum, page);
	}

	public List<Map<String, Object>> queryArticlePraises(JSONObject appParams) {
		// 帖子id
		Long articleId = Long.parseLong(appParams.getString("articleId"));

		List<Map<String, Object>> list = fabulousDao.queryArticlePraises(articleId);

		for (Map<String, Object> map : list) {
			// userId加密
			map.put("id", AppUtil.encryptUserId(map.get("id") + ""));
		}

		return list;
	}

	// 发帖
	public Map<String, Object> sendArticle(JSONObject appParams) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 用户id
		Long userId = Long.parseLong(AppUtil.checkUserId(appParams.getString("uid")));
		// 帖子内容
		String content = appParams.getString("content");
		// 帖子图片 转换成json数组
		JSONArray images = appParams.getJSONArray("images");

		// 数据判断
		// 内容是否少于10个字符
		if (content.length() < 10) {
			resultMap.put("error", "1");
			resultMap.put("msg", "再多写点吧!");
			return resultMap;
		}

		// 判断图片是否大于9张
		if (images.size() > 9) {
			resultMap.put("error", "2");
			resultMap.put("msg", "图片不能多于9张");
			return resultMap;
		}

		// 每天创建一个文件夹存储用户每天上传的图片
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String realPath = ServletUtils.serverRootDirectory() + "upload/sendArticle/" + sdf.format(new Date());
		FileUtils.mkdirs(realPath);

		// 保存远程地址图片数组
		String imageArr[] = new String[images.size()];
		
		// 循环json数组取得每个图片json对象
		for (int i = 0; i < images.size(); i++) {
			JSONObject imageObj = images.getJSONObject(i);
			// 图片base64编码
			String image = imageObj.getString("data");
			String filename = imageObj.getString("filename");
			filename = filename.substring(filename.indexOf("."), filename.length());
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
			log.info(realPath + "\\" + userId + sdf2.format(new Date()) + filename);
			String reFileName = userId + sdf2.format(new Date()) + filename;

			// 把图片进行解码，并写出到指定目录
			AppUtil.GenerateImage(image, realPath + "/" + reFileName);
			String url = request().getRequestURL().toString();
			String imgPath = url.substring(0, url.indexOf("/re")) + "/upload/sendArticle/" + sdf.format(new Date())
					+ "/" + reFileName;
			log.info("图片上传服务器后地址为：" + imgPath);
			
			// 把上传的地址保存到数组中
			imageArr[i] = imgPath;
		}
		
		// 把内容和图片保存到数据库中
		未做完
		
		resultMap.put("error", "0");
		resultMap.put("msg", "ok");
		return resultMap;
	}

}
