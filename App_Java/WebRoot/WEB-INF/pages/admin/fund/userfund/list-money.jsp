<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/queryUserFundrecordInit.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <input type="hidden" name="id" value="${id}">
        <input type="hidden" name="userName" value="${userName}">
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center" height="25px">
                <th align="center">序号</th>
                <th align="center">交易时间</th>
                <th align="center">类型</th>
                <th align="center">摘要</th>
                <th align="center">用户名</th>
                <th align="center">收入（¥元）</th>
                <th align="center">支出（¥元）</th>
                <th align="center">待收金额（¥元）</th>
                <th align="center">冻结金额（¥元）</th>
                <th align="center">可用余额（¥元）</th>
                <th align="center">总金额（¥元）</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	
        	 <c:choose>
	                	<c:when test="${pageBean.page == null or pageBean.page == '[]' }">
	                	<tr align="center">
            		<td align="center" colspan="11">暂无数据</td>
            	</tr>
	                	</c:when>
	                	<c:otherwise>
	                		<c:forEach items="${pageBean.page }" var="item" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td><fmt:formatDate value="${item.recordTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	                <td>${item.fundMode }</td>
	                <td>${item.remarks }</td>
	                <td>${userName}</td>
	                <td><fmt:formatNumber value="${item.income }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${item.spending }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${item.dueinSum }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${item.freezeSum }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${item.usableSum }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${item.totalSum }" type="currency" pattern="#,##0.00"/></td>
            	</tr>
            </c:forEach>
	                	</c:otherwise>
	             </c:choose>
	                
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
