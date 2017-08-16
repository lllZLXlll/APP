<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="userRenameInit.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <label>姓名：</label><input type="text" id="customNo" value="${realName }" name="realName" maxlength="15" class="form-control" size="20">&nbsp;
            <label>原用户名：</label><input type="text" value="${userName }" name="userName" class="form-control" maxlength="20" size="20">&nbsp;
            <label>新用户名：</label><input type="text" value="${rename }" name="rename" maxlength="20" class="form-control" size="20">&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
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
            <tr height="25px">
            	<th align="center">序号</th>
            	<th align="center">姓名</th>
                <th align="center">原用户名</th>
                <th align="center">新用户名</th>
                <th align="center">开始使用时间</th>
                <th align="center">截止使用时间</th>
                <th align="center">创建时间</th>
                <th align="center" width="16%">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.realName }</td>
                <td>${data.username }</td>
                <td>${data.rename }</td>
                <td><fmt:formatDate value="${data.startTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td><fmt:formatDate value="${data.endTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td><fmt:formatDate value="${data.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td>
                   
                   <a href="saveOrUpdateUseraliasInit.do?id=${data.id }&tabid=${tabid}&type=add" data-toggle="dialog" data-title="增加${data.username }的别名"
                   data-id="saveUseraliasInit" data-mask="true" data-width="600" data-height="500" class="btn btn-green">增加别名</a>
                  
                  <a href="saveOrUpdateUseraliasInit.do?id=${data.id }&tabid=${tabid}" data-toggle="dialog" 
                   data-id="updateUseraliasInit" data-mask="true" data-width="600" data-height="500" class="btn btn-green" data-title="编辑${data.username }的别名">编辑</a>
                   
                     <a href="deleteUserRename.do?id=${data.id }" class="btn btn-red" data-toggle="doajax" 
                     data-confirm-msg="确定要删除${data.username }的别名吗？">删除</a>
                    
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
	
</script>
