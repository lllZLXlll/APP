<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/queryShoveBorrowAllInit.do" method="post">
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
                <th align="center">还款方式</th>
                <th align="center">标识符</th>
                <th align="center">标题</th>
                <th align="center">状态</th>
                <th align="center">算法信息</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="borrow" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${borrow.name }</td>
	                <td>${borrow.nid }</td>
	                <td>${borrow.title }</td>
	                <td>
                		<c:if test="${borrow.status == 1 }">开启</c:if>
			           	<c:if test="${borrow.status != 1 }">关闭</c:if>
	                </td>
	                <td>${borrow.contents }</td>
	                <td>
                		<a href="updateShoveBorrowStyleInit.do?tabid=${tabid }&&id=${borrow.id}" data-toggle="dialog" data-id="updateShoveBorrow" data-mask="true" data-width="500" data-height="400" class="btn btn-blue">修改</a>
	                </td>
            	</tr>
            </c:forEach>
            <c:if test="${pageBean.page == null or pageBean.page == '[]' }">
            	<tr align="center">
            		<td align="center" colspan="7">暂无数据</td>
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