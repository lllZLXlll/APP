<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryUserMoeryInit.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
        	<br/>
            <label>用户名：</label><input type="text" value="${userName }" name="userName" class="form-control" maxlength="20" size="12">&nbsp;
           
            <label>真实姓名：</label><input type="text" value="${realName }" name="realName" class="form-control" maxlength="20" size="12">&nbsp;
           
            <label>金额：</label><input type="text" value="${money }" name="money" id="money" class="form-control" maxlength="20" size="12">&nbsp;
           
            <label>发放时间：</label>
	        <input type="text" value="${startTime }" size="16" name="startTime" id="startTime" readonly="readonly" data-toggle="datepicker" placeholder="开始日期">
	        <label>—</label>
	        <input type="text" value="${endTime }" size="16" name="endTime" id="endTime" readonly="readonly" data-toggle="datepicker" placeholder="结束日期">
			&nbsp;
			
			<label>使用时间：</label>
	        <input type="text" value="${startTime1 }" size="16" name="startTime1" id="startTime1" readonly="readonly" data-toggle="datepicker" placeholder="开始日期">
	        <label>—</label>
	        <input type="text" value="${endTime1 }" size="16" name="endTime1" id="endTime1" readonly="readonly" data-toggle="datepicker" placeholder="结束日期">
			&nbsp;
            
            <label>使用状态：</label> 
            <select name="status" id="status" data-toggle="selectpicker" >
                <option value="-1">请选择</option>
                <option value="1" ${status ==1?'selected':''}>未使用</option>
                <option value="2" ${status ==2?'selected':''}>已使用</option>
                <option value="3" ${status ==3?'selected':''}>已过期</option>
                <option value="4" ${status ==4?'selected':''}>未发放</option>
            </select>&nbsp;
            <button type="button" id="submitBtn1" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
            </div>
        </div>
        <div class="bjui-moreSearch">
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">序号</th>
            	<th align="center">类型</th>
                <th align="center">用户名</th>
                <th align="center">真实姓名</th>
                <th align="center">投资金额（元）</th>
                <th align="center">发放时间</th>
                <th align="center">使用时间</th>
                <th align="center">使用状态</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               	<td >${status.index+1+count }</td>
                <td >体验金</td>
                <td>${data.username }</td>
                <td>${data.realName }</td>
                <td><fmt:formatNumber value="${data.investAmount }" type="currency" pattern="#,##0.00"/></td>
                <td><fmt:formatDate value="${data.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td><fmt:formatDate value="${data.investTime }" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
                <td>
                	<c:choose>
						<c:when test="${data.accountSum>'0.00' and data.createTime > experienceMoneyDate }">
							未使用
						</c:when>
						<c:when test="${data.accountSum=='0.00' and data.investTime!= null }">
							已使用
						</c:when>
						<c:when test="${data.accountSum>'0.00' and data.createTime <= experienceMoneyDate }">
							已过期
						</c:when>
						<c:when test="${data.accountSum=='0.00' and data.investTime==null }">
							未发放
						</c:when>
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
            	<option value="20">20</option>
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
		$("#submitBtn1").click(function () {
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			if ((startTime != null && startTime.trim() != '') && (endTime == null || endTime.trim() == '')) {
				$(this).alertmsg('warn', '请选择结束时间！');
				return;
			} else if ((endTime != null && endTime.trim() != '') && (startTime == null || startTime.trim() == '')) {
				$(this).alertmsg('warn', '请选择开始时间！');
				return;
			}
			var startTime1 = $("#startTime1").val();
			var endTime1 = $("#endTime1").val();
			if ((startTime1 != null && startTime1.trim() != '') && (endTime1 == null || endTime1.trim() == '')) {
				$(this).alertmsg('warn', '请选择结束时间！');
				return;
			} else if ((endTime1 != null && endTime1.trim() != '') && (startTime1 == null || startTime1.trim() == '')) {
				$(this).alertmsg('warn', '请选择开始时间！');
				return;
			}
			
			var money = $("#money").val();
			if (isNaN(money)) {
				$(this).alertmsg('warn', '请输入正确的金额！');
				return;
			}
			
			var startDate = new Date(startTime).getTime();
			var endDate = new Date(endTime).getTime();
			var startDate1 = new Date(startTime1).getTime();
			var endDate1 = new Date(endTime1).getTime();
			if (startDate > endDate) {
				$(this).alertmsg('warn', '开始时间不能大于结束时间！');
				return;
			} else if (startDate1 > endDate1) {
				$(this).alertmsg('warn', '开始时间不能大于结束时间！');
				return;
			} else {
				$("#pagerForm").submit();
			}
		});
	});
</script>
