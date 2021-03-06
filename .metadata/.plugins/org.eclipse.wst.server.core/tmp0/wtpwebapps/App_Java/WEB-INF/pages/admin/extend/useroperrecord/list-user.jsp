<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
	
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/queryRecordInit.do?operation_around=${operation_around1}" method="post">
    	<div class="bjui-searchBar">
	        <input type="hidden" name="tabid" value="${tabid}">
	        <input type="hidden" name="pageSize" value="${pageSize}">
	        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
	       	<br/>&nbsp;&nbsp;
	       	<label>用户名：</label><input type="text" id="userName" value="${userName }" name="userName" class="form-control">&nbsp;
	        
			<label>操作时间：</label>
	        <input type="text" value="${startTime }" size="16" name="startTime" id="startTime" readonly="readonly" data-toggle="datepicker" placeholder="开始日期">
	        <label>——</label>
	        <input type="text" value="${endTime }" size="16" name="endTime" id="endTime" readonly="readonly" data-toggle="datepicker" placeholder="结束日期">&nbsp;
			
           	<button type="button" onclick="submitBtn()" class="btn-default" data-icon="search">查询</button>&nbsp;
           	<a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
        </div>
    </form>
    
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">用户名</th>
                <th align="center">操作类型</th>
                <th align="center">操作时间</th>
                <th align="center">操作内容</th>
                <th align="center">操作金额（¥）</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="item" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${item.operation_user }</td>
	                <td>
                		<c:if test="${item.operation_type==1 }">增加</c:if>
                		<c:if test="${item.operation_type==2 }">修改</c:if>
                		<c:if test="${item.operation_type==3 }">删除</c:if>
                		<c:if test="${item.operation_type==4 }">下载</c:if>
                		<c:if test="${item.operation_type==5 }">导出Excel</c:if>
               		</td>
	                <td><fmt:formatDate value="${item.operation_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	                <td>${item.operation_remarks }</td>
	                <td>
	                	<c:if test="${item.operation_money == null or item.operation_money == '' }">0.0</c:if>
	                	<c:if test="${item.operation_money != null and item.operation_money != '' }">${item.operation_money }</c:if>
                	</td>
            	</tr>
            </c:forEach>
            <c:if test="${pageBean.page == null or pageBean.page == '[]' }">
            	<tr align="center">
            		<td align="center" colspan="6">暂无数据</td>
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
<script>
	function submitBtn() {
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
		if ((startTime != null && startTime.trim() != '') && (endTime == null || endTime.trim() == '')) {
			$(this).alertmsg('warn', '请选择结束时间！');
			return;
		} else if ((endTime != null && endTime.trim() != '') && (startTime == null || startTime.trim() == '')) {
			$(this).alertmsg('warn', '请选择开始时间！');
			return;
		}
		
		var startDate = new Date(startTime).getTime();
		var endDate = new Date(endTime).getTime();
		if (startDate > endDate) {
			$(this).alertmsg('warn', '开始时间不能大于结束时间！');
			return;
		} else {
			$("#pagerForm").submit();
		}
	}
	
	function resetQuery() {
		$("#userName").val("");
		$("#startTime").val("");
		$("#endTime").val("");
		$("#pagerForm").submit();
	}
</script>