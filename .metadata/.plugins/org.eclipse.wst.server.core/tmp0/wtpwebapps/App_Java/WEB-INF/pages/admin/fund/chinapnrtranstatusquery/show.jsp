<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
	<br/><br/><br/>
	<table class="table table-condensed table-hover">
	    <tbody>
	    	<c:choose>
		        <c:when test="${paramMap.ret=='000' }">
		        <c:choose>
					<c:when test="${paramMap.TransStat=='P'}">
						<tr>
							<td align="center" style="border:none;">
								订单号：${paramMap.ordID }
							</td>
						</tr>  	
						<tr>	
							<td align="center" style="border:none;">
								汇付交易状态：成功
							</td>
						</tr>  	
					</c:when>
					<c:otherwise>
						<tr>
							<td align="center" style="border:none;">
								订单号：${paramMap.ordID }
							</td>
						</tr> 	
						<tr>	
							<td align="center" style="border:none;">
								汇付交易状态：初始化
							</td>
						</tr> 	
					</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<tr>
						<td align="center" style="border:none;">
							汇付无此订单
						</td>
					</tr> 
				</c:otherwise>
			</c:choose>
	    </tbody>
	</table>
</div>