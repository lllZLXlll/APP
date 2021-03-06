<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="userFundInit.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <div class="bjui-searchBar">
        	<br/>
        &nbsp;&nbsp;
	       	<label>用户名：</label><input type="text" id="userName" value="${userName }" name="userName" class="form-control" size="12">&nbsp;
	        <label>真实姓名：</label><input type="text" id="realName" value="${realName }" name="realName" class="form-control" size="12">&nbsp;
	        <label>可用余额：</label>
	        <input type="text" id="usableSumMin" value="${usableSumMin }" name="usableSumMin" class="form-control" size="12">
	        <label>—</label><input type="text" id="usableSumMax" value="${usableSumMax }" name="usableSumMax" class="form-control" size="12">&nbsp;
            <button type="button" id="submitBtn" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
             <div class="pull-right">
             <a href="javascript:;" data-toggle="navtab" class="btn btn-blue"
		    	data-options="{id:'userFundDetail', url:'queryAllUserFundRecordInit.do?tabid=userFundDetail', title:'资金明细'}">
				资金明细
			</a>
             </div>
        </div>
    </form>
    <div style="text-align: center;margin-bottom: 7px;font-size: 16">
    	<span style="font-weight:bold;">总计：可用总额：</span><fmt:formatNumber value="${map.usableSums }" type="currency" pattern="#,##0.00"/>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<span style="font-weight:bold;">冻结总额：</span><fmt:formatNumber value="${map.freezeSums }" type="currency" pattern="#,##0.00"/>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<span style="font-weight:bold;">待收总额：</span><fmt:formatNumber value="${map.dueinSums }" type="currency" pattern="#,##0.00"/>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<span style="font-weight:bold;">待还总额：</span><fmt:formatNumber value="${map.dueoutSums }" type="currency" pattern="#,##0.00"/>&nbsp;元
    </div>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
      
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">用户名</th>
                <th align="center">真实姓名</th>
                <th align="center">可用余额（￥元）</th>
                <th align="center">冻结金额（￥元）</th>
                <th align="center">待收金额（￥元）</th>
                <th align="center">待还金额（￥元）</th>
                <th align="center">总金额（￥元）</th>
                <th align="center">生利宝余额（￥元）</th>
                <th align="center">操作</th>
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
	                	<c:forEach items="${pageBean.page }" var="item" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${item.username }</td>
	                <td>${item.realName }</td>
	                <td><fmt:formatNumber value="${item.usableSum }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${item.freezeSum }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${item.dueinSum }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${item.dueoutSum }" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${item.freezeSum + item.usableSum + item.dueinSum}" type="currency" pattern="#,##0.00"/></td>
	                <td><fmt:formatNumber value="${item.slbaoTotalAmt}" type="currency" pattern="#,##0.00"/></td>
	                <td>
	                	<a href="javascript:;" data-toggle="navtab" class="btn btn-green"
	                	data-options="{id:'userFund${status.index+1+count }', url:'queryUserFundRechargeInit.do?id=${item.ids}&tabid=userFund${status.index+1+count }', title:'${item.realName }-充值记录详情'}">
                			充值记录
                		</a>
                		&nbsp;
                		<a href="javascript:;" data-toggle="navtab" class="btn btn-green"
	                	data-options="{id:'userFund${status.index+2+count }', url:'queryUserFundWithdrawInit.do?id=${item.ids}&tabid=userFund${status.index+2+count }', title:'${item.realName }-提现管理详情'}">
                			提现管理
                		</a>
                		&nbsp;
                		<a href="javascript:;" data-toggle="navtab" class="btn btn-green"
	                	data-options="{id:'userFund${status.index+3+count }', url:'queryUserFundrecordInit.do?id=${item.ids}&tabid=userFund${status.index+3+count }&userName=${item.username }', title:'${item.realName }-资金记录详情'}">
                			资金记录
                		</a>
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
<script>
	$(function() {
		$("#submitBtn").click(function () {
			var usableSumMin = $("#usableSumMin").val();
			var usableSumMax = $("#usableSumMax").val();
			if (usableSumMin < 0 || usableSumMax < 0) {
				$(this).alertmsg('warn', '可用金额不能小于0！');
			} else {
				$("#pagerForm").submit();
			}
		});
	});
</script>