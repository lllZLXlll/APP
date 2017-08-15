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
            <a href="addMediaCoverageInit.do?tabid=${tabid }" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="850" data-height="700" class="btn btn-blue">&nbsp;添加媒体报道</a>&nbsp;&nbsp;
            <div class="pull-right" style="margin-right:20%;">
            	<a href="deleteMediaCoverageByIds.do" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-idname="delids" data-group="ids" class="btn btn-blue">删除选中</a>&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center" width="40">序号</th>
                <th align="center">新闻标题</th>
                <th align="center">来源</th>
                <th align="center">新闻链接地址</th>
                <th align="center" width="40">状态</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center" width="300">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="mediaCoverage" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
                <td >${mediaCoverage.title }</td>
                <td>${mediaCoverage.source }</td>
                <td>${mediaCoverage.url }</td>
                <td>
                	<c:choose>
                		<c:when test="${mediaCoverage.state == 1 }">
                			隐藏
                		</c:when>
	                	<c:otherwise>
	                		<span style="color:red">开启</span>
	                	</c:otherwise>
                	</c:choose>
                </td>
                <td><input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${mediaCoverage.id }"></td>
                <td>
                	<c:choose>
                		<c:when test="${mediaCoverage.stick == 2 }">
                			<a href="updateMediaStick.do?id=${mediaCoverage.id }&&stick=1" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要取消置顶吗？">取消置顶</a>
                		</c:when>
	                	<c:otherwise>
	                		<a href="updateMediaStick.do?id=${mediaCoverage.id }&&stick=2" class="btn btn-default" data-toggle="doajax" data-confirm-msg="确定要置顶吗？">置顶</a>
	                	</c:otherwise>
                	</c:choose>
                
                	<a href="updateMediareportByIdInit.do?id=${mediaCoverage.id }&tabid=${tabid}" data-toggle="dialog" data-id="updateMediareportByIdInit" data-mask="true" data-width="900" data-height=700 class="btn btn-green">编辑</a>
                   
                	<a href="preViewMediaReportInit.do?id=${mediaCoverage.id }&tabid=${tabid}" data-toggle="dialog" data-id="queryMediareportById" data-mask="true" data-width="1000" data-height="700" title="${mediaCoverage.title }" class="btn btn-green">预览</a>
                  
                	<a href="deleteMediareportById.do?id=${mediaCoverage.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
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
