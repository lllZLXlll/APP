<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
</script>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryDateCountInitindex.do" method="post">
      	<input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
            <br/><br/>
            <div>&nbsp;&nbsp;
	             会员名称：<input type="text" name="userName" id="j_custom_name" size="20" value="${userName}">
	              &nbsp;&nbsp;
	              真实姓名：<input type="text" name="realName" id="j_custom_name" size="20" value="${realName}">
	              &nbsp;&nbsp;
	              认证：<select id="j_custom_name" name="materAuthTypeId" data-toggle="selectpicker">
		              	<option value="">-请选择-</option>
						<option value="1" ${materAuthTypeId == 1 ? 'selected' : '' }>身份认证</option>
						<option value="2" ${materAuthTypeId == 2 ? 'selected' : '' }>工作认证</option>
						<option value="4" ${materAuthTypeId == 4 ? 'selected' : '' }>信用报告认证</option>
						<option value="3" ${materAuthTypeId == 3 ? 'selected' : '' }>居住地认证</option>
						<option value="5" ${materAuthTypeId == 5 ? 'selected' : '' }>收入认证</option>
						<option value="6" ${materAuthTypeId == 6 ? 'selected' : '' }>房产</option>
						<option value="7" ${materAuthTypeId == 7 ? 'selected' : '' }>购车</option>
						<option value="8" ${materAuthTypeId == 8 ? 'selected' : '' }>结婚</option>
						<option value="9" ${materAuthTypeId == 9 ? 'selected' : '' }>学历</option>
						<option value="10" ${materAuthTypeId == 10 ? 'selected' : '' }>技术</option>
						<option value="11" ${materAuthTypeId == 11 ? 'selected' : '' }>手机</option>
						<option value="12" ${materAuthTypeId == 12 ? 'selected' : '' }>微博</option>
						<option value="13" ${materAuthTypeId == 13 ? 'selected' : '' }>现场</option>
						<option value="14" ${materAuthTypeId == 14 ? 'selected' : '' }>抵押</option>
						<option value="15" ${materAuthTypeId == 15 ? 'selected' : '' }>担保</option>
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
                <th align="center">证件种类</th>
                <th align="center">图片状态</th>
                <th align="center">审核观点</th>
                <th align="center">上传时间</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
       		<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="person" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
                <td>${person.username }</td>
                <td>${person.realName }</td>
                <td>${person.tmtname }</td>
                <td>
                	<c:choose>
	                	<c:when test="${person.auditStatus ==1}">
							待审
						</c:when>
						<c:when test="${person.auditStatus ==2}">
							无效
						</c:when>
						<c:when test="${person.auditStatus ==3}">
							有效
						</c:when>
						<c:otherwise>
							未上传
						</c:otherwise>
					</c:choose>
                </td>
                <td>${person.tmoption } </td>
                <td>${person.passTime }</td>
                <td>
                	<a href="countindex.do?ui=${person.ids }&mt=${materAuthTypeId}" data-toggle="dialog" data-mask="true" data-width="500" data-height="500" class="btn btn-green">查看</a>
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
