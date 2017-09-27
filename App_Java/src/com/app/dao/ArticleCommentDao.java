package com.app.dao;

import java.util.List;
import java.util.Map;

public interface ArticleCommentDao {

	Long queryArticleDetailsCount(Long articleId);

	List<Map<String, Object>> queryArticleDetails(long pageNum, Long pageSize, Long articleId, Long userId);

	long updateArticleCommentFabulousCount(Long commentId, int count);

	Long queryArticleDetailsCommentCount(Long commentId);

	List<Map<String, Object>> queryArticleDetailsComment(long l, Long pageSize, Long commentId, Long userId);

	long queryArticleCommentCount(Long articleId);
	
}
