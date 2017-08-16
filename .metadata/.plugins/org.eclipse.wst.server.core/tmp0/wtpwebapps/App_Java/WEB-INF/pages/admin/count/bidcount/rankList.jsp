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
    var beginTime=$("#beginTime").val();
    var endTime= $("#endTime").val();
    var group= $("#group").val();
    var investor= $("#investor").val();
    var pageSize= $("#pageSize").val();
    var pageCurrent= $("#pageCurrent").val();
    window.location.href="exportInvestStatisRank.do?beginTime="+beginTime+"&endTime="+
    		endTime+"&group="+group+"&investor="+investor+"&pageSize="+pageSize+"&pageCurrent="+pageCurrent;
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
				$(this).alertmsg('warn', '开始时间不能为空！');
				return;
			}
			if(endTime==""){
				$(this).alertmsg('warn', '结束时间不能为空！');
				return;
			}
		if(date3<0){
			$(this).alertmsg('warn', '结束时间不能小于开始时间！');
			return;
	 	 }else{
	 	 $('#pagerForm').submit(); 
	 	 }
		 
		}
	}

</script>
<div class="bjui-pageHeader" >
    <form id="pagerForm" data-toggle="ajaxsearch" action="investStatisRankList.do" method="post">
      	<input type="hidden" name="radio" id="radio">
      	<input type="hidden" name="pageSize" id="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" id="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
        &nbsp;&nbsp;
	              用户名：<input type="text" name="investor" value="${investor }" id="investor" size="20">
		        时间：<input type="text" name="beginTime" id="beginTime" data-toggle="datepicker"  data-rule="date" size="20" value="${beginTime }" pattern="yyyy-MM-dd HH:mm:ss"> 
            	— <input type="text" name="endTime" id="endTime" data-toggle="datepicker"  data-rule="date" size="20" value="${endTime }" pattern="yyyy-MM-dd HH:mm:ss">
				用户组：
				<select id="group" name="group" data-toggle="selectpicker">
		              	<option value="-1" ${group==-1 ? 'selected' : '' }>-请选择-</option>
						<option value="1" ${group==1 ? 'selected' : '' }>借款人组</option>
						<option value="2" ${group==2 ? 'selected' : '' }>投资人组</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<button type="button" class="btn-default" data-icon="search" onclick="serachRecommendUser()">查询</button>&nbsp;
          		<a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
            	 <a data-toggle="navtab" href="investStatisInit.do?" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;投标统计</a>&nbsp;&nbsp;
            <button type="button" class="btn-green" data-icon="floppy-o" id="excels" data-toggle="doexport">导出</button>&nbsp;
            </div>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent" >
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">序号</th>
            	<th align="center">排名</th>
                <th align="center">用户名</th>
                <th align="center">用户组</th>
            	<th align="center">真实姓名</th>
                <th align="center">期间成功投标金额</th>
                <th align="center">期间投标金额总计</th>
            	<th align="center">账户总额</th>
                <th align="center">可用金额</th>
                <th align="center">待收总额</th>
            	<th align="center">会员积分</th>
            	<th align="center">信用积分</th>
            </tr>
        </thead>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="bean" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
              	<td >${status.index+1+count }</td>
                <td align="center">
					${bean.investor}
				</td>
				<td align="center">
					${bean.groupName}
				</td>
				<td align="center">
					${bean.realName}
				</td>
				<td align="center">
					${bean.realAmount}
				</td>
				<td align="center">
					${bean.realAmount}
				</td>
				<td align="center">
					${bean.totalSum}
				</td>
				<td align="center">
					${bean.usableSum}
				</td>
				<td align="center">
					${bean.forPI}
				</td>
				<td align="center">
					${bean.rating}
				</td>
				<td align="center">
					${bean.creditrating}
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
