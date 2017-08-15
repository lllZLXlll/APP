<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">账户类型</th>
                <th align="center">可用余额（元）</th>
                <th align="center">账户余额（元）</th>
                <th align="center">冻结余额（元）</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${list }" var="beans" varStatus="status">
				<tr data-id="65" align="center">
	                <td>${beans.dataName }</td>
	                <td><fmt:formatNumber value="${beans.AvlBal }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${beans.AcctBal }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${beans.FrzBal }" type="currency" pattern="#,##0.00"/></td>
            	</tr>
            </c:forEach>
        </tbody>
    </table>
</div>
