<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="showPlatformCostInit.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="tabid" value="${tabid }">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <label>类型：</label>
            <select name="type" id="type" data-toggle="selectpicker">
                <option value="1" ${type ==1 ?'selected':''}>奖励费用管理</option>
                <option value="3" ${type ==3 ?'selected':''}>其他收费管理</option>
            </select>
            
             &nbsp;
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
                <th align="center">描述</th>
                <th align="center">金额或者金额百分比</th>
      			<th align="center">备注</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.costName }</td>
                <td >
                	<c:choose>
	                	<c:when test="${data.costMode==1 }">
	                	${data.costFee}%
	                	</c:when>
	                	<c:otherwise>
	                		${data.costFee}元
	                	</c:otherwise>
	                </c:choose>
                
                </td>
                <td >${data.remark }</td>
	            
                <td>
                
                	<a href="updatePlatFormCostInit.do?id=${data.id }&tabid=${tabid}" data-toggle="dialog" 
                   data-id="updatePlatFormCostInit" data-mask="true" data-width="600" data-height="500" class="btn btn-green">编辑</a>
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
