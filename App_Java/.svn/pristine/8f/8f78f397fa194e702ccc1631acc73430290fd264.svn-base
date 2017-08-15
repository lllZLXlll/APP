<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">标的编号</th>
                <th align="center">标的名称</th>
                <th align="center">客户名称</th>
                <th align="center">费用类型</th>
                <th align="center">费用金额（¥）</th>
                <th align="center">汇付是否扣款成功</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="0"></c:set> 
        	<c:forEach items="${page }" var="borrow" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${borrow.borrowId }</td>
	                <td>${borrow.borrowTitle }</td>
	                <td>${borrow.customerName }</td>
	                <td>
	                	<c:if test="${borrow.costType ==1}">平台使用费</c:if>
						<c:if test="${borrow.costType ==3}">借款管理费</c:if>
						<c:if test="${borrow.costType ==2}">借款手续费</c:if>
						<c:if test="${borrow.costType ==4}">机构担保费</c:if>		
                	</td>
	                <td>${borrow.costAmount }</td>
	                <td>
	                	<c:if test="${borrow.paymentStatus == 1000}">初始化</c:if>
	                	<c:if test="${borrow.paymentStatus == 1001}">成功</c:if>
	                	<c:if test="${borrow.paymentStatus == 1002}">失败</c:if>
                	</td>
	                <td>
                		<a href="updateManageFeeInit.do?id=${borrow.borrowId }&tabid=${tabid }" data-toggle="dialog" data-mask="true" data-width="700" data-height="500" class="btn btn-green">编辑</a>
	                </td>
            	</tr>
            </c:forEach>
             <c:if test="${page == null or page == '[]' }">
            	<tr align="center">
            		<td align="center" colspan="8">暂无数据</td>
            	</tr>
            </c:if>
        </tbody>
    </table>
</div>