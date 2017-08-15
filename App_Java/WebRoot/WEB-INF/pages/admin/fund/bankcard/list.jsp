<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/queryUserBankInit.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <div class="bjui-searchBar">
        	<br/>&nbsp;&nbsp;
	       	<label>用户名：</label><input type="text" id="userName" value="${userName }" name="userName" class="form-control" >&nbsp;
	       
	        <label>真实姓名：</label><input type="text" id="realName" value="${realName }" name="realName" class="form-control" size="12">&nbsp;
	      
	        <label>提交时间：</label>
	        <input type="text" value="${startTime }" size="16" name="startTime" id="startTime" readonly="readonly" data-toggle="datepicker" placeholder="开始日期">
	        <label>——</label>
	        <input type="text" value="${endTime }" size="16" name="endTime" id="endTime" readonly="readonly" data-toggle="datepicker" placeholder="结束日期">
          
            <button type="button" id="submitBtn" class="btn-default" data-icon="search">查询</button>&nbsp;
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
                <th align="center">真实姓名</th>
                <th align="center">身份证</th>
                <th align="center">开户行</th>
                <th align="center">卡号</th>
                <th align="center">提交时间</th>
                <th align="center">状态</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="item" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${item.username }</td>
	                <td>${item.realName }</td>
	                <td>${item.idNo }</td>
	                <td>${item.bankName }</td>
	                <td>${item.cardNo }</td>
	                <td><fmt:formatDate value="${item.commitTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	                <c:if test="${item.cardStatus == 3 }">
	                	<td>失败</td>
	                	<td>--</td>
	                </c:if>
					 <c:if test="${item.cardStatus != 2 and item.cardStatus != 3 }">
	                	<td>成功</td>
	                	<td>
	                		<a href="queryBankCardInfo.do?bankId=${item.ids }&tabid=${tabid }" data-toggle="dialog" data-mask="true" 
	                		data-width="700" data-height="500" class="btn btn-green">查看</a>
	                	</td>
	                </c:if>
            	</tr>
            </c:forEach>
            <c:if test="${pageBean.page == null or pageBean.page == '[]' }">
            	<tr align="center">
            		<td align="center" colspan="9">暂无数据</td>
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
	$(function() {
		$("#submitBtn").click(function () {
			var usableSumMin = $("#usableSumMin").val();
			var usableSumMax = $("#usableSumMax").val();
			if (usableSumMin < 0 || usableSumMax < 0) {
				$(this).alertmsg('warn', '可用金额不能小于0！');
			} else {
				$("#pagerForm").submit();
			}
		});
	});
</script>