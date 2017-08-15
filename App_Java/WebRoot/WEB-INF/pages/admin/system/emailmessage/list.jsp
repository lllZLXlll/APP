<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="emailAndMessageindex.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <a href="saveOrUpdateSmsInit.do?tabid=${tabid }" data-toggle="dialog" data-id="addSmsInit" data-mask="true" data-width="600" data-height="500" class="btn btn-blue">新增短信运营商</a>&nbsp;&nbsp;
            <a href="queryEmailList.do?tabid=emailset" data-toggle="navtab" data-id="emailset" class="btn btn-blue">邮件设置</a>&nbsp;&nbsp;
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
        
        	<tr height="40px">
            	<td align="center" colspan="9">
            	当前短信运营商 :
            	
            	 <c:choose>
	                	<c:when test="${config.smsoperator != null }">
	                		${config.smsoperator } 
	                	</c:when>
	                	<c:otherwise>
	                		随机发送
	                	</c:otherwise>
	                </c:choose>
            	
            	
            	&nbsp;&nbsp;
            	<a href="updateConfigSmsInit.do?tabid=${tabid }" data-toggle="dialog" data-id="addRecommendDialog" data-mask="true" 
            	data-width="700" data-height="500" class="btn btn-blue">修改发送短信运营商</a></td>
            	
            </tr>
            <tr >
            	<th align="center">序号</th>
                <th align="center">公司名称</th>
                <th align="center">短信运营商名称</th>
                <th align="center">短信账户</th>
                <th align="center">密码</th>
                <th align="center">发送URL</th>
                <th align="center">启用状态</th>
                <th align="center">标识</th>
                <th align="center">配置时间</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.account }</td>
                <td>${data.smsoperator }</td>
                <td>${data.userId }</td>
                <td>${data.password }</td>
                <td>${data.url }</td>
                <td>
                
                <c:if test="${data.status == 1 }">
                		<span style="color:green;">启用</span>
                </c:if>
                 <c:if test="${data.status == 2 }">
                		<span style="color: red;">禁用</span>
                </c:if>
                
                </td>
                <td>${data.type }</td>
                <td><fmt:formatDate value="${data.configTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td>
                   <a href="saveOrUpdateSmsInit.do?id=${data.id }&tabid=${tabid}" data-toggle="dialog" data-id="updateSmsInit" data-mask="true" data-width="600" data-height="500" class="btn btn-green">编辑</a>
                  
                    <a href="deleteSms.do?id=${data.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除-${data.smsoperator }-短信运营商吗？">删除</a>
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
