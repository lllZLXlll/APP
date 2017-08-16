<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="userintegralcreditinfo.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <input type="hidden" name="userId" value="${userId}">
        <input type="hidden" name="type" value="${type}">
        
        <div class="pull-right">
           	<a href="exportUsercredit.do?id=${userId }&type=${type }" class="btn btn-orange" data-toggle="doexport" data-confirm-msg="确定要导出到execl吗？">导出execl</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">用户名</th>
                <th align="center">真实姓名</th>
                <th align="center">积分类型</th>
                <th align="center">备注</th>
                <th align="center">变动类型</th>
                <th align="center">变动分值</th>
                <th align="center">操作时间</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
             <c:choose>
	                	<c:when test="${pageBean.page == null or pageBean.page == '[]' }">
	                	<tr align="center">
            		<td align="center" colspan="8">暂无数据</td>
            	</tr>
	                	</c:when>
	                	<c:otherwise>
	                	<c:forEach items="${pageBean.page }" var="item" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${item.username }</td>
	                <td>${item.realName }</td>
	                <td>${item.intergraltype }</td>
	                <td>${item.remark }</td>
	                <td>${item.changetype }</td>
	                <td>${item.changerecore }</td>
	                <td><fmt:formatDate value="${item.changtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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