<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script>
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
				$(this).alertmsg('warn', '开始时间不能为空');
				return;
			}
			if(endTime==""){
				$(this).alertmsg('warn', '结束时间不能为空');
				return;
			}
		if(date3<0){
	   		$(this).alertmsg('warn', '结束时间不能小于开始时间');
			return;
	 	 }else{
	 	 $('#pagerForm').submit(); 
	 	 }
		 
		}
	}
</script>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="loginStatisInit.do" method="post">
        <input type="hidden" name="pageSize" value="${model.pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        <br/>&nbsp;&nbsp;
           	 最后登入时间段：<input type="text" name="beginTime" id="beginTime" value="${beginTime }" data-toggle="datepicker"  data-rule="date" size="20"> 
	              — <input type="text" name="endTime" id="endTime" value="${endTime }" data-toggle="datepicker"  data-rule="date" size="20">
	              用户名：<input type="text" name="userName" id="j_custom_name" size="20" value="${userName }">
            <button type="button" class="btn-default" data-icon="search" onclick="serachRecommendUser()">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <br/><br/>&nbsp;&nbsp;
	             真实姓名：<input type="text" name="realName" id="j_custom_name" size="20">
		        登入次数：<input type="text" name="count" id="j_custom_name" size="20" data-rule="number">
            <div class="pull-right">
            </div>
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
                <th align="center">最后登入时间</th>
                <th align="center">最后登入IP</th>
                <th align="center">登入次数</th>
            </tr>
        </thead>
        <tbody>
       		<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="login" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
                <td>${login.username }</td>
                <td>${login.realName }</td>
                <td>${login.lastDate }</td>
                <td>${login.lastIP }</td>
                <td>${login.loginCount }</td>
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
	
</script>
