<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryReconciliationInit.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <%-- <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageCurrent}"> --%>
        <div class="bjui-searchBar">
        	<br/>&nbsp;&nbsp;
	       	<label>投资人：</label><input type="text" id="investCustId" value="${investCustId }" name="investCustId" class="form-control" >&nbsp;
	        <label>借款人：</label><input type="text" id="borrCustId" value="${borrCustId }" name="borrCustId" class="form-control" size="12">&nbsp;
	        <label>类型：</label>
			<select name="queryTransType" id="queryTransType" data-toggle="selectpicker">
            	<option value="">-请选择-</option>
               	<option value="LOANS" ${queryTransType =='LOANS'?'selected':''}>放款</option>
               	<option value="REPAYMENT" ${queryTransType =='REPAYMENT'?'selected':''}>还款</option>
           	</select>&nbsp;            
            <button type="submit" id="submitBtn" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
        </div>
    </form>
    <div style="text-align: center;margin-bottom: 7px;font-size: 16">
          <span style="font-weight:bold;">交易总金额：</span>
          <fmt:formatNumber value="${map.TransAmts }" type="currency" pattern="#,##0.00"/>&nbsp;元
    </div>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">订单号</th>
                <th align="center">商户名称</th>
                <th align="center">投资人</th>
                <th align="center">借款人</th>
                <th align="center">交易金额（元）</th>
                <th align="center">汇付交易状态</th>
                <th align="center">汇付交易日期</th>
                <th align="center">汇付交易流水</th>
                <th align="center">类型</th>
                <th align="center">订单日期</th>
                <th align="center">分账信息</th>
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
						${bean.ordId}
					</td>
					<td>
						${bean.merCustId}
					</td>
					<td>
						${bean.investCustId}
					</td>
					<td>
						${bean.borrCustId}
					</td>
					<td>
						<fmt:formatNumber value="${bean.transAmt}" type="currency" pattern="#,##0.00"/>
					</td>
					<td>
						<c:if test="${bean.transStat=='I' }">初始化</c:if>
						<c:if test="${bean.transStat=='P' }">成功</c:if>
					</td>
					<td>
						<fmt:formatDate value="${bean.pnrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						${bean.pnrSeqId}
					</td>
					<td>
						<c:if test="${bean.queryTransType=='LOANS' }">放款</c:if>
						<c:if test="${bean.queryTransType=='REPAYMENT' }">还款</c:if>
					</td>
					<td>
						<fmt:formatDate value="${bean.ordDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						<c:choose>
							<c:when test="${bean.queryTransType=='LOANS' }">
	                			<a href="queryDivide_Account.do?ordId=${bean.ordId }" data-toggle="dialog" data-mask="true" data-width="750" data-height="500" class="btn btn-green">查看</a>
	                		</c:when>
	                		<c:otherwise>
	                			无信息
	                		</c:otherwise>
                		</c:choose>
	                </td>
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
