<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryborrowStatisUserGroupInit.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <label>用户组名：</label><input type="text" id="groupName" maxlength="20" value="${groupName }" name="groupName" maxlength="20" class="form-control" size="20">&nbsp;
            &nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
             <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
             	<a href="exportUserGroup.do" data-toggle="doexport" class="btn btn-green" data-icon="floppy-o" data-confirm-msg="确定要导出信息吗？">导出全部</a>
            </div>
        </div>
        <div class="bjui-moreSearch">
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr height="25px">
            	<th align="center">序号</th>
                <th align="center">组名</th>
                <th align="center">总金额(元)</th>
                <th align="center">冻结金额(元)</th>
                <th align="center">待收金额(元)</th>
                <th align="center">借款管理费金额(元)</th>
                <th align="center">待收利息总额(元)</th>
                <th align="center">VIP总额(元)</th>
                <th align="center">已还款总额(元)</th>
                <th align="center">投资总额(元)</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.groupName }</td>
                <td><fmt:formatNumber value="${data.totalSum }" type="currency" pattern="#,##0.00"/></td>
                <td><fmt:formatNumber value="${data.freezeSum }" type="currency" pattern="#,##0.00"/></td>
                <td><fmt:formatNumber value="${data.forPI }" type="currency" pattern="#,##0.00"/></td>
                <td><fmt:formatNumber value="${data.manageFee }" type="currency" pattern="#,##0.00"/></td>
                <td><fmt:formatNumber value="${data.forInterest }" type="currency" pattern="#,##0.00"/> </td>
                <td><fmt:formatNumber value="${data.vipFee }" type="currency" pattern="#,##0.00"/></td>
                <td><fmt:formatNumber value="${data.hasPI }" type="currency" pattern="#,##0.00"/></td>
                <td><fmt:formatNumber value="${data.realAmount }" type="currency" pattern="#,##0.00"/> </td>
            </tr>
            </c:forEach>
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
<script type="text/javascript">
	
</script>
