<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryNoticeStyleAllInit.do?tabid=${tabid }" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
        	
        	</div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr height="25px">
            	<th align="center">序号</th>
                <th align="center">提醒类型</th>
                <th align="center">名称</th>
                <th align="center">标示名</th>
                <th align="center">模板</th>
                <th align="center">排序</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.title }</td>
                <td >${data.name }</td>
                <td >${data.nid }</td>
                <td >${data.template }</td>
                <td >${data.sort }</td>
                <td>
                	<a href="queryApproveNoticeTemplateById.do?id=${data.id }&tabid=${tabid}&noticeStyle=${data.notice_style }" data-toggle="dialog" 
                   data-id="queryApproveNoticeTemplateById" data-mask="true" data-width="700" data-height="600" class="btn btn-green">编辑</a>
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
