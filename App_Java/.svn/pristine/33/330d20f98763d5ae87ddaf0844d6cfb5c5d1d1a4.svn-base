<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryUserListInit.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <label>用户名：</label><input type="text" id="userName" maxlength="30" value="${userName }" name="userName"  class="form-control" >&nbsp;
             <label>姓名：</label><input type="text" id="realName" maxlength="30" value="${realName }" name="realName"  class="form-control">
            &nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
             <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
              <a href="sendAllSMS.do" class="btn btn-blue" 
                 data-toggle="doajax" data-confirm-msg="确定发送短信给所有用户吗？">全部发送</a>&nbsp;&nbsp;
           <a href="sendSMSs.do" data-toggle="doajaxchecked" data-confirm-msg="确定要发送信息给选中的用户吗？"
           data-idname="cellPhones" data-group="ids" class="btn btn-blue">发送选中</a>&nbsp;&nbsp;
            <a href="querySendSMSInfo.do?tabid=${tabid }" data-toggle="dialog" data-id="querySendSMSInfo" data-mask="true" 
            data-width="600" data-height="500" class="btn btn-blue">编辑发送内容</a>&nbsp;&nbsp;
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
                <th align="center">用户名</th>
                <th align="center">姓名</th>
                <th align="center">总额（元）</th>
                <th align="center">可用金额（元）</th>
                <th align="center">投标金额（元）</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.username }</td>
                <td>${data.realname }</td>
                <td><fmt:formatNumber value="${data.totalSum }" type="currency" pattern="#,##0.00"/></td>
                <td><fmt:formatNumber value="${data.usableSum }" type="currency" pattern="#,##0.00"/></td>
                <td><fmt:formatNumber value="${data.realAmount }" type="currency" pattern="#,##0.00"/></td>
                <td><input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${data.cellPhone }"></td>
                <td>
                 <a href="sendSMSs.do?cellPhones=${data.cellPhone }" class="btn btn-green" 
                 data-toggle="doajax" data-confirm-msg="确定发送短信给-${data.realname }-吗？">发送</a>
                 
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
