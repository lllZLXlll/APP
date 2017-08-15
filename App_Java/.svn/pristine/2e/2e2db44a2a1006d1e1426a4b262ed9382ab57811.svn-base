<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
   
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr height="25px">
            	<th align="center">序号</th>
                <th align="center">名称</th>
                <th align="center">金额或者金额百分比</th>
      			<th align="center">备注</th>
      			<th align="center">状态</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        
        			<c:choose>
	                	<c:when test="${pageBean.page == null or pageBean.page == '[]' }">
	                	<tr align="center">
            				<td align="center" colspan="6">暂无数据</td>
            			</tr>
	                	</c:when>
	                	<c:otherwise>
	                	   
        	<c:forEach items="${pageBean.page }" var="data" varStatus="status">
              <tr data-id="65" align="center">
               <td >${status.index+1+count }</td>
                <td >${data.rbName }</td>
                <td >
                	<c:choose>
	                	<c:when test="${data.costMode==1 }">
	                	${data.costFee}%
	                	</c:when>
	                	<c:otherwise>
	                		${data.rbFee}元
	                	</c:otherwise>
	                </c:choose>
                
                </td>
                <td >${data.remark }</td>
                
                <td >
                <c:if test="${data.state==1 }">开启</c:if>
                <c:if test="${data.state==2 }">关闭</c:if>
                </td>
	            
                <td>
                
                	<a href="updatePlatFormCostInit.do?id=${data.id }&tabid=${tabid}" data-toggle="dialog" 
                   data-id="updatePlatFormCostInit" data-mask="true" data-width="600" data-height="500" class="btn btn-green">编辑</a>
                </td>
            </tr>
            </c:forEach>
	                	</c:otherwise>
	                </c:choose>
	                
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
