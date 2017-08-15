<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryUserInvestorInfo.do?userId=${userId}" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <label>投资时间：</label> <input type="text" name="beginDate" id="beginDate"  data-toggle="datepicker"
                       data-pattern="yyyy-MM-dd" value="${beginDate }" readonly="readonly" size="20">&nbsp;-&nbsp;
            </label> <input type="text" name="endDate" id="endDate" readonly="readonly" data-toggle="datepicker"
                       data-pattern="yyyy-MM-dd" value="${endDate }" size="20">
            &nbsp;&nbsp;
            <button type="button" class="btn-default" id="searchButton" data-icon="search">查询</button>&nbsp;
             <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
            </div>
        </div>
        <div class="bjui-moreSearch">
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">序号</th>
                <th align="center">用户名</th>
                <th align="center">真实姓名</th>
                <th align="center">手机号码</th>
                <th align="center">投资标题</th>
                <th align="center">投资金额（￥元）</th>
                <th align="center">投资时间</th>
                <th align="center">还款方式</th>
                <th align="center">投资期限</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.username }</td>
                <td>${data.realName }</td>
                <td>${data.cellPhone }</td>
                <td>${data.borrowTitle }</td>
                <td><fmt:formatNumber value="${data.investAmount }" type="currency" pattern="#,##0.00"/> </td>
                <td>
                <fmt:formatDate value="${data.investTime }" pattern="yyyy-MM-dd HH:mm:ss" />
            </td>
                <td>
                	 <c:choose>
					<c:when test="${data.paymentMode ==1 }">
						  按月等额本息还款
					</c:when>
					
					<c:when test="${data.paymentMode ==2 }">
						按先息后本还款
					</c:when>
					
					<c:when test="${data.paymentMode ==3 }">
						秒还
					</c:when>
					<c:otherwise>
							一次性还款
					</c:otherwise>
				</c:choose>
                </td>
                
                
                <td>
                   ${data.deadline}
                 	 <c:choose>
					<c:when test="${data.isDayThe ==1 }">
						个月
					</c:when>
					<c:otherwise>
							天
					</c:otherwise>
				</c:choose>
                </td>
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
	$("#searchButton").click(function(){
		var beginTime = $("#beginDate").val();
		var endTime = $("#endDate").val();
		beginTime = beginTime.replace(/-/g, '/');
		endTime = endTime.replace(/-/g, "/");
		var date1 = new Date(beginTime); // 开始时间
		var date2 = new Date(endTime); // 结束时间
		var date3=date2.getTime()-date1.getTime();  //时间差的毫秒数
		var beginTimeLength=beginTime.trim().length;
		var endTimeLength=endTime.trim().length;
		if (beginTimeLength == 0 && endTimeLength==0) {
			$('#pagerForm').submit();
		} else {
			if (beginTimeLength == 0 && endTimeLength>0) {
				$(this).alertmsg('warn', '开始时间不能为空');
				return;
			}
			if (beginTimeLength > 0 && endTimeLength==0) {
				$(this).alertmsg('warn', '结束时间不能为空');
				return;
			}
			if (date1 > date2) {
				$(this).alertmsg('warn', '结束时间不能小于开始时间');
				return;
			}else if(date3==0){
				$(this).alertmsg('warn', '开始时间和结束时间不能一样');
				return;
			} else {
				$('#pagerForm').submit();
			}
		}
	});
</script>
