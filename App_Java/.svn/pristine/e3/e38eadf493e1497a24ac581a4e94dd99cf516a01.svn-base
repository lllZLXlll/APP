<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<style>
	.p {
		font-size: 18px;
	}
</style>
<script type="text/javascript">
$('#reBack').click(function() { 
	
	var radio = document.getElementsByName("status");   
    for (i=0; i<radio.length; i++) {  
        if (radio[i].checked) {  
               if(radio[i].value == 0)  {
               	$(this).alertmsg('confirm', '确定撤销吗！', {displayMode:'slide', okName:'确定', 
               		cancelName:'取消', title:'确认框',
               		okCall:confirmOK});
               		$("#auditStatus").val(radio[i].value);
               } else if(radio[i].value == 1)  {
            	   $("#auditStatus").val(radio[i].value);
               	$('#editForm').submit();
               }
        }
    }  
})
function confirmOK(){
	$('#editForm').submit();
}
</script>
<div class="bjui-pageContent">
	<form id="editForm" action="auditDebt.do?id=${paramMap.id }&tabid=${tabid}" method="post" data-toggle="validate" data-alertmsg="false">
	<input type="hidden" name="tabid" value="${tabid}">
        <table width="100%" border="0" cellspacing="1" cellpadding="3">
							<tr>
								<td  align="left" style="padding-left: 50px;" class="blue12"
									 colspan="2">
									<strong>借款详情</strong>
								</td>
								
							</tr>
							<tr>
								<td align="right"
									class="blue12">
									借款人：
								</td>
								<td align="left" class="f66" >
									${borrowerName }
								</td>
								
							</tr>
							<tr>
								<td align="right"
									class="blue12">
									有无逾期：
								</td>
								<td align="left" class="f66" >
									<c:choose>
										<c:when test="${paramMap.isLate==1}">无</c:when>
										<c:otherwise>有</c:otherwise>
									</c:choose>
								</td>
								
							</tr>
							<tr>
								<td  align="right"
									class="blue12">
									借款标题：
								</td>
								<td align="left" class="f66" >
									${paramMap.borrowTitle }
								</td>
								
							</tr>
							
							<tr>
								<td  align="left" style="padding-left: 50px;" class="blue12"
									 colspan="2">
									<strong>转让详情</strong>
								</td>
							</tr>
							<tr>
								<td align="right"
									class="blue12">
									转让者：
								</td>
								<td align="left" class="f66" >
									${alienatorName }
								</td>
								
							</tr>
							<tr>
								<td align="right"
									class="blue12">
									债权金额：
								</td>
								<td align="left" class="f66" >
									${paramMap.debtSum }元
								</td>
							</tr>
							<tr>
								<td align="right"
									class="blue12">
								转让价格<%--竞拍低价--%>：
								</td>
								<td align="left" class="f66" >
									${paramMap.auctionBasePrice }元
								</td>
								
							</tr>
							<tr>
								<td  align="right"
									class="blue12">
									剩余期限：
								</td>
								<td align="left" class="f66" >
									${paramMap.debtLimit}个月
								</td>
								
							</tr>
							<tr>
								<td align="right"
									class="blue12">
									竞拍期限：
								</td>
								<td align="left" class="f66" >
									${paramMap.auctionDays }天
								</td>
								
							</tr>
							<tr>
								<td  align="left" style="padding-left: 50px;" class="blue12"
									 colspan="2">
									<strong>债权还款时间表</strong>
								</td>
								
							</tr>
							<tr>
								<td class="blue12" align="center"
									colspan="2">
								<table width="60%">
									<tr>
										<th align="center">
											序号
										</th>
										<th align="center">还款日期</th>
										<th align="center">已还本息</th>
										<th align="center">待还本息</th>
										<th align="center">已付罚息</th>
										<th align="center">待付罚息</th>
										<th align="center">状态</th>
									</tr>
									<c:forEach items="${list }" var="list" varStatus="st">
										<tr>
											<td align="center">
												${st.index+1+count }
											</td>
											<td align="center">
												${list.repayDate}
											</td>
											<td align="center">
												${list.hasPI}
											</td>
											<td align="center">
												${list.stillPI}
											</td>
											<td align="center">
												${list.investorHaspayFI}
											</td>
											<td align="center">
												${list.investorForpayFI}
											</td>
											<td align="center">
												未偿还
											</td>
										</tr>
									</c:forEach>
									</table>
								</td>
								
							</tr>
							
							<tr>
								<td align="right"
									class="blue12">
									审核状态：
								</td>
								<td align="left" class="f66" colspan="3">
									<input type="radio" name="status" id="j_oauth1" data-toggle="icheck" value="1" data-rule="checked" data-label="复审通过&nbsp;&nbsp;" checked ="checked">
                      			 	<input type="radio" name="status" id="j_oauth2" data-toggle="icheck" value="0" data-rule="checked" data-label="复审不通过">
                      			 	<input type="hidden" name="auditStatus" id="auditStatus">
								</td>
							</tr>
							<tr>
								<td align="right"
									class="blue12">
									转让描述：
								</td>
								<td align="left" class="f66" colspan="3">
									<textarea name="auditOpinion" id="auditOpinion" data-toggle="autoheight" data-rule="required" cols="55" rows="5">${paramMap.details}</textarea>
								</td>
							</tr>
							<tr>
								<td height="25">
								</td>
								<td align="left" class="f66" style="color: Red;" colspan="3">
									${paramMap.allError }
								</td>
							</tr>
							<tr>
								<td height="36" align="right" class="blue12">
									&nbsp;
								</td>
								<td colspan="3">
									&nbsp;
								</td>
							</tr>
						</table>
					</form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" onclick="reBack()" id="reBack" class="btn-green" data-icon="ok">确定</button></li>
    </ul>
</div>