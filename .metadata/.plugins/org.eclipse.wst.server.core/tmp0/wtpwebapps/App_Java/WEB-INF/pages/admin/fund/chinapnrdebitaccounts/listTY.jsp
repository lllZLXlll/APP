<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="TranStatusQueryIndex.do" method="post">
    	<br/>
		&nbsp;&nbsp;
		<a data-toggle="navtab" href="trfReconciliationIndex.do?tabid=${tabid}" data-id="changepwd_page" data-mask="true" class="btn btn-blue">&nbsp;商户扣款对账信息</a>&nbsp;&nbsp;
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageCurrent}">
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">订单号</th>
                <th align="center">投资人姓名</th>
                <th align="center">汇付交易状态</th>
                <th align="center">交易金额</th>
                <th align="center">汇付交易日期</th>
                <th align="center">体验金金额</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="bean" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>
						${bean.OrdId}
					</td>
					<td>
						${bean.username}
					</td>
					<td>
						成功
					</td>
					<td>
						${bean.stillInterest}
					</td>
					<td>
						<fmt:formatDate value="${bean.repayDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						${bean.stillPrincipal}
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
         <span style="color:red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投资总金额：${map.stillInterest }</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>