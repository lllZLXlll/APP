<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryRechargeRecordInit.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageCurrent}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <a data-toggle="navtab" href="queryRechargeFirstInit.do?tabid=${tabid}" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;第一次充值查询</a>&nbsp;&nbsp;
        	
	       	<label>用户名：</label><input type="text" id="userName" value="${userName }" name="userName" class="form-control" size="12">&nbsp;
	        
			<label>提交时间：</label>
	        <input type="text" value="${startTime }" size="16" name="startTime" id="startTime" readonly="readonly" data-toggle="datepicker" placeholder="开始日期">
	        <label>——</label>
	        <input type="text" value="${endTime }" size="16" name="endTime" id="endTime" readonly="readonly" data-toggle="datepicker" placeholder="结束日期">&nbsp;
	        <label>充值类型：</label>
		 	<select name="rechargeType" id="rechargeType" data-toggle="selectpicker">
            	<option value="-1">-请选择-</option>
               	<option value="2" ${rechargeType ==2?'selected':''}>环迅支付</option>
               	<option value="3" ${rechargeType ==3?'selected':''}>国付宝</option>
               	<option value="4" ${rechargeType ==4?'selected':''}>线下充值</option>
               	<option value="51" ${rechargeType ==51?'selected':''}>手工充值</option>
               	<option value="53" ${rechargeType ==53?'selected':''}>奖励充值</option>
           	</select>&nbsp;   
        	<label>状态：</label>
		 	<select name="result" id="result" data-toggle="selectpicker">
            	<option value="-1">-请选择-</option>
               	<option value="1" ${result ==1?'selected':''}>成功</option>
               	<option value="0" ${result ==0?'selected':''}>失败</option>
           	</select>&nbsp;   
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>&nbsp;
            <div class="pull-right">
          		<a href="exportRechargeRecord.do?pageSize=${pageSize }&pageCurrent=${pageCurrent }&tabid=${tabid }&userName=${userName }&startTime=${startTime }&endTime=${endTime }&rechargeType=${rechargeType }&result=${result }" class="btn btn-orange" data-toggle="doexport" data-confirm-msg="确定要导出到excel？">导出excel</a>
       		</div>
        </div>
    </form>
      <div style="text-align: center;margin-bottom: 7px">
      	充值总额：
<fmt:formatNumber value="${map.rechargeMoneys}" type="currency" pattern="#,##0.00"/> &nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;到帐总额：<fmt:formatNumber value="${map.realMoneys }" type="currency" pattern="#,##0.00"/>&nbsp;元
      </div>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">用户名</th>
                <th align="center">充值类型</th>
                <th align="center">流水号</th>
                <th align="center">充值金额</th>
                <th align="center">费率</th>
                <th align="center">到账金额</th>
                <th align="center">充值时间</th>
                <th align="center">状态</th>  
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="beans" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${beans.username }</td>
	                <td>汇付充值</td>
	                <td>${beans.billcode }</td>
	                <td>
					<fmt:formatNumber value="${beans.rechargeMoney }" type="currency" pattern="#,##0.00"/></td>
	                <td>${beans.cost }</td>
	                <td><fmt:formatNumber value="${beans.realMoney }" type="currency" pattern="#,##0.00"/></td>
	                <td>${beans.rechargeTime }</td>
	                <td>
	                	<c:if test="${beans.result == 0 }">失败</c:if>
	                	<c:if test="${beans.result == 1 }">成功</c:if>
	                </td>
	                <td>
                		<a href="queryOneFirstChargeDetails.do?id=${beans.id }" data-toggle="dialog" data-mask="true" data-width="750" data-height="500" class="btn btn-green">查看</a>
	                </td>
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