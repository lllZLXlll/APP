<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
</script>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryPersonInfolistindex.do" method="post">
      	<input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
            <br/><br/>
            <div>&nbsp;&nbsp;
	              用户名：<input type="text" name="userName" id="j_custom_name" size="20">
	              &nbsp;&nbsp;
	              真实姓名：<input type="text" name="realName" id="j_custom_name" size="20">
	              &nbsp;&nbsp;
	              审核人：<input type="text" name="serviceManName" id="j_custom_name" size="20">
	              &nbsp;&nbsp;
	              状态：
		            <select id="j_custom_name" name="auditStatus" data-toggle="selectpicker">
		              	<option value="-1">-请选择-</option>
						<option value="1">工作信息</option>
						<option value="2">个人信息</option>
						<option value="3">联系信息</option>
					</select>
					<select id="j_custom_name" name="certificateName" data-toggle="selectpicker">
		              	<option value="-1">-请选择-</option>
						<option value="1">待审核</option>
						<option value="2">失败</option>
						<option value="3">成功</option>
						<option value="4">未填写</option>
					</select>
	            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
	            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">序号</th>
                <th align="center">用户账号</th>
                <th align="center">真实姓名</th>
                <th align="center">身份证</th>
                <th align="center">注册时间</th>
                <th align="center">手机号</th>
                <th align="center">邮箱</th>
                <th align="center">个人信息</th>
                <th align="center">审核人</th>
            </tr>
        </thead>
        <tbody>
       		<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="person" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
                <td>${person.username }</td>
                <td>${person.realName }</td>
                <td>${person.idNo }</td>
                <td><fmt:formatDate value="${person.createTime }" pattern="yyyy-MM-dd"/></td>
                <td>${person.cellPhone }</td>
                <td>${person.email }</td>
                <td>
                	<c:choose>
						<c:when test="${person.personauditStatus == 1 }">基本信息完整<a style="color: gray;">(待审核)</a></c:when>
						<c:when test="${person.personauditStatus == 2 }">基本信息完整<a style="color: red;">(失败)</a></c:when>
						<c:when test="${person.personauditStatus == 3 }">基本信息完整<a style="color: blue;">(成功)</a></c:when>
						<c:otherwise >未填写</c:otherwise>
					</c:choose>
				</td>
                <td>
                	<c:choose>
                		<c:when test="${person.service != null }">${person.service}</c:when>
                		<c:otherwise >未分配</c:otherwise>
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
            	<option value="15">15</option>
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
