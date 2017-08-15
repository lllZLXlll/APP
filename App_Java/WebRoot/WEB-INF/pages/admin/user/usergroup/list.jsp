<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryGroupInit.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <a href="saveOrUpdateUserGroupInit.do?tabid=${tabid }" data-toggle="dialog" data-id="addRecommendDialog" data-mask="true" 
            data-width="700" data-height="600" class="btn btn-blue">新增用户组</a>&nbsp;&nbsp;
            <label>用户组：</label><input type="text" id="groupName" maxlength="20" value="${groupName }" name="groupName" maxlength="20" class="form-control" size="20">&nbsp;
            &nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
             <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
             <a href="queryUserGroupMemberList.do" data-toggle="navtab" data-id="addRecommendDialog"  class="btn btn-blue">检索成员</a>
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
                <th align="center">成员数</th>
                <th align="center">备注</th>
                <th align="center">添加人</th>
                <th align="center">提现状态</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.groupName }</td>
                <td>${data.groupCount }</td>
                <td>${data.groupRemark }</td>
                <td>${data.adminName }</td>
                <td>${data.cashStatus==1?'启用':'禁用' }</td>
                <td>
                
                	<a href="saveOrUpdateUserGroupInit.do?id=${data.id }&tabid=${tabid}" data-toggle="dialog" 
                   data-id="saveOrUpdateUserGroupInitDialog" data-mask="true" data-width="600" data-height="500" class="btn btn-green">编辑</a>
                   
                    <a href="deleteGroup.do?id=${data.id }" class="btn btn-red" data-toggle="doajax" 
                    data-confirm-msg="确定要删除${data.groupName }用户组吗？">删除</a>
                    
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
