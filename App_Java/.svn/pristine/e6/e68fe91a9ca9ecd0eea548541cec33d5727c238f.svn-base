<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="linkageinit.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="tabid" value="${tabid }">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <a href="saveorupdateBorrowPurposeInit.do?tabid=${tabid }" data-toggle="dialog" data-id="saveBorrowPurposeInit" data-mask="true" 
            data-width="600" data-height="500" class="btn btn-blue">新增选项</a>&nbsp;&nbsp;
              &nbsp;
            <label>类型：</label>
            <select name="type" id="type" data-toggle="selectpicker">
                <option value="1" ${type ==1 ?'selected':''}>借款目的</option>
                <option value="2" ${type ==2 ?'selected':''}>担保机构</option>
                <option value="3" ${type ==3 ?'selected':''}>反担保方式</option>
                <option value="-1" ${type ==-1 ?'selected':''}>所有</option>
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
                <th align="center">
              	  <c:choose>
	                	<c:when test="${type==1 }">
	                		借款目的
	                	</c:when>
	                	
	                	<c:when test="${type==2 }">
	                		担保机构
	                	</c:when>
	                	<c:when test="${type==3 }">
	                		反担保方式
	                	</c:when>
	                	<c:otherwise>
	                		名称
	                	</c:otherwise>
	                </c:choose>
	             <c:if test="${type==2 or type==3 }">
	             	<th align="center">状态</th>
	             </c:if>   
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.selectName }</td>
                
                 <c:if test="${type==2 or type==3 }">
	             	 <td >
	             	  <c:if test="${data.deleted == 1 }">开启</c:if>
                <c:if test="${data.deleted == 2}">关闭</c:if>
	             	 </td>
	            </c:if>   
	            
                <td>
                
                	<a href="saveorupdateBorrowPurposeInit.do?id=${data.id }&tabid=${tabid}" data-toggle="dialog" 
                   data-id="updateBorrowPurposeInit" data-mask="true" data-width="600" data-height="500" class="btn btn-green">编辑</a>
                
                <c:choose>
	                	<c:when test="${type==2 or type==3 }">
	                		  <c:if test="${data.deleted == 1 }">
                  <a href="deleteSelect.do?id=${data.id }&deleted=2&typeId=${data.typeId }" class="btn btn-red" data-toggle="doajax" 
                    data-confirm-msg="确定要关闭吗？">关闭</a>
                 </c:if>
                <c:if test="${data.deleted == 2}">
                	 <a href="deleteSelect.do?id=${data.id }&deleted=1&typeId=${data.typeId }" class="btn btn-green" data-toggle="doajax" 
                    data-confirm-msg="确定要开启吗？">开启</a>
                </c:if>
	                	</c:when>
	                	<c:otherwise>
	                		   <a href="deleteSelect.do?id=${data.id }&deleted=2&typeId=${data.typeId }" class="btn btn-red" data-toggle="doajax" 
                    data-confirm-msg="确定要删除此借款目的吗？">删除</a>
                   
	                	</c:otherwise>
	                </c:choose>
	                
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
