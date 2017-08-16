<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryUserManageIndex.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
            <label>用户名：</label><input type="text" id="customNo" value="${userName }" name="userName" maxlength="20" class="form-control" size="20">&nbsp;
            <label>真实姓名：</label><input type="text" value="${realName }" name="realName" class="form-control" maxlength="15" size="15">&nbsp;&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
             <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
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
            <tr >
            	<th align="center">序号</th>
                <th align="center">用户名</th>
                <th align="center">真实姓名</th>
                <th align="center">邮箱</th>
                <th align="center">手机号</th>
                <th align="center">注册时间</th>
                <th align="center">最后登入IP</th>
                <th align="center">最后登入时间</th>
                <th align="center">用户汇付号</th>
                <th align="center">法大大证书号</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
               <td>
					${data.username }
					</td>
					<td>
					${data.realName }
					</td>
					<td>
					${data.email }
					</td>
					<td>
					${data.cellPhone }
					</td>
					<td>
					${data.createTime }
					</td>
					<td>
					${data.lastIP }
					</td>
					<td>
					${data.lastDate }
					</td>  
					<td>
						<c:choose>
							<c:when test="${data.ipayAccount>0 }">
								${data.ipayAccount}
							</c:when>
							<c:otherwise>
								<a href="synchIpayAccount.do?userId=${data.ids }" class="btn btn-green" data-toggle="doajax" data-confirm-msg="确定要同步法汇付号吗？">同步汇付号</a>
							</c:otherwise> 
						</c:choose>
					</td>
					<td>
						<c:choose>
							 <c:when test="${data.customer_id==null }">
							 	<c:choose>
									<c:when test="${data.ipayAccount>0}">
										<a href="synchFaDaDa.do?userId=${data.ids }" class="btn btn-green" data-toggle="doajax" data-confirm-msg="确定要同步法大大吗？">添加法大大证书</a>	
								    </c:when>
								    <c:otherwise> --</c:otherwise> 
								 </c:choose>
							 </c:when>
							 <c:otherwise>
							    ${data.customer_id}
							 </c:otherwise> 
						</c:choose>
					</td>
                <td>
                    <a href="checkRechangeUserInfo.do?userId=${data.ids }&realName=${data.realName}&username=${data.username}&ipayAccount=${data.ipayAccount}&cellPhone=${data.cellPhone}&tabid=${tabid}" data-toggle="dialog" data-id="updateAppOperateReportByIdInit" data-mask="true" data-width="600" data-height="500" class="btn btn-green">充值</a>
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
