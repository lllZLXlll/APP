<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="enterpriseAddBorrowInit.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <div class="bjui-searchBar">
        	<br/>
            &nbsp;&nbsp;
             <a href="addEnterpriseInit.do?tabid=${tabid }" data-toggle="dialog" data-id="addRecommendDialog" data-mask="true" data-width="700" data-height="600" class="btn btn-blue">增加企业融资</a>&nbsp;&nbsp;&nbsp;
            <label>联系人：</label><input type="text" id="customNo" value="${name }" name="name" class="form-control" maxlength="10" size="14">&nbsp;
            <label>联系电话：</label><input type="text" value="${telephone }" name="telephone" class="form-control" maxlength="11" size="14">&nbsp;
            <label>借款金额：</label><input type="text" id="customNo" value="${borrowAmount }" name="borrowAmount" maxlength="20" class="form-control" size="14">&nbsp;
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
             <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
            <div class="pull-right">
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
                <th align="center">联系电话</th>
                <th align="center">企业名称</th>
                <th align="center">借款金额（￥元）</th>
                <th align="center">绑定用户</th>
                 <th align="center">基本信息</th>
                <th align="center">上传资料</th>
                <th align="center">发布借款</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
                <td >${status.index+1+count }</td>
                <td>${data.telephone }</td>
                <td>${data.companyname }</td>
                <td>
                <fmt:formatNumber value="${data.borrowAmount }" type="currency" pattern="#,##0.00"/>
                </td>
                <td>
                  <c:choose>
					<c:when test="${data.userId ==null }">
							 <a href="bindUserInit.do?id=${data.id }&tabid=${tabid}&applyId=${data.id }"  data-mask="true" data-toggle="dialog"
							  data-width="700" data-height="500" data-id="form" class="btn btn-red" >未绑定用户信息</a>
					</c:when>
					<c:otherwise>
					
					 <a href="bindUserInit.do?id=${data.id }&tabid=${tabid}&applyId=${data.id }&userId=${data.userId }"  data-mask="true" data-toggle="dialog"
							  data-width="700" data-height="500" data-id="form" class="btn btn-green" >已绑定用户信息</a>
							  
					</c:otherwise>
				</c:choose>
				
               </td>
                <td>
                 <c:choose>
                 	
					<c:when test="${data.userId ==null }">
						 <a href="javascript:;" class="btn btn-default" data-toggle="alertmsg" data-type="warn"  class="btn btn-red"  data-msg="请先绑定用户!">基本信息未填写</a>
					</c:when>
					
					<c:when test="${data.authStep ==null }">
					<a href="queryCompanyDataById.do?id=${data.id }&tabid=${tabid}" class="btn btn-red" data-mask="true" data-toggle="dialog" data-width="700" data-height="600" data-id="form" >基本信息未填写</a>
					</c:when>
					
					<c:otherwise>
					<a href="queryCompanyDataById.do?id=${data.id }&tabid=${tabid}" data-mask="true" 
					data-toggle="dialog" data-width="700" data-height="600" data-id="form" class="btn btn-green" 
					data-title="${data.companyname }-基本信息">基本信息完整</a>
					</c:otherwise>
				</c:choose>
                
               </td>
                 <td>
                	
                	<c:choose>
					<c:when test="${data.authStep ==2 }">
					 <a href="enterpriseUserUploadInit.do?applyId=${data.id }&tabid=companyDataTab-${data.id }&userId=${data.userId}"  
					 data-toggle="navtab" data-id="companyDataTab-${data.id }" class="btn btn-green" 
					  data-title="${data.companyname }-资料列表">资料列表    </a>
					</c:when>
					
					<c:when test="${data.userId ==null }">
					 <a href="javascript:;" class="btn btn-default" data-toggle="alertmsg" data-type="warn" class="btn btn-green" data-msg="请先绑定用户!">上传资料</a>
					</c:when>
					
					<c:when test="${data.authStep ==null }">
						<a href="javascript:;" class="btn btn-default" data-toggle="alertmsg" data-type="warn" class="btn btn-green" data-msg="请先填写基本信息!">上传资料</a>
					</c:when>
					
					<c:otherwise>
					 <a href="enterpriseUserUploadInit.do?applyId=${data.id }&tabid=companyDataTab-${data.id }&userId=${data.userId}" class="btn btn-red"  data-toggle="navtab" data-id="companyDataTab-${data.id }" 
					  data-title="${data.companyname }-资料列表">上传资料    </a>
					</c:otherwise>
				</c:choose>
				
                </td>
                <td>
                
                
                	 <c:choose>
                	 
                	 <c:when test="${data.userId ==null }">
					 <a href="javascript:;" class="btn btn-default" data-toggle="alertmsg" data-type="warn" class="btn btn-green" data-msg="请先绑定用户!">发布借款</a>
					</c:when>
                	 
                	 <c:when test="${data.authStep ==null }">
                	 	<a href="javascript:;" class="btn btn-default" data-toggle="alertmsg" data-type="warn" class="btn btn-green" data-msg="请先填写基本信息!">发布借款</a>
                	 </c:when>
                	 
					<c:when test="${data.authStep !=2 }">
					 <a href="javascript:;" class="btn btn-default" data-toggle="alertmsg" data-type="warn" class="btn btn-green" data-msg="请先上传资料!">发布借款</a>
					</c:when>
                	 
					
					<c:when test="${data.viewpdfUrl ==null }">
					 	<a href="authfadadaInit.do?id=${data.id }&tabid=${tabid}&conpany=${data.companyname}&userId=${data.userId }" class="btn btn-red" 
						data-mask="true" data-toggle="dialog" data-width="700" data-height="450" data-id="form" 
					 	data-title="${data.companyname }-基本信息">法大大授权</a>
					</c:when>
					
					<c:otherwise>
						<a href="publishborrowInit.do?id=${data.id }&tabid=${tabid}&conpany=${data.companyname}&userId=${data.userId }" class="btn btn-green" 
						data-toggle="navtab" data-id="form" data-width="700" data-height="600" data-id="form" data-title="${data.companyname }-发布借款">发布借款</a>
					</c:otherwise>
				</c:choose>
                
              
                <td>
                 <c:choose>
					<c:when test="${data.userId ==null }">
					 <a href="javascript:;" class="btn btn-default" data-toggle="alertmsg" data-type="warn" class="btn btn-green" data-msg="请先绑定用户!">编辑</a>
					</c:when>
					
					<c:otherwise>
					 <a href="queryCompanyDataById.do?id=${data.id }&tabid=${tabid}&companyname=${data.companyname}" class="btn btn-green" data-mask="true" data-toggle="dialog" data-width="700" data-height="600" data-id="form" 
					 data-title="${data.companyname }-基本信息">编辑</a>
					</c:otherwise>
				</c:choose>
                    <a href="deleteApplyById.do?id=${data.id }" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删除</a>
                    
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
	function reload(options){
	alert(options);
	}
</script>
