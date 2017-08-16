<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryUserManageintegralindex.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <div class="bjui-searchBar">
        	<br/>
        	&nbsp;&nbsp;
	       	<label>用户名：</label><input type="text" id="userName" value="${userName }" name="userName" class="form-control" size="12">&nbsp;
	        <label>信用积分：</label>
	        <select data-toggle="selectpicker" name="creditcode">
	           	<option value="-1">--请选择--</option>
	           	<option value="1" ${creditcode == 1 ? 'selected' : ''}>从小到大</option>
	           	<option value="2" ${creditcode == 2 ? 'selected' : ''}>从大到小</option>
	        </select>&nbsp;
	        <label>会员积分：</label>
           	<select data-toggle="selectpicker" name="viprecode">
	           	<option value="-1">--请选择--</option>
	           	<option value="1" ${viprecode == 1 ? 'selected' : ''}>从小到大</option>
	           	<option value="2" ${viprecode == 2 ? 'selected' : ''}>从大到小</option>
	        </select>&nbsp;
	        
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            
            <div class="pull-right">
               	<a href="exportUserManageintegral.do?userName=${userName }&creditcode=${creditcode }&viprecode=${viprecode }" class="btn btn-orange" data-toggle="doexport" data-confirm-msg="确定要导出到execl吗？">导出execl</a>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">用户名</th>
                <th align="center">真实姓名</th>
                <th align="center">信用积分</th>
                <th align="center">会员积分</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
             <c:choose>
	                	<c:when test="${pageBean.page == null or pageBean.page == '[]' }">
	                	<tr align="center">
            		<td align="center" colspan="6">暂无数据</td>
            	</tr>
	                	</c:when>
	                	<c:otherwise>
	                	<c:forEach items="${pageBean.page }" var="item" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>${item.username }</td>
	                <td>${item.realName }</td>
	                <td>${item.creditrating }</td>
	                <td>${item.rating }</td>
	                <td>
	                	<a href="javascript:;" data-toggle="navtab" class="btn btn-green"
	                	data-options="{id:'user${status.index+1+count }', url:'userintegralcreditinfo.do?id=${item.ids }&type=1', title:'信用积分明细'}">
                			信用积分明细
                		</a>
                		&nbsp;
                		<a href="javascript:;" data-toggle="navtab" class="btn btn-green"
	                	data-options="{id:'user${status.index+2+count }', url:'userintegralcreditinfo.do?id=${item.ids }&type=2', title:'会员积分明细'}">
                			会员积分明细
                		</a>
                		&nbsp;
                		<a href="addintegral.do?id=${item.ids }&tabid=${tabid }" data-toggle="dialog" data-mask="true" data-width="500" data-height="400" class="btn btn-green">添加信用分</a>
	                </td>
            	</tr>
            </c:forEach>
	                	</c:otherwise>
	                </c:choose>
	                
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
          <span>&nbsp;条，共 ${pageBean.totalNum } 条， 共 ${pageBean.totalPageNum } 页</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>