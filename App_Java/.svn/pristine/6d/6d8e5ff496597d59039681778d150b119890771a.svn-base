<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<script type="text/javascript">
$('#reBack').click(function() { 
	
	var radio = document.getElementsByName("status");   
	var auditOpinion = document.getElementById("auditOpinion");  
    if (!radio[0].checked && !radio[1].checked) {
    	alertmsg('warn', '请选择复审状态', {displayMode:'slide', okName:'确定', title:'温馨提示'});
    	return;
    }
    for (i=0; i<radio.length; i++) {  
        if (radio[i].checked) {  
        	if(auditOpinion.value != '')  {
                if(radio[i].value == 6)  {
                	$(this).alertmsg('confirm', '确定撤销吗！', {displayMode:'slide', okName:'确定', 
                		cancelName:'取消', title:'确认框',
                		okCall:confirmOK});
                } else if(radio[i].value == 4)  {
                	$('#j_borrowFullScale').submit();
                }
        	} else {
        		$(this).alertmsg('info', '风控意见不能为空', {displayMode:'slide', okName:'确定', title:'温馨提示'});
        	}
        }
    }  
    
})
function confirmOK(){
	$('#j_borrowFullScale').attr("action", "reBackBorrowTenderIn.do?id=${borrowMFullScaleDetail.id}").submit();
}

</script>
<div class="bjui-pageContent">
    <form action="updateBorrowFullScale.do" id="j_borrowFullScale" data-toggle="validate" data-alertmsg="false">
    	<input type="hidden" name="id" value="${borrowMFullScaleDetail.id}">
    	<input type="hidden" name="tabid" value="${tabid}">
    	
        <table class="table table-condensed table-hover">
            <tbody>
	            <tr height="35px">
					<td colspan="2"> <label for="j_custom_sale" class="control-label">借款审核满标复审</label></td> 
				</tr>
                <tr height="30px">
                    <td>
                        <label for="j_custom_sale" class="control-label">用户名：</label>${borrowMFullScaleDetail.username}
                    </td>
                    <td>
                        <label for="j_custom_sale" class="control-label">真实姓名：</label>${borrowMFullScaleDetail.realName}
                    </td>
                </tr>
                <tr height="30px">
                    <td>
                        <label for="j_custom_name" class="control-label">标的标题：</label>${borrowMFullScaleDetail.borrowTitle}
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label">借款金额：</label>${borrowMFullScaleDetail.borrowAmount}&nbsp;元
                    </td>
                </tr>
                <tr height="30px">
                    <td>
                        <label for="j_custom_name" class="control-label">年利率：</label>${borrowMFullScaleDetail.annualRate}%
                    </td>
                    <td>
                        <label for="j_custom_birthday" class="control-label">借款期限：</label>${borrowMFullScaleDetail.deadline}
				                <c:choose>
				               		<c:when test="${borrowMFullScaleDetail.isDayThe ==1}">
				               		   个月
									</c:when>
									<c:otherwise>
				               		   天
									</c:otherwise>
								</c:choose>
                    </td>
                </tr>
                <tr height="30px">
                    <td>
                        <label for="j_custom_name" class="control-label">借款用途：</label>${borrowMFullScaleDetail.purpose}
                    </td>
                    <td>
                        <label for="j_custom_birthday" class="control-label">
								还款方式：</label>
								<c:choose>
				               		<c:when test="${borrowMFullScaleDetail.paymentMode==1}">
				               		    按月分期还款
									</c:when>
				               		<c:when test="${borrowMFullScaleDetail.paymentMode==2}">
				               		    按月付息,到期还本
									</c:when>
				               		<c:when test="${borrowMFullScaleDetail.paymentMode==3}">
				               		   秒还
									</c:when>
				               		<c:when test="${borrowMFullScaleDetail.paymentMode==4}">
				               		   一次性还款
									</c:when>
								</c:choose>
						
                    </td>
                </tr>
                <tr height="30px">
                    <td>
                        <label for="j_custom_birthday" class="control-label">
                       		 标的类型：</label>
							<c:choose>
			               		<c:when test="${borrowMFullScaleDetail.borrowWay==1}">
			               		    净值借款
								</c:when>
			               		<c:when test="${borrowMFullScaleDetail.borrowWay==2}">
			               		    秒还借款
								</c:when>
			               		<c:when test="${borrowMFullScaleDetail.borrowWay==3}">
			               		   信用借款
								</c:when>
			               		<c:when test="${borrowMFullScaleDetail.borrowWay==4}">
			               		  实地考察借款
								</c:when>
			               		<c:when test="${borrowMFullScaleDetail.borrowWay==5}">
			               		   机构担保借款
								</c:when>
			               		<c:when test="${borrowMFullScaleDetail.borrowWay==6}">
			               		   流转标借款
								</c:when>
							</c:choose>
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label">投标密码：</label>
							<c:choose>
			               		<c:when test="${borrowMFullScaleDetail.hasPWD ==1}">
			               		    有
								</c:when>
								<c:otherwise>
			               		   无
								</c:otherwise>
							</c:choose>
                    </td>
                </tr>
				<c:choose>
               		<c:when test="${subscribes==1}">
		                <tr height="30px">
		                    <td><label for="j_custom_name" class="control-label">最小认购金额：</label>${borrowMFullScaleDetail.smallestFlowUnit}元
		                    </td>
		                    <td><label for="j_custom_name" class="control-label">认购总份数：</label>${borrowMFullScaleDetail.circulationNumber}份
		                    </td>
		                </tr>    	                
					</c:when>
               		<c:when test="${borrowMFullScaleDetail.borrowShow==2}">
		                <tr height="30px">
		                    <td><label for="j_custom_name" class="control-label">最小认购金额：</label>${borrowMFullScaleDetail.smallestFlowUnit}元
		                    </td>
		                    <td><label for="j_custom_name" class="control-label">认购总份数：</label>${borrowMFullScaleDetail.circulationNumber}份
		                    </td>
		                </tr>  
					</c:when>
					<c:otherwise>
		                <tr height="30px">
		                    <td><label for="j_custom_name" class="control-label">最低投标金额：</label>${borrowMFullScaleDetail.minTenderedSum}元
		                    </td>
		                    <td><label for="j_custom_name" class="control-label">最高投标金额：</label>
								<c:choose>
				               		<c:when test="${borrowMFullScaleDetail.maxTenderedSum==-1}">
				               			 没有限制
									</c:when>
									<c:otherwise>
										${borrowMFullScaleDetail.maxTenderedSum}元                
									</c:otherwise>
								</c:choose>
		                    </td>
		                </tr>  
					</c:otherwise>
				</c:choose>
                <tr height="30px">
                    <td>
                    	<label for="j_custom_name" class="control-label">投标奖励:</label>
                       	<c:choose>
		               		<c:when test="${borrowMFullScaleDetail.excitationType ==2}">
		               			按 固定金额,${borrowMFullScaleDetail.excitationSum}元
							</c:when>
		               		<c:when test="${borrowMFullScaleDetail.excitationType ==3}">
		               			按借款金额比例,${borrowMFullScaleDetail.excitationSum}%
							</c:when>
							<c:otherwise>
								无            
							</c:otherwise>
						</c:choose>
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label">添加时间：</label>${borrowMFullScaleDetail.publishTime}/IP: ${borrowMFullScaleDetail.publishIP}
                    </td>
                </tr>
				<c:choose>
               		<c:when test="${borrowMFullScaleDetail.borrowShow==1}">
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">借款详情：</label>${borrowMFullScaleDetail.detail}
		                    </td>
		                </tr>
					</c:when>
					<c:otherwise>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">借款方商业概述：</label>${borrowMFullScaleDetail.businessDetail}
		                    </td>
		                </tr>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">借款方资产情况：</label>${borrowMFullScaleDetail.assets}
		                    </td>
		                </tr>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">借款方资金用途：</label>${borrowMFullScaleDetail.moneyPurposes}
		                    </td>
		                </tr>
					</c:otherwise>
				</c:choose>		
                <tr height="30px">
                    <td colspan="2" >
                    	<label for="j_custom_name" class="control-label"><br/>站内信通知：</label><br/><br/>
                    	<textarea name="mes_content" data-toggle="autoheight" cols="55" rows="5" readonly="readonly">${borrowMFullScaleDetail.mailContent}</textarea>
                    </td>
                </tr>
                <tr height="30px">
                    <td colspan="2" >
                   		<label for="j_custom_name" class="control-label">审核状态：</label>
                   		<input type="radio" name="status1" id="j_auth1" data-toggle="icheck" value="2" disabled="disabled" checked="checked" data-rule="checked" data-label="审核通过&nbsp;&nbsp;">
                       	<input type="radio" name="status1" id="j_auth2" data-toggle="icheck" value="1" disabled="disabled" data-label="审核不通过">
                    </td>
                </tr>
                <tr height="30px">
                    <td>
                    	<label for="j_custom_name" class="control-label">复审状态：</label>                    	
                   		<input type="radio" name="status" id="j_oauth1" data-toggle="icheck" value="4" data-rule="checked" data-label="复审通过&nbsp;&nbsp;">
                       	<input type="radio" name="status" id="j_oauth2" data-toggle="icheck" value="6" data-rule="checked" data-label="复审不通过">
                    </td>
                </tr>
                <tr height="30px">
                    <td colspan="2" >
                    	<label for="j_custom_name" class="control-label"><br/>风控意见：</label><br/><br/>
                    	<textarea name="auditOpinion" id="auditOpinion" data-toggle="autoheight" data-rule="required" cols="55" rows="5">${borrowMFullScaleDetail.auditOpinion}</textarea>
                    </td>
                </tr>
									
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="button" onclick="reBack()" id="reBack" class="btn-green" data-icon="ok">确定</button></li>
        <!-- <li><button type="submit" class="btn-default">确定</button></li> -->
    </ul>
</div>