<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 

<div class="bjui-pageContent">
    <form action="saveOrUpdateAdmin.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
          <input type="hidden"  name="tabid" value="${tabid }">
         <input type="hidden" id="id" name="id" value="${id }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
            
            	<tr align="center">
	                <th align="center">序号</th>
	                <th align="center">意见内容</th>
	                <th align="center">记录时间</th>
            	</tr>
            	
            	<c:choose>
				<c:when test="${historyAdvise == null }">
					<tr align="center">
            		<td align="center" colspan="3">暂无数据</td>
            	</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${historyAdvise }" var="item" varStatus="status">
					<tr  align="center">
				 	<td>${status.index+1 }</td>
	                <td>${item.advise }</td>
	                <td><fmt:formatDate value="${item.recordTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            	</tr>
            </c:forEach>
                
				</c:otherwise>
				</c:choose>
				
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
    </ul>
</div>
