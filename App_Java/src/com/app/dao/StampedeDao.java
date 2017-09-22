package com.app.dao;

import java.util.Map;

public interface StampedeDao {

	String queryStampedeCount(Long articleId);

	long investStampede(Map<String, Object> insertMap);

}
