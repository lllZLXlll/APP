<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/borrowtypeinitlist.do" method="post">
        <input type="hidden" name="tabid" value="${tabid}">
        <input type="hidden" name="pageSize" value="${pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
                <th align="center">序号</th>
                <th align="center">借款类型</th>
                <th align="center">名称</th>
                <th align="center">标识符</th>
                <th align="center">年利率</th>
                <th align="center">借款期限(月/天)</th>
                <th align="center">有效期</th>
                <th align="center">冻结保证金</th>
                <th align="center">还款方式</th>
                <th align="center">状态</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	<c:forEach items="${pageBean.page }" var="bean" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
	                <td>
							<c:forEach var="map" items="${mapTypeList }">
								<c:if test="${map.id == bean.amount_type }">
									${map.name }
								</c:if>
							</c:forEach>
							</td>
								<td align="center">
						   		${bean.title }
							</td>
							<td>
								${bean.nid}
							</td>
							<td align="center">
						   		${bean.apr_first }%~${bean.apr_end }%
							</td>	
							<td align="center">
						   		${bean.period_month }月<br />
						   		${bean.period_day}天
							</td>	
							<td align="center">
							<c:choose>
								<c:when test="${bean.validate == '0'}">无限制</c:when>
								<c:otherwise>${bean.validate }天</c:otherwise>
							</c:choose>
							</td>
							<td align="center">
						   		${bean.vip_frost_scale }%
							</td>
							<td align="center">
							<c:choose>
								<c:when test="${bean.nid == 'seconds' }">
									秒还				
								</c:when>
								<c:when test="${bean.nid == 'flow'}">一次性还款</c:when>
								<c:otherwise>
									${bean.titles }
								</c:otherwise>
							</c:choose>
							</td>
							<td align="center">
							<c:choose>
								<c:when test="${bean.status == 1}">
									开启
								</c:when>
							    <c:otherwise>
							    	关闭
							    </c:otherwise>
						    </c:choose>
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
            	<option value="10">10</option>
            	<option value="20" selected="selected">20</option>
                <option value="30">30</option>
                <option value="60">60</option>
                <option value="120">120</option>
                <option value="150">150</option>
            </select>
        </div>
        <span>&nbsp;条，共 ${pageBean.totalNum } 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>