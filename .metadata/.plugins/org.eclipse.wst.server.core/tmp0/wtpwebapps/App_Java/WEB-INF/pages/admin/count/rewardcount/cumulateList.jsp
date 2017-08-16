<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script>
$(function(){
	   $("#excel").click(function(){
		   $(this).alertmsg('confirm', '确定导出吗！', {displayMode:'slide', okName:'确定', 
       		cancelName:'取消', title:'确认框',
       		okCall:
       			expo
		  	});
		    
		});
});
function expo(){
	$("#excel").attr("disabled",true);
    var awardType = '${awardType}';
    var realName = $("#realName").val();
    var faFangStatus = '${faFangStatus}';
    var pageSize= $("#pageSize").val();
    var pageCurrent= $("#pageCurrent").val();
    window.location.href="exportAwardCumulateInvest.do?awardType="+awardType+"&realName="+realName+"&faFangStatus="+
    faFangStatus+"&pageSize="+pageSize+"&pageCurrent="+pageCurrent;
    setTimeout("test()",3000);
}
function test(){
	$("#excel").attr("disabled",false);
}
function serachRecommendUser(){
	 	 $('#pagerForm').submit(); 
	}
</script>
<div class="bjui-pageHeader" >
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryAwardInits.do?activity=4" method="post">
      	<input type="hidden" name="pageSize" id="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" id="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="tabid" id="tabid" value="${tabid}">
        <div class="bjui-searchBar">
            <br/>
            &nbsp;&nbsp;
            <a data-toggle="navtab" href="queryAwardInits.do?activity=0" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;新用户首次投资奖励</a>&nbsp;&nbsp;
            <a data-toggle="navtab" href="queryAwardInits.do?activity=1" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;一起抢标奖</a>&nbsp;&nbsp;
            <a data-toggle="navtab" href="queryAwardInits.do?activity=2" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;老用户再投奖</a>&nbsp;&nbsp;
            <a data-toggle="navtab" href="queryAwardInits.do?activity=3" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;邀请奖</a>&nbsp;&nbsp;
            <a data-toggle="navtab" href="queryAwardInits.do?activity=4" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;累计投资奖</a>&nbsp;&nbsp;
             <a data-toggle="navtab" href="queryInvestWinGift.do?" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;投资赢豪礼</a>&nbsp;&nbsp;
            <br/>
            <br/>
            <div>&nbsp;&nbsp;
	              真实姓名：<input type="text" name="realName" value="${realName }" id="realName" size="20">
	              奖励等级：&nbsp;&nbsp;
				<select id="awardType" name="awardType">
					<option value="-1" ${awardType==-1 ? 'selected' : '' }>--请选择--</option>
					<option value="1" ${awardType==1 ? 'selected' : '' }>1</option>
					<option value="2" ${awardType==2 ? 'selected' : '' }>2</option>
					<option value="3" ${awardType==3 ? 'selected' : '' }>3</option>
					<option value="4" ${awardType==4 ? 'selected' : '' }>4</option>
					<option value="5" ${awardType==5 ? 'selected' : '' }>5</option>
				</select>
				&nbsp;&nbsp;
            	发放状态：
            	<select id="faFangStatus" name="faFangStatus" data-toggle="selectpicker">
		              	<option value="-1" ${faFangStatus==-1 ? 'selected' : '' }>-请选择-</option>
						<option value="1" ${faFangStatus==1 ? 'selected' : '' }>未发放</option>
						<option value="2" ${faFangStatus==2 ? 'selected' : '' }>已发放</option>
				</select>
            	<button type="button" class="btn-default" data-icon="search" onclick="serachRecommendUser()">查询</button>&nbsp;
          		<a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>&nbsp;
          		<button type="button" class="btn-green" data-icon="floppy-o" id="excel" data-toggle="doexport">导出</button>&nbsp;
          		<div class="pull-right" style="margin-right:4%;">
            		<a href="updateAwardCumulateInvestByIds.do" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-idname="delids" data-group="ids" class="btn btn-blue">发放选中</a>&nbsp;&nbsp;&nbsp;
            	</div>
            </div>
            <br/>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent" >
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">序号</th>
            	<th align="center">真实姓名</th>
                <th align="center">累计投资总额（元）</th>
                <th align="center">奖励计算时间</th>
                <th align="center">奖励等级</th>
                <th align="center">奖品</th>
                <th align="center">奖励发放日期</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center">奖励发放</th>
            </tr>
        </thead>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="bean" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
                <td align="center">
					${bean.realName}
				</td>   
				<td align="center">
					${bean.investAmount}
				</td>			 			
				<td align="center">
					${bean.investTimeRange} 
				</td>
				<td align="center">
					${bean.cumulateAwardType}
				</td>
				<td align="center">
					${bean.awardDescribe} 
				</td>
				<td align="center">
					<fmt:formatDate value="${bean.awardTime}" pattern="yyyy-MM-dd"/>
				</td>
				<td><input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${bean.id }"></td>
				<td align="center"> 
					<c:choose>
						<c:when test="${bean.statusStr=='未发放'}">
							<a href="updateAwardCumulateInvest.do?id=${bean.id}" data-toggle="doajax" data-id="updateAppOperateReportByIdInit" data-mask="true" data-confirm-msg="确定要发放奖励吗？" class="btn btn-green">发放</a>
						</c:when>
						<c:otherwise>
							${bean.statusStr}
						</c:otherwise>
					</c:choose>
				</td>
            </tr>
            </c:forEach>
        <tbody>
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
	
</script>