<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">
</script>

<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="forPaymentDueInInit.do?tabid=${tabid}" method="post">
        <input type="hidden" name="pageSize" value="${pageBean.pageSize}">
        <input type="hidden" name="pageCurrent" value="${pageBean.pageNum}">
        <div class="bjui-searchBar">
        <br/>
            &nbsp;&nbsp;
            <select name="debtStatus" id="debtStatus" data-toggle="selectpicker">
                <option value="-1" selected>待还款列表</option>
                <option value="1" ${debtStatus ==1?'selected':1}>应收款列表</option>
                <option value="2" ${debtStatus ==2?'selected':1}>待收款列表</option>
                <option value="3" ${debtStatus ==3?'selected':3}>已还款列表</option>
            </select>&nbsp;&nbsp;
            	<c:if test="${debtStatus ==1 || debtStatus ==-1}">
		            <label>投资人：</label><input type="text" value="${investor}" name="investor" class="form-control" >&nbsp;
		            <label>借款标题：</label><input type="text" value="${titles}" name="titles" class="form-control" >&nbsp;
			        <br/><br/>&nbsp;&nbsp;&nbsp;
					<label>应收时间：</label><input type="text" name="timeStart" id="timeStart" data-toggle="datepicker"  data-rule="date" size="20" value="${timeStart }" pattern="yyyy-MM-dd HH:mm:ss"> 
		            — <input type="text" name="timeEnd" id="timeEnd" data-toggle="datepicker"  data-rule="date" size="20" value="${timeEnd }" pattern="yyyy-MM-dd HH:mm:ss">
		            <label>借款类型：</label>
		            <select id="borrowWay" name="borrowWay" data-toggle="selectpicker">
		              	<option value="-1" ${borrowWay==-1 ? 'selected' : '' }>-请选择-</option>
						<option value="2" ${borrowWay==2 ? 'selected' : '' }>体验标</option>
						<option value="3" ${borrowWay==3 ? 'selected' : '' }>多金宝</option>
						<option value="4" ${borrowWay==4 ? 'selected' : '' }>普金宝</option>
						<option value="5" ${borrowWay==5 ? 'selected' : '' }>新手标</option>
						<option value="6" ${borrowWay==6 ? 'selected' : '' }>恒金宝</option>
					</select>
		            <label>用户组：</label>
		            <select id="group" name="group" data-toggle="selectpicker">
		              	<option value="-1" ${group==-1 ? 'selected' : '' }>-请选择-</option>
						<option value="1" ${group==1 ? 'selected' : '' }>借款人组</option>
						<option value="2" ${group==2 ? 'selected' : '' }>投资人组</option>
						<option value="12" ${group==12 ? 'selected' : '' }>测试组</option>
					</select>
				</c:if>
            <c:if test="${debtStatus ==2}">
	            <label>用户名：</label><input type="text" value="${investor}" name="investor" class="form-control" >&nbsp;
	            <label>到期时间：</label><input type="text" name="timeStart" id="timeStart" data-toggle="datepicker"  data-rule="date" size="20" value="${timeStart }" pattern="yyyy-MM-dd HH:mm:ss"> 
            	— <input type="text" name="timeEnd" id="timeEnd" data-toggle="datepicker"  data-rule="date" size="20" value="${timeEnd }" pattern="yyyy-MM-dd HH:mm:ss">
            	<label>借款期数：</label>
	            <select id="deadline" name="deadline" data-toggle="selectpicker">
	              	<option value="-1" ${deadline==-1 ? 'selected' : '' }>-请选择-</option>
					<option value="1" ${deadline==1 ? 'selected' : '' }>一个月</option>
					<option value="2" ${deadline==2 ? 'selected' : '' }>两个月</option>
					<option value="3" ${deadline==3 ? 'selected' : '' }>三个月</option>
					<option value="6" ${deadline==6 ? 'selected' : '' }>六个月</option>
					<option value="7" ${deadline==7 ? 'selected' : '' }>七个月</option>
					<option value="12" ${deadline==12 ? 'selected' : '' }>十二个月</option>
					<option value="18" ${deadline==18 ? 'selected' : '' }>十八个月</option>
					<option value="24" ${deadline==24 ? 'selected' : '' }>二十四月</option>
				</select>
				<label>用户组：</label>
	            <select id="group" name="group" data-toggle="selectpicker">
	              	<option value="-1" ${group==-1 ? 'selected' : '' }>-请选择-</option>
					<option value="1" ${group==1 ? 'selected' : '' }>借款人组</option>
					<option value="2" ${group==2 ? 'selected' : '' }>投资人组</option>
					<option value="12" ${group==12 ? 'selected' : '' }>测试组</option>
				</select>
		    </c:if>
            <c:if test="${debtStatus ==3}">
		            <label>用户名：</label><input type="text" value="${userName}" name="userName" class="form-control" >&nbsp;
		            <label>还款时间：</label><input type="text" name="timeStart" id="timeStart" data-toggle="datepicker"  data-rule="date" size="20" value="${timeStart }" pattern="yyyy-MM-dd HH:mm:ss"> 
            	— <input type="text" name="timeEnd" id="timeEnd" data-toggle="datepicker"  data-rule="date" size="20" value="${timeEnd }" pattern="yyyy-MM-dd HH:mm:ss">
            	<br/><br/>
	            	<label>到期时间：</label><input type="text" name="timeStart1" id="timeStart1" data-toggle="datepicker"  data-rule="date" size="20" value="${timeStart1 }" pattern="yyyy-MM-dd HH:mm:ss"> 
            	— <input type="text" name="timeEnd1" id="timeEnd1" data-toggle="datepicker"  data-rule="date" size="20" value="${timeEnd1 }" pattern="yyyy-MM-dd HH:mm:ss">
            	<label>借款期数：</label>
	            <select id="deadline" name="deadline" data-toggle="selectpicker">
	              	<option value="-1" ${deadline==-1 ? 'selected' : '' }>-请选择-</option>
					<option value="1" ${deadline==1 ? 'selected' : '' }>一个月</option>
					<option value="2" ${deadline==2 ? 'selected' : '' }>两个月</option>
					<option value="3" ${deadline==3 ? 'selected' : '' }>三个月</option>
					<option value="6" ${deadline==6 ? 'selected' : '' }>六个月</option>
					<option value="7" ${deadline==7 ? 'selected' : '' }>七个月</option>
					<option value="12" ${deadline==12 ? 'selected' : '' }>十二个月</option>
					<option value="18" ${deadline==18 ? 'selected' : '' }>十八个月</option>
					<option value="24" ${deadline==24 ? 'selected' : '' }>二十四月</option>
				</select>
	            <label>借款类型：</label>
	            <select id="borrowWay" name="borrowWay" data-toggle="selectpicker">
	              	<option value="-1" ${borrowWay==-1 ? 'selected' : '' }>-请选择-</option>
					<option value="2" ${borrowWay==2 ? 'selected' : '' }>体验标</option>
						<option value="3" ${borrowWay==3 ? 'selected' : '' }>多金宝</option>
						<option value="4" ${borrowWay==4 ? 'selected' : '' }>普金宝</option>
						<option value="5" ${borrowWay==5 ? 'selected' : '' }>新手标</option>
						<option value="6" ${borrowWay==6 ? 'selected' : '' }>恒金宝</option>
				</select>
		    </c:if>
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
             <div class="pull-right">
             	  <button type="button" class="btn-green" data-url="exportForPayment.do?pageCurrent=${pageBean.pageNum }&pageSize=${pageBean.pageSize }&debtStatus=${debtStatus }&userName=${userName }&investor=${investor }&titles=${titles }&borrowWay=${borrowWay }&group=${group }&deadline=${deadline }&timeStart=${timeStart }&timeEnd=${timeEnd }&timeStart1=${timeStart1 }&timeEnd1=${timeEnd1 }" 
            data-toggle="doexport"  data-confirm-msg="确定要导出信息吗？">导出</button>
             </div>
          
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-hover table-striped table-top" data-selected-multi="true">
        <thead>
            <tr align="center">
            	<th align="center">序号</th>
            	<c:choose>
	            	<c:when test="${debtStatus ==-1}">
	            		<th align="center">借款人</th>
		                <th align="center">姓名</th>
		                <th align="center">用户组</th>
		                <th align="center">借款时间</th>
		                <th align="center">标的类型</th>
		                <th align="center">借款标题</th>
		                <th align="center">是否天标</th>
		                <th align="center">期数/总期数</th>
		                <th align="center">应还时间</th>
		               	<th align="center">应还金额（元）</th>
		               	<th align="center">审核状态</th>
               			<th align="center">详情</th>
	            	</c:when>
	            	<c:when test="${debtStatus ==1}">
	            		<th align="center">投资人</th>
		                <th align="center">姓名</th>
		                <th align="center">用户组</th>
		                <th align="center">标的类型</th>
		                <th align="center">投资时间</th>
		                <th align="center">应收时间</th>
		                <th align="center">还款期数/总期数</th>
		               	<th align="center">应收金额（元）</th>
	            	</c:when>
	            	<c:when test="${debtStatus ==2}">
	            		<th align="center">投资人</th>
		                <th align="center">姓名</th>
		                <th align="center">用户组</th>
		                <th align="center">投资金额</th>
		                <th align="center">投资占比</th>
		                <th align="center">借款时间</th>
		                <th align="center">标的总金额</th>
		                <th align="center">标的类型</th>
		                <th align="center">是否天标</th>
		                <th align="center">期数/总期数</th>
		                <th align="center">应收时间</th>
		               	<th align="center">应收金额（元）</th>
	            	</c:when>
	            	<c:when test="${debtStatus ==3}">
	            		<th align="center">借款人</th>
		                <th align="center">姓名</th>
		                <th align="center">借款时间</th>
		                <th align="center">标的类型</th>
		                <th align="center">借款标题</th>
		                <th align="center">是否天标</th>
		                <th align="center">期数/总期数</th>
		                <th align="center">应还时间</th>
		               	<th align="center">还款时间</th>
		               	<th align="center">应还金额（元）</th>
               			<th align="center">详情</th>
	            	</c:when>
            	</c:choose>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${pageBean.page }" var="bean" varStatus="status">
              <tr data-id="65" align="center">
                <td >${status.index+1+count }</td>
               	<c:choose>
            		<c:when test="${debtStatus ==-1}">
            		<td align="center">
						${bean.username}
					</td>
					<td>
						${bean.realNames}
					</td>
					<td>
						<c:if test="${bean.groupName==null}">
							未分配
						</c:if>
						<c:if test="${bean.groupName!=null}">
							${bean.groupName}
						</c:if>
					</td>
					<td >
						${bean.publishTime}
					</td>
					<td>
						${bean.borrowWayName}
					</td>
					<td>
					   <a href="../WEB-PC/invest.html?id=${bean.borrowId}" target="_blank">${bean.borrowTitle}</a>
					</td>
					<td>
						<c:if test="${bean.isDayThe==1}">
							否
						</c:if>
						<c:if test="${bean.isDayThe==2}">
						    是
					    </c:if>	
					</td>
					<td>
					${bean.repayPeriod}
				    </td>
					<td>
						${bean.repayDate}
					</td>
					<td>
						<fmt:formatNumber value="${bean.forTotalSum}" type="currency" pattern="#,##0.00"/>
					</td>
						<td>
							
 					<c:choose>
	                	<c:when test="${bean.auditStatus != 4 }">
	                		<span style="color: green;">成功</span>
	                	</c:when>
	                	
	                	<c:otherwise>
	                	 <span style="color:red;">${bean.auditRemark }</span>
	                	</c:otherwise>
	                </c:choose>
						</td>
						
					<td>
						 <a href="queryByrepayIdDueId.do?id=${bean.id }&tabid=${tabid }" data-toggle="dialog" data-id="queryByrepayIdDueId" data-mask="true" data-width="700" data-height="400" class="btn btn-green">查看</a> 
					</td>
					</c:when>
					<c:when test="${debtStatus ==1}">
						<td align="center">
							${bean.investor}
						</td>
						<td align="center">
							<c:if test="${bean.realName==null}">
								未填写
							</c:if>
							<c:if test="${bean.realName!=null}">
									${bean.realName}
							</c:if>
						</td>
						<td align="center">
							<c:if test="${bean.groupName==null}">
								未分配
							</c:if>
							<c:if test="${bean.groupName!=null}">
								${bean.groupName}
							</c:if>
						</td>
						<td>
							${bean.borrowWayName}
						</td>
						<td>
							${bean.investTime }
						</td>
						<td>
							${bean.repayDate }
						</td>
						<td>
						   ${bean.repayPeriod}
						</td>
						<td>
							${bean.forTotalSum }
						</td>
					</c:when>
					<c:when test="${debtStatus ==2}">
						<td align="center">
							${bean.investor}
						</td>
						<td>
							<c:if test="${bean.realName==null }">
							未填写
							</c:if>
							<c:if test="${bean.realName!=null }">
								${bean.realName}
							</c:if>
						</td>
						<td align="center">
							<c:if test="${bean.groupName==null }">
								未分配
							</c:if>
							<c:if test="${bean.groupName!=null }">
								${bean.groupName}
							</c:if>
						</td>
						<td>
							${bean.investAmount}
						</td>
						<td>
							<fmt:formatNumber type="number" value="${bean.scale } " maxFractionDigits="2"/>
						</td>
						<td>
							${bean.publishTime}
						</td>
						<td>
							<fmt:formatNumber value="${bean.borrowAmount}" type="currency" pattern="#,##0.00"/>
						</td>
						<td>
							${bean.borrowWayName}
						</td>
						<td>
							<c:if test="${bean.isDayThe==1 }">
								否
							</c:if>
							<c:if test="${bean.isDayThe==2 }">
							    是
						    </c:if>	
						</td>
						<td>
						   ${bean.repayPeriod}
						</td>					
						<td>
							${bean.repayDate}
						</td>
						<td>
						   ${bean.forTotalSum}
						</td>
					</c:when>
					<c:when test="${debtStatus ==3}">
						<td align="center">
							${bean.username}
						</td>
						<td>
							${bean.realName}
						</td>
						<td >
							${bean.publishTime}
						</td>
						<td>
							${bean.borrowWayName}
						</td>
						<td>
						   <a href="../WEB-PC/invest.html?id=${bean.borrowId}" target="_blank">${bean.borrowTitle}</a>
						</td>
						<td>
							<c:if test="${bean.isDayThe==1}">
								否
							</c:if>
							<c:if test="${bean.isDayThe==2}">
							    是
						    </c:if>	
						</td>
						<td>
							${bean.repayPeriod}
					    </td>
						<td>
							${bean.repayDate}
						</td>
						<td>
							${bean.realRepayDate}
						</td>
						<td>
							${bean.hasPI}
						</td>
						
					
						
						<td>
							 <a href="queryByRepayId.do?id=${bean.id }&tabid=${tabid }" data-toggle="dialog" data-id="queryByRepayId" data-mask="true" data-width="800" data-height="400" class="btn btn-green">查看</a> 
						</td>
					</c:when>
           		</c:choose>
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
        <span>&nbsp;条，共 ${pageBean.totalNum } 条， 共 ${pageBean.totalPageNum } 页    
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前页的金额合计:	<fmt:formatNumber value="${repayAmount}" type="currency" pattern="#,##0.00"/> &nbsp;&nbsp;&nbsp;&nbsp;总金额合计:	￥
		<c:choose> 
			<c:when test="${repaymentMap.amount == '' || repaymentMap.amount == null}">
				0.00
			</c:when> 
			<c:otherwise>
				${repaymentMap.amount}
			</c:otherwise>
			</c:choose>
		</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageBean.totalNum }" data-page-size="${pageBean.pageSize }" data-page-current="1">
    </div>
</div>
