<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">
</script>

<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="lastRepayMentInit.do?tabid=${tabid}" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
        <br/>
            &nbsp;&nbsp;
            <select name="debtStatus" id="borrowWay" data-toggle="selectpicker">
                <option value="-1" selected>今天到期</option>
                <option value="1" ${debtStatus ==1?'selected':1}>明天到期</option>
                <option value="2" ${debtStatus ==2?'selected':1}>后天到期</option>
            </select>&nbsp;
            <label>用户名：</label><input type="text" value="${userName}" name="userName" class="form-control" >&nbsp;
            <label>真实姓名：</label><input type="text" value="${realName}" name="realName" class="form-control" >&nbsp;
            <label>借款标题：</label><input type="text" value="${titles}" name="titles" class="form-control" >&nbsp;
            <label>借款类型：</label>
            <select id="	w" name="borrowWay" data-toggle="selectpicker">
              	<option value="-1" ${borrowWay==-1 ? 'selected' : '' }>-请选择-</option>
				<option value="1" ${borrowWay==1 ? 'selected' : '' }>净值借款</option>
				<option value="2" ${borrowWay==2 ? 'selected' : '' }>秒还借款</option>
				<option value="3" ${borrowWay==3 ? 'selected' : '' }>信用借款</option>
				<option value="4" ${borrowWay==4 ? 'selected' : '' }>实地考察借款</option>
				<option value="5" ${borrowWay==5 ? 'selected' : '' }>机构担保借款</option>
			</select>
            <label>还款状态：</label>
            <select id="status" name="status" data-toggle="selectpicker">
              	<option value="-1" ${status==-1 ? 'selected' : '' }>-请选择-</option>
				<option value="1" ${status==1 ? 'selected' : '' }>未偿还</option>
				<option value="2" ${status==2 ? 'selected' : '' }>已偿还</option>
			</select>
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <%-- <button type="button" class="btn-green" data-icon="floppy-o" id="excel" data-toggle="doexport">导出</button>
            <a href="exporthasRepay.do?pageCurrent=${pageBean.pageNum }&pageSize=${pageBean.pageSize }&debtStatus=${debtStatus }&userName=${userName }&
            realName=${realName }&titles=${titles }&borrowWay=${borrowWay }&status=${status }" 
            class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要导出信息吗？">删除</a> --%>
            <button type="button" class="btn-green" data-url="exporthasRepay.do?pageCurrent=${pageBean.pageNum }&pageSize=${pageBean.pageSize }&debtStatus=${debtStatus }&userName=${userName }&realName=${realName }&titles=${titles }&borrowWay=${borrowWay }&status=${status }" 
            data-toggle="doexport"  data-confirm-msg="确定要导出信息吗？">导出</button>
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
                <th align="center">到期时间</th>
                <th align="center">应还金额</th>
               	<th align="center">还款时间</th>
               	<th align="center">跟踪客服</th>
               	<th align="center">是否已还款</th>
               	<th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${pageBean.page }" var="bean" varStatus="status">
              <tr data-id="65" align="center">
                <td >${status.index+1+count }</td>
                <td align="center">
							${bean.username}
						</td>
						<td>
							${bean.realName}
						</td>
						<td>
						   <a href="../WEB-PC/invest.html?id=${bean.borrowId}" target="_blank">${bean.borrowTitle}</a>
						</td>
						<td>
						${bean.repayPeriod}
					    </td>
						<td>
							${bean.borrowWayName}
						</td>
						
						<td>
							${bean.repayDate}
					</td>
						<td>
							￥${bean.totalSum}
					</td>
						<td>
							${bean.realRepayDate}
					</td>
					<td>
						<c:choose>
							<c:when test="${bean.servier==null }">
								未分配
							</c:when>
							<c:otherwise>
								${bean.servier }
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${bean.repayStatus==1 }">
							   未偿还
							</c:when>
							<c:when test="${bean.repayStatus==2 }">
							  已偿还
							</c:when>
							<c:when test="${bean.repayStatus==3 }">
							  偿还中
							</c:when>
						</c:choose>
					</td>
					<td>
						 <a href="repaymentNoticeInit.do?id=${bean.id }&tabid=repaymentNoticeInit" data-toggle="dialog" data-id="repaymentNoticeInit" data-mask="true" data-width="700" data-height="700" class="btn btn-green">查看</a> 
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
        <span>&nbsp;条，共 ${pageBean.totalNum } 条， 共 ${pageBean.totalPageNum } 页    
	        <c:choose> 
				<c:when test="${debtStatus==2}">
				</c:when> 
				<c:otherwise>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前页的还款金额合计:	￥${currentAmount} &nbsp;&nbsp;&nbsp;&nbsp;还款总金额合计:	￥
                	 <c:choose> 
						<c:when test="${repaymentMap.amount == '' || repaymentMap.amount == null}">
							0.00
						</c:when> 
						<c:otherwise>
        					${repaymentMap.amount}
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>  
		</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>
