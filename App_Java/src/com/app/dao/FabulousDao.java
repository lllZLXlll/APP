package com.app.dao;

import java.util.List;
import java.util.Map;

public interface FabulousDao {

	String queryFabulousCount(long articleId);

	long investFabulous(Map<String, Object> insertMap);

	String queryStampedeCount(Long commentId);

	List<Map<String, Object>> queryArticlePraises(Long articleId);

}
