<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/borrowtypeinitlist.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">标的类型</th>
                <th align="center">所属标种类型</th>
                <th align="center">状态</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="item" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${item.name }</td>
	                <td>${item.typeName }</td>
	                <td>
	                	<c:if test="${item.state == 0 }">已开启</c:if>
	                	<c:if test="${item.state == 1 }">已关闭</c:if>
	                </td>
	                <td>
	                	<c:if test="${item.state == 0 }">
	                		<a href="updateStateBorrowType.do?id=${item.id }&state=1&tabid=${tabid }" class="btn btn-green" data-toggle="doajax" data-confirm-msg="确定关闭吗？">关闭</a>
                		</c:if>
	                	<c:if test="${item.state == 1 }">
	                		<a href="updateStateBorrowType.do?id=${item.id }&state=0&tabid=${tabid }" class="btn btn-green" data-toggle="doajax" data-confirm-msg="确定开启吗？">开启</a>
	                	</c:if>
	                </td>
            	</tr>
            </c:forEach>
            <c:if test="${pageBean.page == null or pageBean.page == '[]' }">
            	<tr align="center">
            		<td align="center" colspan="5">暂无数据</td>
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
        <span>&nbsp;条，共 ${pageBean.totalNum } 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>