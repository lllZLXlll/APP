<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/mediaReportListinit.do" method="post">
      	<input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <a href="addIndexRollImgInit.do?tabid=${tabid }" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="500" data-height="500" class="btn btn-blue">&nbsp;添加图片</a>&nbsp;&nbsp;
            <div class="pull-right" style="margin-right:18%;">
            	<a href="deleteIndexRollImgByIds.do" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-idname="delids" data-group="ids" class="btn btn-blue">删除选中</a>&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center" width="40">序号</th>
                <th align="center">排序</th>
                <th align="center">图片</th>
                <th align="center">类型</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center" width="280">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="bean" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
                <td>
					${bean.ordershort}
				</td>
				<td>
					<a href="${bean.companyImg}" target="_bank" title="查看原图"><img
							src="${bean.companyImg}" width="500px" height="120px">
					</a>
				</td>
				<td>
					<c:choose>
						<c:when test="${bean.type==1 }"> 友情链接</c:when>
						<c:when test="${bean.type==2 }">投资广告</c:when>
						<c:when test="${bean.type==3 }">首页滚动图片</c:when>
					</c:choose>
				</td>
                <td><input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${bean.id }"></td>
                <td>
                	<a href="updateIndexRollImgInit.do?id=${bean.id }&tabid=${tabid}" data-toggle="dialog" data-id="updateLinksByIdInit" data-mask="true" data-width="500" data-height="500" class="btn btn-green">编辑</a>
                  
                	<a href="deleteIndexRollImg.do?id=${bean.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
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
