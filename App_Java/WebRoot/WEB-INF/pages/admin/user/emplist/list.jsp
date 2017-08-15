<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryEmpManageInfoIndex.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="tabid" value="${tabid}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <a href="addEmpInit.do?tabid=${tabid }" data-toggle="dialog" data-id="addEmpDialog" data-mask="true" data-width="500" data-height="400" class="btn btn-blue">添加新员工</a>&nbsp;&nbsp;
            <label>员工编号：</label><input type="text" id="empNo" value="${empNo }" name="empNo" maxlength="15" class="form-control" size="14">&nbsp;
            <label>员工姓名：</label><input type="text" value="${empName }" name="empName" class="form-control" maxlength="20" size="10">&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">序号</th>
                <th align="center">员工编号</th>
                <th align="center">员工姓名</th>
                <th align="center">员工性别</th>
                <th align="center">员工生日</th>
                <th align="center">员工身份证号</th>
                <th align="center">员工手机号</th>
                <th align="center">员工邮箱</th>
                <th align="center">员工所属部门</th>
                <th align="center">员工职位</th>
                <th align="center">创建时间</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="recommendUser" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${recommendUser.empNo }</td>
                <td>${recommendUser.empName }</td>
                <td>${recommendUser.empSex }</td>
                <td>${recommendUser.empBirthday }</td>
                <td>${recommendUser.empIdentityCard }</td>
                <td>${recommendUser.empTelephone } </td>
                <td>${recommendUser.empEmail }</td>
                <td>${recommendUser.empDepartment }</td>
                <td>${recommendUser.empJobs }</td>
                <td><fmt:formatDate value="${recommendUser.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>
                    <a href="deleteEmpById.do?id=${recommendUser.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
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
