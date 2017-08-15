<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/queryNewsListInit.do" method="post">
      	<input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <a href="addNewsInit.do?tabid=${tabid }" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="750" data-height="700" class="btn btn-blue">&nbsp;添加公告</a>&nbsp;&nbsp;
            <div class="pull-right" style="margin-right:18%;">
            	<a href="deleteWebConsultByIds.do" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-icon="remove" data-idname="delids" data-group="ids" class="btn btn-blue">删除选中</a>&nbsp;
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center" width="40">序号</th>
                <th align="center">公告类型</th>
                <th align="center">标题</th>
                <th align="center">发表人</th>
                <th align="center" width="40">时间</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center" width="280">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="news" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
                <td >${news.announcementType }</td>
                <td>${news.title }</td>
                <td>${news.userName }</td>
                <td>${news.publishTime } </td>
                <td><input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${news.id }"></td>
                <td>
                	<a href="updateWebConsultByIdInit.do?id=${news.id }&tabid=${tabid}" data-toggle="dialog" data-id="updateMediareportByIdInit" data-mask="true" data-width="700" data-height="700" class="btn btn-green">编辑</a>
                   
                	<a href="deleteWebConsultById.do?id=${news.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                	
                	<a href="preViewWebConsultInit.do?id=${news.id }&tabid=${tabid}" data-toggle="dialog" data-id="queryMediareportById" data-mask="true" data-width="600" data-height="700" title="${news.title }" class="btn btn-green">预览</a>
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
