<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${basePath }admin/borrowTenderIn.do" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
        <br/>
            &nbsp;&nbsp;
            <label>用户名：</label><input type="text" value="${userName}" name="userName" class="form-control">&nbsp;
            <label>借款类型:</label>
            <select name="borrowWay" id="borrowWay" data-toggle="selectpicker">
            
                <option value="">请选择</option>
                <option value="2" ${borrowWay ==2?'selected':''}>体验标</option>
                <option value="3" ${borrowWay ==3?'selected':''}>多金宝</option>
                <option value="4" ${borrowWay ==4?'selected':''}>普金宝</option>
                <option value="5" ${borrowWay ==5?'selected':''}>新手标</option>
                <option value="6" ${borrowWay ==6?'selected':''}>恒金宝</option>
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
                <th align="center">用户名</th>
                <th align="center">真实姓名</th>
                <th align="center">通过认证数量</th>
                <th align="center">标的类型</th>
                <th align="center">借款标题</th>
                <th align="center">借款金额</th>
                <th align="center">利率</th>
                <th align="center">期限</th>
                <th align="center">筹标期限</th>
                <th align="center">状态</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${pageBean.page }" var="borrow" varStatus="status">
              <tr data-id="65" align="center">
                <td >${status.index+1+count }</td>
                <td >${borrow.username }</td>
                <td>${borrow.realName }</td>
                <td>
	                <c:choose>
						<c:when test="${borrow.publisherWay==2 }">
							${borrow.authCount }个
						</c:when>
						<c:when test="${borrow.counts==null }">
							0 个
						</c:when>
						<c:otherwise>
						 ${borrow.authCount }个
						</c:otherwise>
					</c:choose>
                </td>
                <td>${borrow.borrowWayName }</td>
                <td>${borrow.borrowTitle }</td>
                <td>${borrow.borrowAmount }</td>
                <td>${borrow.annualRate }%</td>
                <td>
	                ${borrow.deadline }
	                <c:choose>
						<c:when test="${borrow.isDayThe ==1 }">
							个月
						</c:when>
						<c:otherwise>
						 天
						</c:otherwise>
					</c:choose>
                </td>
                <td> 
	                <c:choose>
						<c:when test="${borrow.borrowShow==2 }">
							${borrow.deadline }个月
						</c:when>
						<c:when test="${borrow.raiseTerm ==0 }">
							无期限
						</c:when>
						
						<c:otherwise>
						${borrow.raiseTerm }天
						</c:otherwise>
					</c:choose>
                </td>
                <td>
	                <c:choose>
	               		<c:when test="${borrow.borrowStatus ==0 }">
							 等待资料认证
						</c:when>
						<c:when test="${borrow.borrowStatus==1 }">
							初审中
						</c:when>
						<c:when test="${borrow.borrowStatus==2 }">
							招标中
						</c:when>
						<c:when test="${borrow.borrowStatus==3 }">
							满标
						</c:when>
						<c:when test="${borrow.borrowStatus==4 }">
							还款中
						</c:when>
						<c:when test="${borrow.borrowStatus==5 }">
							已还完
						</c:when>
						<c:when test="${borrow.borrowStatus==6 }">
							流标
						</c:when>
						<c:otherwise>
							未开放
						</c:otherwise>
					</c:choose>
                </td>
                <td>         
                	<a href="updateBorrowTenderInit.do?borrowId=${borrow.id }&tabid=${tabid}" data-toggle="dialog" data-id="updateBorrowTenderInit" data-mask="true" data-width="800" data-height="700" class="btn btn-green">编辑</a>
                
                   	<a href="borrowTenderInDetail.do?borrowId=${borrow.id}&tabid=${tabid}" data-toggle="dialog" data-id="borrowTenderInDetail" data-mask="true" data-width="700" data-height="700" class="btn btn-green">查看</a>
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
        <span>&nbsp;条，共 ${pageBean.totalNum } 条， 共 ${pageBean.totalPageNum } 页    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前页的招标借款金额合计:	￥${tenderAmount} &nbsp;&nbsp;&nbsp;&nbsp; 招标借款金额合计:￥
        	        <c:choose>
	               		<c:when test="${repaymentMap.tenderBorrowAmount ==''}">
							 0
						</c:when>
						<c:otherwise>
							${repaymentMap.tenderBorrowAmount}
						</c:otherwise>
					</c:choose></span>
					
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>
