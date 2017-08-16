<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script>
function doc_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
    	this.$element.navtab('reloadFlag', json.tabid)
    }
}
</script>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/mediaReportListinit.do" method="post">
      	<input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <a href="addAppOperateReportInit.do?tabid=${tabid }" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="450" data-height="400" class="btn btn-blue">&nbsp;上传报告</a>&nbsp;&nbsp;
          	<span style="font-size: 20px;margin-left:28%;color:red;">注：这里上传的是上个月的运营报告</span>
            <div class="pull-right" style="margin-right:10%;">
            	<a href="deleteAppOperateReportByIds.do" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-idname="delids" data-group="ids" class="btn btn-blue">删除选中</a>&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
           		<th align="center" width="100">月份</th>
            	<th align="center">图片类型</th>
            	<th align="center">图片路径</th>
                <th align="center">上传时间</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="appor" varStatus="status">
              <tr data-id="65" align="center">
                <td >${appor.month}</td>
                <td >
                	<c:if test="${appor.imgType == 1}">图片</c:if>
                	<c:if test="${appor.imgType == 2}">封面</c:if>
                </td>
                <td ><a href="${appor.imgPath}">${appor.imgPath}</a></td>
                <td >${appor.uploadTime}</td>
                <td><input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${appor.id }"></td>
                <td>
                	<a href="updateAppOperateReportByIdInit.do?id=${appor.id }&tabid=${tabid}" data-toggle="dialog" data-id="updateAppOperateReportByIdInit" data-mask="true" data-width="500" data-height="500" class="btn btn-green">编辑</a>
                
                	<a href="deleteAppOperateReportById.do?id=${appor.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
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
