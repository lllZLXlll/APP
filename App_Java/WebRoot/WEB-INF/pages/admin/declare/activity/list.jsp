<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/mediaReportListinit.do" method="post">
      	<input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <a href="addActivityInit.do?tabid=${tabid }" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;添加活动</a>&nbsp;&nbsp;
            <div class="pull-right" style="margin-right:18%;">
            	<a href="deleteActivityByIds.do" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-idname="delids" data-group="ids" class="btn btn-blue">删除选中</a>&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center" width="40">序号</th>
                <th align="center">标题</th>
                <th align="center">发布时间</th>
                <th align="center">链接地址</th>
                <th align="center">活动截止时间</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center" width="280">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="activity" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
                <td >${activity.title }</td>
                <td>${activity.publishTime }</td>
                <td>${activity.linkAddress }</td>
                <td>${activity.endTime }</td>
                <td><input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${activity.id }"></td>
                <td>
                	<a href="updateActivityByIdInit.do?id=${activity.id }&tabid=${tabid}" data-toggle="dialog" data-id="updateActivityByIdInit" data-mask="true" data-width="500" data-height="500" class="btn btn-green">编辑</a>
                  
                	<a href="deleteActivityById.do?id=${activity.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
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
