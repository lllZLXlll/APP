<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="saveReconciliation.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageCurrent}">
         <div style="text-align: center;margin-bottom: 7px;margin-top:7px;font-size: 16">
   		  <span style="font-weight:bold;font-size: 15">投资总金额：</span>
   		 <span style="font-size: 15">
		  <fmt:formatNumber value="${map.TransAmts }" type="currency" pattern="#,##0.00"/></span>&nbsp;元
       </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">订单号</th>
                <th align="center">投资人姓名</th>
                <th align="center">订单时间</th>
                <th align="center">交易金额（元）</th>
                <th align="center">汇付交易状态</th>
                <th align="center">支付网关业务</th>
                <th align="center">开户银行</th>
                <th align="center">银行账号</th>
                <th align="center">手续费金额（元）</th>
                <th align="center">数据采集时间</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        			<c:choose>
	                	<c:when test="${pageBean.page == null or pageBean.page == '[]' }">
	                		<tr align="center">
            					<td align="center" colspan="9">暂无数据</td>
            				</tr>
	                	</c:when>
	                	<c:otherwise>
	                		       
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
						${bean.OrdDate}
					</td>
					<td>
						<fmt:formatNumber value="${bean.TransAmt}" type="currency" pattern="#,##0.00"/>
					</td>
					<td>
						<c:if test="${bean.TransStat=='I' }">初始化</c:if>
						<c:if test="${bean.TransStat=='F' }">失败</c:if>
						<c:if test="${bean.TransStat=='S' }">成功</c:if>
					</td>
					<td>
						${bean.busiName}
					</td>
					<td>
						${bean.bankName}
					</td>
					<td>
						${bean.OpenAcctId}
					</td>
					<td>
						<fmt:formatNumber value="${bean.FeeAmt}" type="currency" pattern="#,##0.00"/>
					</td>
					<td><fmt:formatDate value="${bean.InDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            	</tr>
            </c:forEach>
	                	</c:otherwise>
	                </c:choose>
            	
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
