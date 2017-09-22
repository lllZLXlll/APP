package com.app.dao;

import java.util.List;
import java.util.Map;

public interface ArticleCommentDao {

	Long queryArticleDetailsCount(Long articleId);

	List<Map<String, Object>> queryArticleDetails(long pageNum, Long pageSize, Long articleId, Long userId);
	
}
