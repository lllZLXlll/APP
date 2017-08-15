<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
function serachRecommendUser(){
	var operatingTime=$("#beginTime").val();
	var endTime=$("#endTime").val();
	operatingTime = operatingTime.replace(/-/g,'/');
	endTime = endTime.replace(/-/g,"/");
	var date1= new Date(operatingTime);  //开始时间
	var date2=new Date(endTime);    //结束时间
	var date3=date2.getTime()-date1.getTime();  //时间差的毫秒数
		
		if(operatingTime==""&& endTime==""){
			$('#pagerForm').submit(); 
		}else{
			if(operatingTime==""){
				$(this).alertmsg('warn', '开始时间不能为空！');
				return;
			}
			if(endTime==""){
				$(this).alertmsg('warn', '结束时间不能为空！');
				return;
			}
		if(date3<0){
			$(this).alertmsg('warn', '结束时间不能小于开始时间！');
			return;
	 	 }else{
	 	 $('#pagerForm').submit(); 
	 	 }
		 
		}
	}
</script>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="appVersionInit.do" method="post">
      	<input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/> &nbsp;&nbsp;
            <a href="addAppVersionInit.do?tabid=${tabid }" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="700" data-height="700" class="btn btn-blue">&nbsp;添加app版本管理</a>&nbsp;&nbsp;
	              发布起始时间：<input type="text" name="beginTime" id="beginTime" data-toggle="datepicker"  data-rule="date" size="20">
	              发布结束时间：<input type="text" name="endTime" id="endTime" data-toggle="datepicker"  data-rule="date" size="20">
	            <button type="button" class="btn-default" data-icon="search" onclick="serachRecommendUser()">查询</button>&nbsp;
	            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">版本号</th>
                <th align="center">app类型</th>
                <th align="center">发布时间</th>
                <th align="center">是否必须更新</th>
                <th align="center">版本名称</th>
                <th align="center">下载地址</th>
                <th align="center">描述</th>
                <th align="center">插入时间</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${pageBean.page }" var="appVersion" varStatus="status">
              <tr data-id="65" align="center">
                <td >${appVersion.version }</td>
                <td>
                	<c:choose>
                		<c:when test="${appVersion.type == 1 }">
                			安卓
                		</c:when>
	                	<c:otherwise>
	                		苹果
	                	</c:otherwise>
                	</c:choose>
                </td>
                <td>${appVersion.publishTime }</td>
                <td>
                	<c:choose>
                		<c:when test="${appVersion.isUpdate == 1 }">
                			是
                		</c:when>
	                	<c:otherwise>
	                		否
	                	</c:otherwise>
                	</c:choose>
                </td>
                <td>${appVersion.versionName }</td>
                <td>${appVersion.downloadPath }</td>
                <td>${appVersion.descript }</td>
                <td><fmt:formatDate value="${appVersion.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${mediaCoverage.id }"></td>
                <td>
                	<a href="updateAppVersionByIdInit.do?id=${appVersion.id }&tabid=${tabid}" data-toggle="dialog" data-id="updateMediareportByIdInit" data-mask="true" data-width="700" data-height="800" class="btn btn-green">编辑</a>
                   
                	<a href="deleteAppVersionById.do?id=${appVersion.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
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
