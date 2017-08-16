<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
	
    <form id="pagerForm" data-toggle="ajaxsearch" action="queryLoanInspectList.do" method="post">
    	<input type="hidden" name="tabid" value="${tabid}">
	        <input type="hidden" name="pageSize" value="${pageSize}">
	        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
    	<div class="bjui-searchBar">
	        
	        <br/>&nbsp;&nbsp;
	        
	       	<label>用户名：</label><input type="text" id="userName" value="${userName }" name="userName" class="form-control">&nbsp;
	       	
	       	<label>借款标题：</label><input type="text" id="borrowTitle" value="${borrowTitle }" name="borrowTitle" class="form-control">&nbsp;
	       	
	       	<label>维护经理：</label><input type="text" id="loanName" value="${loanName }" name="loanName" size="10" class="form-control">&nbsp;
	        
			<label>标的类型：</label>
		 	<select name="borrowTypeSubId" id="borrowTypeSubId" data-toggle="selectpicker">
            	<option value="">全部</option>
               	<option value="2" ${borrowTypeSubId == 2?'selected':''}>体验标</option>
               	<option value="3" ${borrowTypeSubId == 3?'selected':''}>多金宝</option>
               	<option value="4" ${borrowTypeSubId == 4?'selected':''}>普金保</option>
               	<option value="5" ${borrowTypeSubId == 5?'selected':''}>新手标</option>
               	<option value="6" ${borrowTypeSubId == 6?'selected':''}>恒金保</option>
           	</select>&nbsp;    
           	    
			<label>借款状态：</label>
		 	<select name="borrowStatus" id="borrowStatus" data-toggle="selectpicker">
            	<option value="">全部</option>
               	<option value="1" ${borrowStatus == 1?'selected':''}>初审中</option>
               	<option value="2" ${borrowStatus == 2?'selected':''}>招标中</option>
               	<option value="3" ${borrowStatus == 3?'selected':''}>满标</option>
               	<option value="4" ${borrowStatus == 4?'selected':''}>还款中</option>
           	</select>&nbsp;  
           	
           	<label>检查状态：</label>
		 	<select name="inspectStatus" id="inspectStatus" data-toggle="selectpicker">
            	<option value="-1">全部</option>
               	<option value="0" ${inspectStatus == 0?'selected':''}>通过</option>
               	<option value="1" ${inspectStatus == 1?'selected':''}>待风控部审核</option>
               	<option value="2" ${inspectStatus == 2?'selected':''}>待总监理审核</option>
               	<option value="3" ${inspectStatus == 3?'selected':''}>风控部审核不通过</option>
               	<option value="4" ${inspectStatus == 4?'selected':''}>总监理审核不通过</option>
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
                <th align="center">记录时间</th>
                <th align="center">审核状态</th>
                <th align="center">用户名</th>
                <th align="center">真实姓名</th>
                <th align="center">维护经理</th>
                <th align="center">标的类型</th>
                <th align="center">借款标题</th>
                <th align="center">发布时间</th>
                <th align="center">借款金额（￥元）</th>
                <th align="center">利率</th>
                <th align="center">期限</th>
                <th align="center">筹标期限</th>
                <th align="center">状态</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="${(pageBean.pageNum-1)*pageBean.pageSize}"></c:set> 
        	
        	  <c:choose>
				<c:when test="${pageBean.page == null or pageBean.page == '[]' }">
					<tr align="center">
            		<td align="center" colspan="15">暂无数据</td>
            	</tr>
				</c:when>
				<c:otherwise>
        	<c:forEach items="${pageBean.page }" var="item" varStatus="status">
				<tr data-id="65" align="center">
				 	<td>${status.index+1+count }</td>
				 	 <td>
						<fmt:formatDate value="${item.recordTime }" pattern="yyyy-MM-dd HH:mm:ss" /> 
	                </td>
	                <td>
	                <!-- 27 表示总经理、 28表示风控部 、29表示 检查员 -->
	                <!-- 0表示审核通过，1表示风控部待审核，2表示总经理待审核，3表示风控部审核失败，4表示总经理审核失败 -->
	                <c:if test="${item.status ==0 }">
	                	<span style="color:green;">通过</span>
	                
	                </c:if>
	                  
	                 <c:if test="${item.status ==1 }">
	                	<c:if test="${admin.roleId ==27 or admin.roleId ==29 or admin.id ==-1  }">
	                		<span style="color:orange;">待风控部审核</span>
	                	</c:if>
	                	<c:if test="${admin.roleId ==28 }">
	                		<span style="color:orange;">待审核</span>
	                	</c:if>
	                	
	                </c:if>
	                
	                 <c:if test="${item.status ==2 }">
	                	<c:if test="${admin.roleId ==27 }">
	                		<span style="color:orange;">待审核</span>
	                	</c:if>
	                	<c:if test="${admin.roleId ==28 or admin.id ==-1 or admin.roleId ==29 }">
	                		<span style="color:orange;">待总经理审核</span>
	                	</c:if>
	                	
	                </c:if>
	                
	                 <c:if test="${item.status ==3 }">
	                	<c:if test="${admin.roleId ==27  or admin.id ==-1 or admin.roleId ==29 }">
	                		<span style="color:red;">风控部审核不通过</span>
	                	</c:if>
	                	<c:if test="${admin.roleId ==28 }">
	                		<span style="color:red;">审核不通过</span>
	                	</c:if>
	                
	                </c:if>
	                
	                 <c:if test="${item.status ==4 }">
	                	<c:if test="${admin.roleId ==27 }">
	                		<span style="color:red;">审核不通过</span>
	                	</c:if>
	                	<c:if test="${admin.roleId ==28  or admin.id ==-1 or admin.roleId ==29 }">
	                		<span style="color:red;">总经理审核不通过</span>
	                	</c:if>
	                	
	                </c:if>
	               
	                </td>
	                <td>${item.username }</td>
	                <td>${item.realName }</td>
	                 <td>${item.loanName }</td>
	                <td>${item.borrowWayName }</td>
	                <td><a href="../WEB-PC/invest.html?id=${item.borrowId}" target="view_frame">${item.borrowTitle }</a></td>
	                <td><fmt:formatDate value="${item.publishTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                <td><fmt:formatNumber value="${item.borrowAmount }" type="currency" pattern="#,##0.00"/></td>
	                <td>${item.annualRate }%</td>
	                <td>
	                	${item.deadline }
	                	<c:if test="${item.isDayThe==1 }">个月</c:if>
	                	<c:if test="${item.isDayThe!=1 }">天</c:if>
	                </td>
	                <td>
	                	<c:if test="${item.borrowShow==2 }">${item.deadline }个月</c:if>
	                	<c:if test="${item.raiseTerm==0 }">无期限</c:if>
	                	<c:if test="${item.raiseTerm!=0 and item.borrowShow!=2 }">${item.raiseTerm }天</c:if>
	                </td>
	                <td>
                		<c:if test="${item.flag==0 }">等待资料认证</c:if>
                		<c:if test="${item.borrowStatus==1 }">初审中</c:if>
                		<c:if test="${item.borrowStatus==2 }">招标中</c:if>
                		<c:if test="${item.borrowStatus==3 }">满标</c:if>
                		<c:if test="${item.borrowStatus==4 }">还款中</c:if>
                		<c:if test="${item.borrowStatus==5 }">已还完</c:if>
                		<c:if test="${item.borrowStatus==6 }">流标</c:if>
                		<c:if test="${item.borrowStatus==7 }">未开放</c:if>
	                <td>
	                	
					          	<a href="saveOrUpdateRiskDeptMonthInspectInit.do?id=${item.id }&tabid=${tabid }" data-toggle="navtab" 
                   				data-id="inspectLoan2"data-title="${item.borrowTitle }-查看检查" 
                   				 class="btn btn-green">查看检查</a>
	                	
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
            	<option value="10">10</option>
            	<option value="20" selected="selected">20</option>
                <option value="30">30</option>
                <option value="60">60</option>
                <option value="120">120</option>
                <option value="150">150</option>
            </select>
        </div>
        <span>&nbsp;条，共 ${pageBean.totalNum } 条 共 ${pageBean.totalNum } 条页 </span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>