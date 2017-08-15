<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<script type="text/javascript">

</script>
<div class="bjui-pageContent tableContent" style="margin-top:40px;">
   	<input type="hidden" name="tabid" value="${tabid}">
   	<table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
  		<tr>
		    <th align="center">投资人</th>
		    <th align="center">期数</th>
		    <th align="center">还款时间</th>
		    <th align="center">已收本金</th>
		    <th align="center">已收利息</th>
		    <th align="center">是否逾期</th>
		    <th align="center">逾期天数</th>
		    <th align="center">已收罚息</th>
		    <th align="center">是否网站垫付</th>
    		<th align="center">还款人</th>
    	</tr>
    	<c:forEach items="${borrow }" var="borrow" varStatus="status">
		 <tr data-id="65" align="center">
		   <td align="center">${borrow.username}</td>
		   <td align="center">${borrow.repayPeriod}</td>
		   <td align="center">${borrow.realRepayDate}</td>
		   <td align="center">￥${borrow.hasPrincipal }</td>
		   <td align="center">￥${borrow.hasInterest}</td>
		   <td align="center"><c:choose><c:when test="${borrow.isLate == 1}">否</c:when><c:otherwise>是</c:otherwise></c:choose></td>
		   <td align="center">${borrow.lateDay}</td>
		   <td align="center">￥${borrow.recivedFI}</td>
		   <td align="center"><c:choose><c:when test="${borrow.isWebRepay == 1}">否</c:when><c:otherwise>是</c:otherwise></c:choose></td>
		   <td align="center"><c:choose><c:when test="${borrow.isWebRepay == 2}">网站垫付</c:when><c:otherwise>${borrow.borrowName}</c:otherwise></c:choose></td>
	     </tr>
	     </c:forEach>
</table>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">确定</button></li>
    </ul>
</div>