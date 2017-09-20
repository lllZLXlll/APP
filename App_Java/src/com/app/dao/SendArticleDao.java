package com.app.dao;

import java.util.List;
import java.util.Map;

public interface SendArticleDao {

	public long queryIndexContentCount();

	public List<Map<String, Object>> queryIndexContent(long pageNum, Long pageSize);

}
