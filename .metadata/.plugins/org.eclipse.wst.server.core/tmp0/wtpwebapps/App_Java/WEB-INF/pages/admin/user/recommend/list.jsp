<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/recommendInit.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <a href="addRecommendInit.do?tabid=${tabid }" data-toggle="dialog" data-id="addRecommendDialog" data-mask="true" data-width="500" data-height="300" class="btn btn-blue">新增推荐人</a>&nbsp;&nbsp;
            <label>被推荐人ID：</label><input type="text" id="customNo" value="${userId }" name="userId" maxlength="15" class="form-control" size="14">&nbsp;
            <label>被推荐人姓名：</label><input type="text" value="${userName }" name="userName" class="form-control" maxlength="20" size="10">&nbsp;
            <label>推荐人ID：</label><input type="text" id="customNo" value="${recommendUserId }" name="recommendUserId" maxlength="15" class="form-control" size="14">&nbsp;
            <label>推荐人姓名：</label><input type="text" value="${recommendUsername }" name="recommendUsername" maxlength="20" class="form-control" size="10">&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
             <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
            	<a href="deleteRecommendByIds.do" data-toggle="doajaxchecked" data-confirm-msg="确定要删除选中项吗？" data-icon="remove" data-idname="delids" data-group="ids" class="btn btn-blue">删除选中</a>&nbsp;&nbsp;&nbsp;
               	<a href="exporRecommendUserInfo.do" data-toggle="doexport" class="btn btn-green" data-icon="floppy-o" data-confirm-msg="确定要导出信息吗？">导出全部</a>
            </div>
        </div>
        <div class="bjui-moreSearch">
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">序号</th>
                <th align="center">被推荐人ID</th>
                <th align="center">被推荐人姓名</th>
                <th align="center">推荐人ID</th>
                <th align="center">推荐人姓名</th>
                <th align="center">奖励金额（￥元）</th>
                <th align="center">奖励时间</th>
                <th align="center">维护人</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="recommendUser" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${recommendUser.userId }</td>
                <td>${recommendUser.realName }</td>
                <td>${recommendUser.recommendUserId }</td>
                <td>${recommendUser.recommendUsername }</td>
                <td>${recommendUser.rewardMoney }</td>
                <td>${recommendUser.rewardTime } </td>
                <td>
                	${recommendUser.maintenanceman }
                </td>
                
                <td><input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${recommendUser.id }"></td>
                
                <td>
                   
                   <a href="queryRecommendById.do?id=${recommendUser.id }&tabid=${tabid}" data-toggle="dialog" data-id="queryRecommendById" data-mask="true" data-width="600" data-height="500" class="btn btn-green">编辑</a>
                  
                    <a href="deleteRecommendById.do?id=${recommendUser.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                    
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
