<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
	
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/borrowInspectionInit.do" method="post">
    	 <input type="hidden" name="tabid" value="${tabid}">
	        <input type="hidden" name="pageSize" value="${pageSize}">
	        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
    	<div class="bjui-searchBar">
	        <br/>&nbsp;&nbsp;
	       	
	       	
	       	<label>借款标题：</label><input type="text" id="borrowTitle" value="${borrowTitle }" name="borrowTitle" class="form-control" >&nbsp;
	        
           	<button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
           	<a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
        </div>
    </form>
    
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">借款人</th>
                <th align="center">借款标题</th>
                <th align="center">维护经理</th>
                <th align="center">任务生成时间</th>
                <th align="center">任务处理状态</th>
                <th align="center">查看月检记录</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="item" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${item.borrowRealName }</td>
	                <td><a href="../WEB-PC/invest.html?id=${item.borrowId}" target="view_frame">${item.borrowTitle }</a></td>
	                
	                <td>${item.realName }</td>
	                <td><fmt:formatDate value="${item.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	                <td>
	                	<c:if test="${item.dealWithStatus==0 }">未处理</c:if>
	                	<c:if test="${item.dealWithStatus==1 }">已处理</c:if>
	                </td>
	                <td>
	                
	                     <c:choose>
	                	<c:when test="${admin.id != -1 and admin.roleId==-16 }">
	                		 <a href="saveOrUpdateBorrowMonthInspectInit.do?borrowId=${item.borrowId }&tabid=&&inspectId=${item.id}" 
	                data-toggle="navtab"  data-id="saveOrUpdateAdminInitDialog" data-mask="true" data-title="${item.borrowTitle }-新增月检" 
                   data-width="700" data-height="700" class="btn btn-red">新增月检</a>
	                	</c:when>
	                	<c:otherwise>
	                		-
	                	</c:otherwise>
	                </c:choose>
	               
	                	
                	</td>
            	</tr>
            </c:forEach>
            <c:if test="${pageBean.page == null or pageBean.page == '[]' }">
            	<tr align="center">
            		<td align="center" colspan="8">暂无数据</td>
            	</tr>
            </c:if>
        </tbody>
    </table>
</div>

<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
            	<option value="10">10</option>
            	<option value="20" selected="selected">20</option>
                <option value="30">30</option>
                <option value="60">60</option>
                <option value="120">120</option>
                <option value="150">150</option>
            </select>
        </div>
       <span>&nbsp;条，共 ${pageBean.totalNum } 条， 共 ${pageBean.totalPageNum } 页</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>