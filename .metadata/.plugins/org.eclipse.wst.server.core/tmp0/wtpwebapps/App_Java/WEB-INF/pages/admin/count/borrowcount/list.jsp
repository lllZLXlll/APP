<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script>
$(function(){
	   $("#excels").click(function(){
		   $(this).alertmsg('confirm', '确定导出吗！', {displayMode:'slide', okName:'确定', 
       		cancelName:'取消', title:'确认框',
       		okCall:
       			expo
		  	});
		    
		});
});

function expo(){
	$("#excels").attr("disabled",true);
    var borrowWay = '${borrowWay}';
    var beginTime = $("#beginTime").val();
    var endTime = $("#endTime").val();
    var borrowTitle = '${borrowTitle}';
    var borrower = '${borrower}';
    var pageSize= $("#pageSize").val();
    var pageCurrent= $("#pageCurrent").val();
    window.location.href="exportBorrowStatis.do?beginTime="+beginTime+"&endTime="+endTime+"&borrowTitle="+
    		borrowTitle+"&borrower="+borrower+"&borrowWay="+borrowWay+"&pageCurrent="+pageCurrent+"&pageSize="+pageSize;
    setTimeout("test()",3000); 
}
function test(){
	$("#excels").attr("disabled",false);
}
function serachRecommendUser(){
	var operatingTime=$("#beginTime").val();
	var endTime=$("#endTime").val();
	operatingTime = operatingTime.replace(/-/g,'/');
	endTime = endTime.replace(/-/g,"/");
	var date1= new Date(operatingTime);  //开始时间
	var date2=new Date(endTime);    //结束时间
	var date3=date2.getTime()-date1.getTime();  //时间差的毫秒数
		
		if(operatingTime==""&& endTime==""){
			$('#pagerForm').submit(); 
		}else{
			if(operatingTime==""){
				$(this).alertmsg('warn', '开始时间不能为空！') 
				return;
			}
			if(endTime==""){
				$(this).alertmsg('warn', '结束时间不能为空！') 
				return;
			}
		if(date3<0){
	   		$(this).alertmsg('warn', '结束时间不能小于开始时间！') 
			return;
	 	 }else{
	 	 $('#pagerForm').submit(); 
	 	 }
		 
		}
	}

</script>
<div class="bjui-pageHeader" >
    <input type="hidden" name="radio" id="radio">
    <form id="pagerForm" data-toggle="ajaxsearch" action="borrowStatisInit.do" method="post">
    <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
    <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
            <br/>  &nbsp;&nbsp;
	             <label> 借款标题：</label><input type="text" name="borrowTitle" value="${borrowTitle }" id="borrowTitle" size="20">
	           <label> 用户名：</label><input type="text" name="borrower" value="${borrower }" id="borrower" size="20">
	         <label>借款类型：</label>
				<select id="borrowWay" name="borrowWay" data-toggle="selectpicker">
		              	<option value="-1" ${borrowWay==-1 ? 'selected' : '' }>-请选择-</option>
						<option value="2" ${borrowWay==2 ? 'selected' : '' }>体验标</option>
						<option value="3" ${borrowWay==3 ? 'selected' : '' }>多金宝</option>
						<option value="4" ${borrowWay==4 ? 'selected' : '' }>普金宝</option>
						<option value="5" ${borrowWay==5 ? 'selected' : '' }>新手标</option>
						<option value="6" ${borrowWay==6 ? 'selected' : '' }>恒金宝</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<button type="button" class="btn-default" data-icon="search" onclick="serachRecommendUser()">查询</button>&nbsp;
          		<a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>     
	              
	               <br/><br/>&nbsp;&nbsp;
		         <label>时间：</label><input type="text" name="beginTime" id="beginTime" data-toggle="datepicker"  data-rule="date" size="20" value="${beginTime }" pattern="yyyy-MM-dd HH:mm:ss"> 
            	— <input type="text" name="endTime" id="endTime" data-toggle="datepicker"  data-rule="date" size="20" value="${endTime }" pattern="yyyy-MM-dd HH:mm:ss">
				
          		<div class="pull-right">
          			<a data-toggle="navtab" href="borrowStatisInterestInit.do?" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;投资利息管理费统计</a>&nbsp;&nbsp;
          			<button type="button" class="btn-green" data-icon="floppy-o" id="excels" data-toggle="doexport">导出</button>&nbsp;
          		</div>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent" >
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
        <tr height="30px" align="center">
        	<td colspan="8"><label>符合条件的借款管理费总额：</label><fmt:formatNumber value="${feeMap.amount }" type="currency" pattern="#,##0.00"/>&nbsp;元</td>
        </tr>
            <tr >
            	<th align="center">序号</th>
            	<th align="center">借款用户名</th>
                <th align="center">借款标题</th>
                <th align="center">借款金额（元）</th>
            	<th align="center">借款类型</th>
                <th align="center">借款期限</th>
                <th align="center">借款管理费</th>
            	<th align="center">复审成功时间</th>
            </tr>
        </thead>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="bean" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
              	<td align="center">
					${bean.borrower}
				</td>
				<td align="center">
					${bean.borrowTitle}
				</td>
				<td align="center">
					${bean.borrowAmount}
				</td>
				<td align="center">
					${bean.borrowWayName}
				</td>
				<td align="center">
					${bean.deadline}
					<c:choose>
						<c:when test="${bean.isDayThe==1 }">个月</c:when>
						<c:otherwise>天</c:otherwise>
					</c:choose>
				</td>
				<td align="center">
					${bean.manageFee}
				</td>
				<td align="center">
					${bean.auditTime}
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
