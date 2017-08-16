<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader" >
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryRecommendInvestList.do" method="post">
      	<input type="hidden" name="pageSize" id="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" id="pageCurrent" value="${pageBean.pageNum}">
        <input type="hidden" name="tabid" id="tabid" value="${tabid}">
        <div class="bjui-searchBar">
            <br/>&nbsp;&nbsp;
            	借款标题：<input type="text" name="borrowTitle" value="${borrowTitle }" class="form-control" size="20">
            	 推荐人姓名：<input type="text" name="recommendUsername" value="${recommendUsername }"  class="form-control" size="10">
	                              被推荐人姓名：<input type="text" name="realName" value="${realName }" class="form-control" size="10">
	                              奖励金额：
	            <select id="money" name="money" data-toggle="selectpicker">
		              	<option value="-1" ${money==-1 ? 'selected' : '' }>-请选择-</option>
						<option value="1" ${money==1 ? 'selected' : '' }>200元及以上</option>
						<option value="2" ${money==2 ? 'selected' : '' }>200元以下</option>
				</select>&nbsp;
            	发放状态：
            	<select id="status" name="status" data-toggle="selectpicker">
		              	<option value="-1" ${status==-1 ? 'selected' : '' }>-请选择-</option>
						<option value="1" ${status==1 ? 'selected' : '' }>未发放</option>
						<option value="2" ${status==2 ? 'selected' : '' }>已发放</option>
				</select>
            	<button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
          		<a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>&nbsp;
          		<div class="pull-right" style="margin-right:10%;">
            		<a href="addRecommendInvestReward.do" data-toggle="doajaxchecked" data-confirm-msg="确定要给选中项发放奖励吗？" data-idname="ids" data-group="ids" class="btn btn-blue">发放选中</a>&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent" >
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr >
            	<th align="center">序号</th>
            	<th align="center">推荐人姓名</th>
                <th align="center">被推荐人姓名</th>
                <th align="center">借款标题</th>
            	<th align="center">投资总金额（元）</th>
                <th align="center">借款期限（月）</th>
                <th align="center">奖励金额（元）</th>
            	<th align="center">满标时间</th>
                <th align="center">奖励计算时间</th>
                 <th align="center">奖励发放时间</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th align="center">操作</th>
            </tr>
        </thead>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set>
        	<c:forEach items="${pageBean.page }" var="bean" varStatus="status">
              <tr data-id="65" align="center">
              	<td >${status.index+1+count }</td>
                <td>
                ${bean.recommendUsername}
				</td>  
				
				 <td>
					${bean.realName}
				</td>  
				
				<td>
					<a href="../WEB-PC/invest.html?id=${bean.borrowId }" target="_blank">${bean.borrowTitle}</a>
				</td>
				<td align="center">
					<fmt:formatNumber value="${bean.investAmount}" type="currency" pattern="#,##0.00"/>  
				</td>	
				<td>
					${bean.deadline} 
				</td> 
				<td>
				 <fmt:formatNumber value="${bean.money}" type="currency" pattern="#,##0.00"/>   
				</td>
				<td align="center">
					<fmt:formatDate value="${bean.auditTime}" pattern="yyyy-MM-dd HH:mm:ss" />
				</td> 				 			
				<td align="center">
					${bean.investTimeRange} 
				</td>
				
				<td>
					
					 <c:choose>
	                	<c:when test="${bean.awardTime != null}">
	                	<fmt:formatDate value="${bean.awardTime}" pattern="yyyy-MM-dd HH:mm:ss" />
	                	</c:when>
	                	<c:otherwise>
	                	
	                	</c:otherwise>
	                </c:choose>
				</td>
				<td>
				 <c:choose>
	                	<c:when test="${bean.status==1 and bean.money < 200 }">
	                		<input type="checkbox" id="ids" name="ids" data-toggle="icheck" value="${bean.id }">
	                	</c:when>
	                	<c:otherwise>
	                	
	                	</c:otherwise>
	                </c:choose>
	                
				</td>
				<td align="center"> 
					<c:choose>
						<c:when test="${bean.status==1 }">
						
                        	 <c:choose>
	                	<c:when test="${bean.money >= 200}">
	                		
							 <a href="addRecommendInvestRewardForDown.do?id=${bean.id }" class="btn btn-orange" data-toggle="doajax" 
                        data-confirm-msg="确定给-${bean.recommendUsername }-线下发放奖励吗？">线下发放</a>
	                	</c:when>
	                	<c:otherwise>
	                		
							 <a href="addRecommendInvestReward.do?ids=${bean.id }" class="btn btn-green" data-toggle="doajax" 
                        data-confirm-msg="确定给-${bean.recommendUsername }-发放奖励吗？">发放</a>
                        
	                	</c:otherwise>
	                </c:choose>
	                
	                
						</c:when>
						<c:otherwise>
							已发放
						</c:otherwise>
					</c:choose>
				</td>
            </tr>
            </c:forEach>
        <tbody>
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
