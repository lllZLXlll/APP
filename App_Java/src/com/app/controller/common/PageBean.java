package com.app.controller.common;
 
import java.io.Serializable;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 公共分页实体类
 * @author xiaojin
 *
 */

public class PageBean implements Serializable {
	public static Log log = LogFactory.getLog(PageBean.class);
	private static final long serialVersionUID = -8652652596351231066L;
	public long pageNum;// 当前页数
	private long totalNum; // 总记录数
	private long totalPageNum; //总页数
	private long pageSize; // 每页的记录数
	private Object page; // 当前页中存放的记录 	
	
	
	public PageBean() {
		
	}
	
	public PageBean(long pageNum, long pageSize, long totalNum, Object page) {
		this.pageNum = pageNum;
		this.totalNum = totalNum;
		this.pageSize = pageSize;
		this.page = page;
	}

	public long getPageNum() {
		if(pageNum==0){
			pageNum=1;
		}
		return pageNum;
	}
	public void setPageNum(long pageNum) {
		this.pageNum = pageNum;
	}
	public long getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(long totalNum) {
		this.totalNum = totalNum;
	}
	public long getTotalPageNum() {
		return (totalNum % pageSize == 0) ? totalNum / pageSize : totalNum / pageSize + 1;
	}
	
	
	public void setTotalPageNum(long totalPageNum) {
		this.totalPageNum = totalPageNum;
	}
	public long getPageSize() {
		return pageSize;
	}
	public void setPageSize(long pageSize) {
		this.pageSize = pageSize;
	}
	public Object getPage() {
		return page;
	}
	public void setPage(Object page) {
		this.page = page;
	}
	
	
}
