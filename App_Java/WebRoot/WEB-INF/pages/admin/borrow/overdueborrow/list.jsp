<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/lateRepayInit.do" method="post">
      	<input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <div class="bjui-searchBar">
        <br/>&nbsp;&nbsp;
			<a href="javascript:;" data-toggle="navtab" class="btn btn-blue"
        		data-options="{id:'overduePaymentInit', url:'overduePaymentInit.do?tabid=overduePaymentInit', title:'逾期垫付'}">
       			逾期垫付
       		</a>
        	
			<label>用户名：</label><input type="text" value="${userName }" name="userName" class="form-control" size="16">&nbsp;
        
            <label>借款类型:</label>
            <select data-toggle="selectpicker" name="borrowWay">
	           	<option value="">--请选择--</option>
	           	<option value="2" ${borrowWay == 2 ? 'selected' : ''}>体验标</option>
	           	<option value="3" ${borrowWay == 3 ? 'selected' : ''}>多金宝</option>
	           	<option value="4" ${borrowWay == 4 ? 'selected' : ''}>普金保</option>
	           	<option value="5" ${borrowWay == 5 ? 'selected' : ''}>新手标</option>
	           	<option value="6" ${borrowWay == 6 ? 'selected' : ''}>恒金保</option>
	        </select>&nbsp;
            
            <label>还款状态:</label>
            <select data-toggle="selectpicker" name="borrowState">
	           	<option value="">--请选择--</option>
	           	<option value="1" ${borrowState == 1 ? 'selected' : ''}>未偿还</option>
	           	<option value="2" ${borrowState == 2 ? 'selected' : ''}>已偿还</option>
	           	<option value="3" ${borrowState == 3 ? 'selected' : ''}>偿还中</option>
	        </select>&nbsp;
            
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
        	
        	<div class="pull-right">
               	<a href="exportlateRepay.do?id=1&&userName=${userName }&&borrowWay=${borrowWay }&&borrowState=${borrowState }" class="btn btn-orange" data-toggle="doexport" data-confirm-msg="确定要导出excel吗？">导出excel</a>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">用户名</th>
                <th align="center">真实姓名</th>
                <th align="center">借款标题</th>
                <th align="center">期数</th>
                <th align="center">类型</th>
                <th align="center">应还时间</th>
                <th align="center">逾期天数（天）</th>
                <th align="center">应还金额（¥）</th>
                <th align="center">逾期金额（¥）</th>
                <th align="center">总还款（¥）</th>
                <th align="center">网站待还</th>
                <th align="center">还款状态</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="borrow" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${borrow.username }</td>
	                <td>${borrow.realName }</td>
	                <td><a href="/pjzb/WEB-PC/invest.html?id=${borrow.id}">${borrow.borrowTitle }</a></td>
	                <td>${borrow.repayPeriod }</td>
	                <td>
			           	<c:if test="${borrow.borrowWay == 2 }">体验标</c:if>
			           	<c:if test="${borrow.borrowWay == 3 }">多金宝</c:if>
			           	<c:if test="${borrow.borrowWay == 4 }">普金保</c:if>
			           	<c:if test="${borrow.borrowWay == 5 }">新手标</c:if>
			           	<c:if test="${borrow.borrowWay == 6 }">恒金保</c:if>
	                </td>
	                <td>${borrow.repayDate }</td>
	                <td>${borrow.lateDay }</td>
	                <td>${borrow.totalSum }</td>
	                <td>${borrow.lateFI }</td>
	                <td>${borrow.repaySum }</td>
	                <td>
	                	<c:if test="${borrow.isWebRepay == 1 }">否</c:if>
	                	<c:if test="${borrow.isWebRepay == 2 }">是</c:if>
	                </td>
	                <td>
	                	<c:if test="${borrow.repayStatus == 1 }">未偿还</c:if>
	                	<c:if test="${borrow.repayStatus == 2 }">已偿还</c:if>
	                	<c:if test="${borrow.repayStatus == 3 }">偿还中</c:if>
	                </td>
	                
	                <td>
                		<a href="repaymentDetail.do?id=${borrow.id}&tabid=repay0${borrow.id }" class="btn btn-green" 
							data-toggle="navtab" data-id="repay0${borrow.id }" data-title="还款详情">查看</a>
	                </td>
            	</tr>
            </c:forEach>
            <c:if test="${pageBean.page == null or pageBean.page == '[]' }">
            	<tr align="center">
            		<td align="center" colspan="14">暂无数据</td>
            	</tr>
            </c:if>
            
            <tr>
				<td colspan="2" rowspan="3" align="center" ><strong>合计项</strong></td>
				<td colspan="2" align="right" >逾期应还总金额:</td>
				<td colspan="2" align="center"><c:if test="${map.totalSumm=='' or map.totalSumm==null }">¥0.00</c:if><c:if test="${map.totalSumm!='' }"><fmt:formatNumber value="${map.totalSumm }" type="number" pattern="￥0.00" /></c:if></td>
				<td colspan="2" align="right">当前页逾期应还金额：</td>
				<td colspan="2" align="center" ><fmt:formatNumber value="${totalSum }" type="number" pattern="￥0.00" /></td>	<td></td><td></td><td></td><td></td>		
				</tr>
				<tr>
				<td colspan="2" align="right" >逾期总金额:</td>
				<td colspan="2" align="center"><c:if test="${map.totallateFI=='' or map.totallateFI==null }">¥0.00</c:if><c:if test="${map.totallateFI!='' }"><fmt:formatNumber value="${map.totallateFI }" type="number" pattern="￥0.00" /></c:if></td>
				<td colspan="2" align="right">当前页逾期金额：</td>
				<td colspan="2" align="center" ><fmt:formatNumber value="${lateFI }" type="number" pattern="￥0.00" /></td><td></td><td></td><td></td><td></td>
				</tr>
				<tr>
				<td colspan="2" align="right" >逾期还款总金额:</td>
				<td colspan="2" align="center"><c:if test="${map.amount=='' or map.amount==null }">¥0.00</c:if><c:if test="${map.amount!='' }"><fmt:formatNumber value="${map.amount }" type="number" pattern="￥0.00" /></c:if></td>
				<td colspan="2" align="right">当前页逾期还款金额：</td>
				<td colspan="2" align="center" ><fmt:formatNumber value="${lateAmount }" type="number" pattern="￥0.00" /></td><td></td><td></td><td></td><td></td>
			</tr>
            
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
        <span>&nbsp;条，共 ${pageBean.totalNum } 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>