<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/borrowfabiao.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <label>状态:</label>
            <input type="radio" name="state" value="-1" data-toggle="icheck" data-label="申请列表">
            <c:choose>
            	 <c:when test="${state == 0 }">
	            	<input type="radio" name="state" checked="checked" value="0" data-toggle="icheck" data-label="未处理列表">
	       			<input type="radio" name="state" value="1" data-toggle="icheck" data-label="已处理列表">
	            </c:when>
	            <c:when test="${state == 1 }">
	            	<input type="radio" name="state" value="0" data-toggle="icheck" data-label="未处理列表">
	       			<input type="radio" name="state" checked="checked" value="1" data-toggle="icheck" data-label="已处理列表">
	            </c:when>
	            <c:otherwise>
	            	<input type="radio" name="state" value="0" data-toggle="icheck" data-label="未处理列表">
	       			<input type="radio" name="state" value="1" data-toggle="icheck" data-label="已处理列表">
	            </c:otherwise>
            </c:choose>
            &nbsp;
            <label>联系人：</label><input type="text" id="customNo" value="${tname }" name="tname" class="form-control" size="12">&nbsp;
            <label>联系电话：</label><input type="text" value="${telphone }" name="telphone" class="form-control" >&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
                <button type="button" class="btn-blue" data-url="deleteBorrowfabiao.do" data-toggle="doajaxchecked" data-group="ids" data-idname="delids" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button>&nbsp;
               	<a href="exportinborrowfa.do?state=${state }&tname=${tname }&telphone=${telphone }" class="btn btn-orange" data-toggle="doexport" data-confirm-msg="确定要导出excel吗？">导出excel</a>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">企业名称</th>
                <th align="center">注册号</th>
                <th align="center">联系人</th>
                <th align="center">联系电话</th>
                <th align="center">城市所在地</th>
                <th align="center">借款金额（¥）</th>
                <th align="center">借款期限（月）</th>
                <th align="center">状态</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="borrow" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${borrow.companyname }</td>
	                <td>${borrow.registnumber }</td>
	                <td>${borrow.tname }</td>
	                <td>${borrow.telephone }</td>
	                <td>${borrow.cityaddress }</td>
	                <td>${borrow.borrowAmount }</td>
	                <td>${borrow.deadline }</td>
	                <td>
	                	<c:if test="${borrow.state == 0 }">未处理</c:if>
	                	<c:if test="${borrow.state == 1 }">已处理</c:if>
	                </td>
                 	<td><input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${borrow.id }"></td>
	                <td>
                		<a href="queryCompanyById.do?id=${borrow.id }&tabid=${tabid }" data-toggle="dialog" data-mask="true" data-width="500" data-height="400" class="btn btn-green">编辑</a>
	                   	<a href="deleteBorrowfabiao.do?delids=${borrow.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
	                </td>
            	</tr>
            </c:forEach>
            <c:if test="${pageBean.page == null or pageBean.page == '[]' }">
            	<tr align="center">
            		<td align="center" colspan="11">暂无数据</td>
            	</tr>
            </c:if>
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
            	<option value="10">10</option>
            	<option value="20" selected="selected">20</option>
                <option value="30">30</option>
                <option value="60">60</option>
                <option value="120">120</option>
                <option value="150">150</option>
            </select>
        </div>
        <span>&nbsp;条，共 ${pageBean.totalNum } 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>