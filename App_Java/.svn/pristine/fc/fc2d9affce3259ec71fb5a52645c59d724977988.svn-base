<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="companyFundRecordInit.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <div class="bjui-searchBar">
        <br/>&nbsp;&nbsp;
        	<a href="addCompanyFundRecordInit.do?tabid=${tabid }" data-toggle="dialog" 
        	data-mask="true" data-width="700" data-height="500" class="btn btn-blue">增加企业资金记录</a>
         	&nbsp;
         	<label>收支类型：</label>
	        <select data-toggle="selectpicker" name="riskType">
	           	<option value="">全部</option>
	           	<option value="收入" ${riskType == '收入' ? 'selected' : ''}>收入</option>
	           	<option value="支出" ${riskType == '支出' ? 'selected' : ''}>支出</option>
	        </select>
	        
	        &nbsp;
	        <label>收入金额：</label><input type="text" id="riskInCome" value="${riskInCome }" name="riskInCome" class="form-control" >&nbsp;
	        
	        &nbsp;
	        <label>支出金额：</label><input type="text" id="riskSpending" value="${riskSpending }" name="riskSpending" class="form-control" >&nbsp;
	        &nbsp;
	         <button type="button" id="submitBtn1" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
	        <br/><br/>&nbsp;&nbsp;
	        <label>记录时间：</label>
	        <input type="text" value="${beginRiskDate }" size="16" name="beginRiskDate" id="startTime" readonly="readonly" data-toggle="datepicker" placeholder="开始日期">
	        <label>——</label>
	        <input type="text" value="${endRiskDate }" size="16" name="endRiskDate" id="endTime" readonly="readonly" data-toggle="datepicker" placeholder="结束日期">
			
			&nbsp;
	        <label>消费来源：</label><input type="text" id="resource" value="${resource }" name="resource" class="form-control" >&nbsp;
	        
			&nbsp;
            <div class="pull-right">
               	<a href="exportCompanyFundRecord.do" data-toggle="doexport" class="btn btn-green" data-icon="floppy-o" data-confirm-msg="确定要导出所有信息吗？">导出全部记录</a>
            </div>
        </div>
    </form>
     <div style="text-align: center;margin-bottom: 7px">
    
    <span style="font-size: 16px;">当前页收入总金额（￥）：</span>
    <span style="font-size: 16px;font-weight: bold;">
     <fmt:formatNumber value="${currentPageIncome}" type="currency" pattern="#,##0.00"/></span>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
    <span style="font-size: 16px;">当前页支出总金额（￥）：</span>
    <span style="font-size: 16px;font-weight: bold;">
     <fmt:formatNumber value="${currentPageSpending }" type="currency" pattern="#,##0.00"/></span>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
    
    
    <span style="font-size: 16px;">收入金额合计（￥）：</span>
    <span style="font-size: 16px;font-weight: bold;">
    <fmt:formatNumber value="${totalIncome}" type="currency" pattern="#,##0.00"/></span>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
    <span style="font-size: 16px;">支出金额合计（￥）：</span>
    <span style="font-size: 16px;font-weight: bold;">
    <fmt:formatNumber value="${totalSpending }" type="currency" pattern="#,##0.00"/></span>&nbsp;元
    
    </div>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">收入金额（￥元）</th>
                <th align="center">支出金额（￥元）</th>
                <th align="center">记录时间</th>
                <th align="center">余额（￥元）</th>
                <th align="center">收支类型</th>
                <th align="center">消费来源</th>
                <th align="center">交易方姓名</th>
                <th align="center">备注</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="item" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
                 	<td>
                 	<fmt:formatNumber value="${item.riskInCome }" type="currency" pattern="#,##0.00"/>
                 	</td>
	                <td>
	                 <fmt:formatNumber value="${item.riskSpending }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatDate value="${item.riskDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	                <td><fmt:formatNumber value="${item.riskBalance }" type="currency" pattern="#,##0.00"/></td>
	                <td>${item.riskType }</td>
	                <td>${item.resource }</td>
	                <td>${item.realName }</td>
	                <td>${item.remark }</td>
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
			
			var startDate = new Date(startTime).getTime();
			var endDate = new Date(endTime).getTime();
			if (startDate > endDate) {
				$(this).alertmsg('warn', '开始时间不能大于结束时间！');
				return;
			} else {
				$("#pagerForm").submit();
			}
		});
	});
</script>