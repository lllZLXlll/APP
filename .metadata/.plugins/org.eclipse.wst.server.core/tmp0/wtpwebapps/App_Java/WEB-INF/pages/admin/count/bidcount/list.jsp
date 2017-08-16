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
    var bTitle = $("#bTitle").val();
    var realName = $("#realName").val();
    var recommendrealName = $("#recommendrealName").val();
    var deadline = $("#deadline").val();
    var borrowWay = $("#borrowWay").val();
    var isAutoBid = $("#isAutoBid").val();
    var beginTime=$("#beginTime").val();
    var endTime= $("#endTime").val();
    var borrowStatus= $("#borrowStatus").val();
    var pageSize= $("#pageSize").val();
    var pageCurrent= $("#pageCurrent").val();
    window.location.href="exportInvestStatis.do?bTitle="+bTitle+"&realName="+realName+"&recommendrealName="+
    		recommendrealName+"&deadline="+deadline+"&borrowWay="+borrowWay+"&isAutoBid="+isAutoBid+"&beginTime="+
    		beginTime+"&endTime="+endTime+"&borrowStatus="+borrowStatus+"&pageSize="+pageSize+"&pageCurrent="+pageCurrent;
    setTimeout("test()",3000);
}
function test(){
	$("#excel").attr("disabled",false);
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
   <form id="pagerForm" data-toggle="ajaxsearch" action="investStatisInit.do" method="post">
          	<input type="hidden" name="radio" id="radio">
      	<input type="hidden" name="pageSize" id="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" id="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
        <br/>
        &nbsp;&nbsp;
           	 <label>借款标题：</label><input type="text" name="bTitle" value="${bTitle }" id="bTitle" size="20">
	         <label> 真实姓名：</label><input type="text" name="realName" value="${realName }" id="realName" size="10">
	         <label>推荐人姓名：</label><input type="text" name="recommendrealName" value="${recommendrealName }" id="recommendrealName" size="10">
	          <label> 项目期限：</label><input type="text" name="deadline" value="${deadline }" id="deadline" size="10">
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a><br/><br/> &nbsp;&nbsp;
            <label> 借款类型：</label>
	            <select id="borrowWay" name="borrowWay" data-toggle="selectpicker">
		              	<option value="-1" ${borrowWay==-1 ? 'selected' : '' }>-请选择-</option>
						<option value="2" ${borrowWay==2 ? 'selected' : '' }>体验标</option>
						<option value="3" ${borrowWay==3 ? 'selected' : '' }>多金宝</option>
						<option value="4" ${borrowWay==4 ? 'selected' : '' }>普金宝</option>
						<option value="5" ${borrowWay==5 ? 'selected' : '' }>新手标</option>
						<option value="6" ${borrowWay==6 ? 'selected' : '' }>恒金宝</option>
				</select>&nbsp;&nbsp;
		       <label> 时间：</label><input type="text" name="beginTime" id="beginTime" data-toggle="datepicker"  data-rule="date" size="20" value="${beginTime }" pattern="yyyy-MM-dd HH:mm:ss"> 
            	— <input type="text" name="endTime" id="endTime" data-toggle="datepicker"  data-rule="date" size="20" value="${endTime }" pattern="yyyy-MM-dd HH:mm:ss">
            	<label>是否自动投标：</label>
            	<select id="isAutoBid" name="isAutoBid" data-toggle="selectpicker">
		              	<option value="-1" ${isAutoBid==-1 ? 'selected' : '' }>-请选择-</option>
						<option value="2" ${isAutoBid==2 ? 'selected' : '' }>是</option>
						<option value="1" ${isAutoBid==1 ? 'selected' : '' }>否</option>
				</select>&nbsp;&nbsp;
				<label>是否投标成功：</label>
				<select id="borrowStatus" name="borrowStatus" data-toggle="selectpicker">
		              	<option value="-1" ${borrowStatus==-1 ? 'selected' : '' }>-请选择-</option>
						<option value="2" ${borrowStatus==2 ? 'selected' : '' }>是</option>
						<option value="1" ${borrowStatus==1 ? 'selected' : '' }>否</option>
				</select>
            <div class="pull-right">
              <a data-toggle="navtab" href="investStatisRankList.do?" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;投标排名</a>&nbsp;&nbsp;
            <button type="button" class="btn-green" data-icon="floppy-o" id="excel" data-toggle="doexport">导出</button>&nbsp;
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent" >
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">序号</th>
            	<th align="center">真实姓名</th>
                <th align="center">推荐人姓名</th>
                <th align="center">投标扣除金额(元)</th>
            	<th align="center">交易对方</th>
                <th align="center">借款标题</th>
                <th align="center">借款类型</th>
            	<th align="center">项目期限(月)</th>
                <th align="center">是否自动投标</th>
                <th align="center">是否投标成功</th>
            	<th align="center">投标时间</th>
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
					${bean.recommendrealName}
				</td>
				<td align="center">
					${bean.realAmount}
				</td>
				<td align="center">
					${bean.borrower}
				</td>
				<td align="center">
					${bean.borrowTitle}
				</td>
				<td align="center"> 
					${bean.borrowWayName}
				</td>
				<td align="center"> 
					${bean.deadline}
				</td>
                <td>
                	<c:if test="${bean.isAutoBid==1 }">
                		否
                	</c:if>
                	<c:if test="${bean.isAutoBid==2 }">
                		是
                	</c:if>
                </td>
                <td>
                	<c:choose>
                		<c:when test="${bean.borrowStatus==4 }">是</c:when>
                		<c:when test="${bean.borrowStatus==5 }">是</c:when>
                		<c:otherwise>否</c:otherwise>
                	</c:choose>
                </td>
                <td align="center">
					${bean.investTime}
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
