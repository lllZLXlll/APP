<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
</script>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="rechargeecordsInit.do" method="post">
      	<input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
            <br/><br/>
            <div>&nbsp;&nbsp;
	             会员名称：<input type="text" name="userName" id="j_custom_name" size="20" value="${userName}">
	              &nbsp;&nbsp;
	              跟踪审核：<input type="text" name="adminName" id="j_custom_name" size="20" value="${adminName}">
	              &nbsp;&nbsp;
	              真实姓名：<input type="text" name="realName" id="j_custom_name" size="20" value="${realName}">
	              &nbsp;&nbsp;
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
                <th align="center">身份证认证</th>
                <th align="center">工作认证</th>
                <th align="center">信用报告认证</th>
                <th align="center">居住地认证</th>
                <th align="center">收入认证</th>
                <th align="center">跟踪审核</th>
            </tr>
        </thead>
        <tbody>
       		<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="person" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
                <td>${person.usrename }</td>
                <td>${person.realName }</td>
                <td>
                	<c:choose>
                	<c:when test="${person.tmIdentityauditStatus ==1}">
					 等待审核
					</c:when>
					<c:when test="${person.tmIdentityauditStatus ==2}">
					审核失败
					</c:when>
					<c:when test="${person.tmIdentityauditStatus ==3}">
					通过
					</c:when>
					<c:otherwise>
				     未申请
					</c:otherwise>
					</c:choose>
                </td>
                <td>
                	<c:choose>
                	<c:when test="${person.tmworkauditStatus ==1}">
					 等待审核
					</c:when>
					<c:when test="${person.tmworkauditStatus ==2}">
					审核失败
					</c:when>
					<c:when test="${person.tmworkauditStatus ==3}">
					通过
					</c:when>
					<c:otherwise>
				     未申请
					</c:otherwise>
					</c:choose>
                </td>
                <td>
                	<c:choose>
                	<c:when test="${person.tmresponseauditStatus ==1}">
					 等待审核
					</c:when>
					<c:when test="${person.tmresponseauditStatus ==2}">
					审核失败
					</c:when>
					<c:when test="${person.tmresponseauditStatus ==3}">
					通过
					</c:when>
					<c:otherwise>
				     未申请
					</c:otherwise>
					</c:choose>
                </td>
                <td>
                	<c:choose>
                	<c:when test="${person.tmaddressauditStatus ==1}">
					 等待审核
					</c:when>
					<c:when test="${person.tmaddressauditStatus ==2}">
					审核失败
					</c:when>
					<c:when test="${person.tmaddressauditStatus ==3}">
					通过
					</c:when>
					<c:otherwise>
				     未申请
					</c:otherwise>
					</c:choose>
                </td>
                <td>
                	<c:choose>
                	<c:when test="${person.tmincomeeauditStatus ==1}">
					 等待审核
					</c:when>
					<c:when test="${person.tmincomeeauditStatus ==2}">
					审核失败
					</c:when>
					<c:when test="${person.tmincomeeauditStatus ==3}">
					通过
					</c:when>
					<c:otherwise>
				     未申请
					</c:otherwise>
					</c:choose>
                </td>
                <td>
                	<c:choose>
                	<c:when test="${person.serviceManName != null}">
					 ${serviceManName}
					</c:when>
					<c:otherwise>
				     未分配
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
