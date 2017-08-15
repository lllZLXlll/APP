<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryUserGroupMemberList.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <label>用户组：</label>
            <select name="groupId" id="groupId" data-toggle="selectpicker">
            	<option value="0">请选择</option>
            	<c:forEach items="${userGroup }" var="data">
            	 <option value="${data.id}" ${data.id == groupId ?'selected':''}>${data.groupName}</option>
            	</c:forEach>
            </select>
            &nbsp;
            <label>用户名：</label>
            <input type="text" id="username" value="${username }" name="username" maxlength="20" class="form-control" size="20">&nbsp;
            <label>可用金额：</label>
            <input type="text" id="startUsableSum"  value="${startUsableSum }" name="startUsableSum" maxlength="20" class="form-control" size="15">&nbsp;-
             <input type="text" id="endUsableSum"  value="${endUsableSum }" name="endUsableSum" maxlength="20" class="form-control" size="15">&nbsp;
              <button type="button" class="btn-default" id="searchButton" data-icon="search">查询</button>&nbsp;
              <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
             <br/><br/>&nbsp;&nbsp;
            <label>真实姓名：</label>
            <input type="text" id="realName" value="${realName }" name="realName" maxlength="20" class="form-control" size="20">&nbsp;
            <label>总金额：</label>
            <input type="text" id="startAllSum"  value="${startAllSum }" name="startAllSum" maxlength="20" class="form-control" size="15">&nbsp;-
             <input type="text" id="endAllSum"  value="${endAllSum }" name="endAllSum" maxlength="20" class="form-control" size="15">
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
            <tr height="25px">
            	<th align="center">序号</th>
                <th align="center">用户组</th>
                <th align="center">真实姓名</th>
                <th align="center">用户名</th>
                <th align="center">身份证号</th>
                <th align="center">帐号总金额（元）</th>
                <th align="center">可用金额（元）</th>
                <th align="center">待收金额（元）</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.groupName }</td>
                <td>${data.realName }</td>
                <td>${data.username }</td>
                <td>${data.idNo }</td>
                <td><fmt:formatNumber value="${data.allSum }" type="currency" pattern="#,##0.00"/></td>
                 <td><fmt:formatNumber value="${data.usableSum }" type="currency" pattern="#,##0.00"/></td>
                  <td><fmt:formatNumber value="${data.dueinSum }" type="currency" pattern="#,##0.00"/></td>
                <td>
                    <a href="deleteUserGroup.do?id=${data.id }&userId=${data.userId }" class="btn btn-red" data-toggle="doajax" 
                    data-confirm-msg="确定要删除${data.groupName }用户组用户${data.username }吗？">删除</a>
                    
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
		var groupId=$("#groupId").val();
		var startUsableSum=$("#startUsableSum").val();
		var endUsableSum=$("#endUsableSum").val();
		var startAllSum=$("#startAllSum").val();
		var endAllSum=$("#endAllSum").val();
		if(groupId=="0"){
			$(this).alertmsg('warn', '请选择用户组');
			return;
		}
		if(startUsableSum.trim().length>0 && endUsableSum.trim().length==0){
			$(this).alertmsg('warn', '请输入可用金额最大金额');
			return;
		}
		
		if(startUsableSum.trim().length==0 && endUsableSum.trim().length>0){
			$(this).alertmsg('warn', '请输入可用金额最小金额');
			return;
		}
		
		if(startAllSum.trim().length>0 && endAllSum.trim().length==0){
			$(this).alertmsg('warn', '请输入总金额最大金额');
			return;
		}
		
		if(startAllSum.trim().length==0 && endAllSum.trim().length>0){
			$(this).alertmsg('warn', '请输入总金额最小金额');
			return;
		}
		$('#pagerForm').submit();
	});
</script>
