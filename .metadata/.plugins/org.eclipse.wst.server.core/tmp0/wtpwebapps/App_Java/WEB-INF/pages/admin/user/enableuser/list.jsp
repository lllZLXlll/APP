<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryLockedUsersInit.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
             <label>类型：</label>
             <select name="enable" id="enable" data-toggle="selectpicker">
                <option value="2" ${enable ==2?'selected':''}>禁用</option>
                <option value="1" ${enable ==1?'selected':''}>启用</option>
            </select>&nbsp;
            <label>管理员账号：</label><input type="text" id="userName" maxlength="20" value="${userName }" name="userName" maxlength="20" class="form-control" size="15">&nbsp;
           <label>真实姓名：</label><input type="text" id="realName" maxlength="20" value="${realName }" name="realName" maxlength="20" class="form-control" size="14">&nbsp;
            &nbsp;
             <c:choose>
					<c:when test="${enable ==1 }">
						     <label>注册时间：</label> 
					</c:when>
					<c:otherwise>
					       <label>禁用时间：</label> 
					</c:otherwise>
				</c:choose>
            <input type="text" name="beginTime" id="beginTime"  data-toggle="datepicker"
                       data-pattern="yyyy-MM-dd" value="${beginTime }" size="14" readonly="readonly" >&nbsp;-&nbsp;
            </label> <input type="text" name="endTime" id="endTime"  data-toggle="datepicker"
                       data-pattern="yyyy-MM-dd" value="${endTime }" readonly="readonly" size="14">
            &nbsp;
            <button type="button" class="btn-default" id="searchButton" data-icon="search">查询</button>&nbsp;&nbsp;
             <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
            
           		 <c:choose>
					<c:when test="${enable ==1 }">
						     <a href="enableUserByUserIds.do?enable=2" data-toggle="doajaxchecked" data-confirm-msg="确定要启用选中用户吗？" data-idname="ids" 
           				 data-group="ids" class="btn btn-blue">禁用选中用户</a>
					</c:when>
					<c:otherwise>
					       <a href="enableUserByUserIds.do?enable=1" data-toggle="doajaxchecked" data-confirm-msg="确定要启用选中用户吗？" data-idname="ids" 
           				 data-group="ids" class="btn btn-blue">启用选中用户</a>
					</c:otherwise>
				</c:choose>
				
           &nbsp;&nbsp;&nbsp;
          
            </div>
        </div>
        <div class="bjui-moreSearch">
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr height="25px">
            	<th align="center">序号</th>
                <th align="center">用户名</th>
                <th align="center">真实姓名</th>
                <th align="center">手机号码</th>
                <th align="center">身份证 </th>
                <c:choose>
					<c:when test="${enable ==1 }">
						    <th align="center">启用时间：</th>
					</c:when>
					<c:otherwise>
					       <th align="center">禁用时间：</th>
					</c:otherwise>
				</c:choose>
                <th align="center">注册时间</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.username }</td>
                <td>${data.realName }</td>
                <td> ${data.mobilePhone } </td>
                <td>${data.idNo }</td>
                <td> <fmt:formatDate value="${data.limitTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td> <fmt:formatDate value="${data.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                 <td><input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${data.id }"></td>
                <td>
                
                    
                <c:choose>
					<c:when test="${data.enable==1 }">
						    <a href="enableUserByUserId.do?id=${data.id }&enable=2" class="btn btn-green" data-toggle="doajax" 
                    data-confirm-msg="确定要启用${data.username }用户吗？">禁用</a>
					</c:when>
					<c:otherwise>
					     <a href="enableUserByUserId.do?id=${data.id }&enable=1" class="btn btn-green" data-toggle="doajax" 
                    data-confirm-msg="确定要启用${data.username }用户吗？">启用</a>
					</c:otherwise>
				</c:choose>
				
                	    <a href="queryUserInvestorInfo.do?userId=${data.id }&tabid=${tabid}" data-toggle="navtab" data-id="investInfo" 
                   data-title="${data.realName }的投资信息" class="btn btn-blue">投资信息</a>
                   
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
		var beginTime = $("#beginTime").val();
		var endTime = $("#endTime").val();
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
			} else {
				$('#pagerForm').submit();
			}
		}
	});
</script>
