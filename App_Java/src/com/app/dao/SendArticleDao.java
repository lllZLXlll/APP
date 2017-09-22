package com.app.dao;

import java.util.List;
import java.util.Map;

public interface SendArticleDao {

	public long queryIndexContentCount();

	public List<Map<String, Object>> queryIndexContent(long pageNum, Long pageSize, long userId);

	public long updateArticleFabulousCount(long articleId, int i);

	public long updateArticleStampedeCount(Long articleId, int i);

}
