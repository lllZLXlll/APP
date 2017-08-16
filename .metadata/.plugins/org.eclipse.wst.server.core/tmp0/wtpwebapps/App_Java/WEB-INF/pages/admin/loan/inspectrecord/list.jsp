<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryBorrowInspectRecord.do?borrowId=${borrowId}" method="post">
    	<input type="hidden" name="tabid" value="${tabid}">
	        <input type="hidden" name="pageSize" value="${pageSize}">
	        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
	          <input type="hidden" name="borrowId" value="${borrowId}">
    	<div class="bjui-searchBar">
	        
	        <br/>&nbsp;&nbsp;
	        <c:if test="${borrowId !='' and admin.id != -1 and admin.loanUserId != -100}">
	        	 <a href="saveOrUpdateBorrowMonthInspectInit.do?borrowId=${borrowId }&tabid=${tabid}&inspectId=${inspectId}" data-toggle="dialog" 
                   data-id="addBorrowMonthInspectInit" data-mask="true" data-title="${borrowTitle }-新增月检" data-width="700" data-height="700" class="btn btn-blue">新增月检</a>&nbsp;
	        </c:if>
	       
	        
	      &nbsp;
	       	
	       	<label>借款标题：</label><input type="text" id="borrowTitle" value="${title }" name="borrowTitle" class="form-control">&nbsp;
	        
			<label>状态：</label>
		 	<select name="status" id="status" data-toggle="selectpicker">
            	<option value="">全部</option>
               	<option value="1" ${status == 1?'selected':''}>正常</option>
               	<option value="2" ${status == 2?'selected':''}>关注</option>
               	<option value="3" ${status == 3?'selected':''}>较严重</option>
               	<option value="4" ${status == 4?'selected':''}>严重</option>
           	</select>&nbsp;    
           	<button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
           	<a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
        </div>
    </form>
    
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">借款标题</th>
                <th align="center">借款金额</th>
                <th align="center">维护经理</th>
                <th align="center">借款时间</th>
                <th align="center">任务生成时间</th>
                <th align="center">处理时间</th>
                <th align="center">资料文件</th>
                <th align="center">状态</th>
                <th align="center">现场照片</th>
                <th align="center">是否收入</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        				 <c:choose>
	                	<c:when test="${pageBean.page == null or pageBean.page == '[]' }">
	                	<tr align="center">
            		<td align="center" colspan="11">暂无数据</td>
            	</tr>
	                	</c:when>
	                	<c:otherwise>
	                	   	<c:forEach items="${pageBean.page }" var="item" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }  </td>
	                <td>${item.borrowTitle1 }</td>
	                <td><fmt:formatNumber value="${item.borrowAmount }" type="currency" pattern="#,##0.00"/></td>
	                 <td>${item.loanName }</td>
	                <td><fmt:formatDate value="${item.publishTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                <td><fmt:formatDate value="${item.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                <td><fmt:formatDate value="${item.operatingTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                <td>
	                
	                  <c:choose>
	                	<c:when test="${item.collectMaterialId=='0' }">
	                	 	  <a href="uploadLoanAfterDataInit.do?id=${item.id }&dialogId=uploadLoanAfterFileData1&inspectId=${item.insepctId}" class="btn btn-red"  data-toggle="dialog" 
					  data-title="${item.borrowTitle1 }-资料"  data-id="uploadLoanAfterFileData1" data-mask="true" data-width="700" data-height="700">上传资料    </a>
					  
	                	</c:when>
	                	<c:otherwise>
	                	 <a href="uploadLoanAfterDataInit.do?id=${item.id }&dialogId=uploadLoanAfterFileData2&inspectId=${item.insepctId}" class="btn btn-green"  data-toggle="dialog" 
					  data-title="${item.borrowTitle1 }-资料" data-title="${data.companyname }资料"  data-id="uploadLoanAfterFileData2" data-mask="true" data-width="700" data-height="700">查看资料  </a>
	                	</c:otherwise>
	                </c:choose>
	                </td>
	                <td>
					    <c:choose>
	                	<c:when test="${item.status==1 }">
	                	正常
	                	</c:when>
	                	<c:when test="${item.status==2 }">
	                	    关注
	                	</c:when>
	                	<c:when test="${item.status==3 }">
	                	   较严重
	                	</c:when>
	                	<c:otherwise>
	                		   严重
	                	</c:otherwise>
	                </c:choose>
	                </td>
	                <td>
					    <c:choose>
	                	<c:when test="${item.sitePhotoId=='0' }">
	                	  <a href="uploadLoanAfterDataInit.do?id=${item.id }&dialogId=uploadLoanAfterImgData1&inspectId=${item.insepctId}" class="btn btn-red"  data-toggle="dialog" 
					  data-title="${item.borrowTitle1 }-图片"  data-id="uploadLoanAfterImgData1" data-mask="true" data-width="700" data-height="700">上传图片    </a>
	                	</c:when>
	                	<c:otherwise>
	                	 <a href="uploadLoanAfterDataInit.do?id=${item.id }&dialogId=uploadLoanAfterImgData2&inspectId=${item.insepctId}" class="btn btn-green"  data-toggle="dialog" 
					  data-title="${item.borrowTitle1 }-图片"  data-id="uploadLoanAfterImgData2" data-mask="true" data-width="700" data-height="700">查看图片 </a>
	                	</c:otherwise>
	                </c:choose>
	                </td>
	                <td>
	                
	                <c:choose>
	                	<c:when test="${item.isIncome==1 }">
	                		 是
	                	</c:when>
	                	<c:otherwise>
	                	     否
	                	</c:otherwise>
	                </c:choose>
	               </td>
	                <td>
	                
	                
	               
	                	 <a href="saveOrUpdateBorrowMonthInspectInit.do?id=${item.id }&tabid=${tabid}&inspectId=${item.insepctId}" data-toggle="dialog" 
                   data-id="saveOrUpdateAdminInitDialog" data-mask="true" data-width="700" data-height="700" class="btn btn-green">
                    <c:choose>
	                	<c:when test="${admin.id != -1 and admin.roleId==-16 }">
	                		  编辑
	                	</c:when>
	                	<c:otherwise>
	                		查看
	                	</c:otherwise>
	                </c:choose>
                 </a>
	                	
                	</td>
            	</tr>
            </c:forEach>
	                	</c:otherwise>
	                </c:choose>
	</choose>
        </tbody>
    </table>
</div>

<div class="bjui-pageFooter">
    <div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
            	<option value="10">10</option>
            	<option value="20" selected="selected">20</option>
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