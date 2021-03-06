<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<div class="bjui-pageContent">
    <form action="#" id="j_borrowFullScale" data-toggle="validate" data-alertmsg="false">
        <table class="table table-condensed table-hover">
            <tbody>
	            <tr height="35px">
					<td colspan="2"> <label for="j_custom_sale" class="control-label">标的详情</label></td> 
				</tr>
                <tr height="30px">
                    <td>
                        <label for="j_custom_sale" class="control-label">用户名：</label>${borrowMFlowMarkDetail.username}
                    </td>
                    <td>
                        <label for="j_custom_sale" class="control-label">真实姓名：</label>${borrowMFlowMarkDetail.realName}
                    </td>
                </tr>
                <tr height="30px">
                    <td>
                        <label for="j_custom_name" class="control-label">标的标题：</label>${borrowMFlowMarkDetail.borrowTitle}
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label">借款金额：</label>${borrowMFlowMarkDetail.borrowAmount}&nbsp;元
                    </td>
                </tr>
                <tr height="30px">
                    <td>
                        <label for="j_custom_name" class="control-label">年利率：</label>${borrowMFlowMarkDetail.annualRate}%
                    </td>
                    <td>
                        <label for="j_custom_birthday" class="control-label">借款期限：</label>${borrowMFlowMarkDetail.deadline}
				                <c:choose>
				               		<c:when test="${borrowMFlowMarkDetail.isDayThe ==1}">
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
                        <label for="j_custom_name" class="control-label">借款用途：</label>${borrowMFlowMarkDetail.purpose}
                    </td>
                    <td>
                        <label for="j_custom_birthday" class="control-label">
								还款方式：</label>
								<c:choose>
				               		<c:when test="${borrowMFlowMarkDetail.paymentMode==1}">
				               		    按月分期还款
									</c:when>
				               		<c:when test="${borrowMFlowMarkDetail.paymentMode==2}">
				               		    按月付息,到期还本
									</c:when>
				               		<c:when test="${borrowMFlowMarkDetail.paymentMode==3}">
				               		   秒还
									</c:when>
				               		<c:when test="${borrowMFlowMarkDetail.paymentMode==4}">
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
			               		<c:when test="${borrowMFlowMarkDetail.borrowWay==1}">
			               		    净值借款
								</c:when>
			               		<c:when test="${borrowMFlowMarkDetail.borrowWay==2}">
			               		    秒还借款
								</c:when>
			               		<c:when test="${borrowMFlowMarkDetail.borrowWay==3}">
			               		   信用借款
								</c:when>
			               		<c:when test="${borrowMFlowMarkDetail.borrowWay==4}">
			               		  实地考察借款
								</c:when>
			               		<c:when test="${borrowMFlowMarkDetail.borrowWay==5}">
			               		   机构担保借款
								</c:when>
			               		<c:when test="${borrowMFlowMarkDetail.borrowWay==6}">
			               		   流转标借款
								</c:when>
							</c:choose>
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label">投标密码：</label>
							<c:choose>
			               		<c:when test="${borrowMFlowMarkDetail.hasPWD ==1}">
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
		                    <td><label for="j_custom_name" class="control-label">最小认购金额：</label>${borrowMFlowMarkDetail.smallestFlowUnit}元
		                    </td>
		                    <td><label for="j_custom_name" class="control-label">认购总份数：</label>${borrowMFlowMarkDetail.circulationNumber}份
		                    </td>
		                </tr>    	                
					</c:when>
               		<c:when test="${borrowMFlowMarkDetail.borrowShow==2}">
		                <tr height="30px">
		                    <td><label for="j_custom_name" class="control-label">最小认购金额：</label>${borrowMFlowMarkDetail.smallestFlowUnit}元
		                    </td>
		                    <td><label for="j_custom_name" class="control-label">认购总份数：</label>${borrowMFlowMarkDetail.circulationNumber}份
		                    </td>
		                </tr>  
					</c:when>
					<c:otherwise>
		                <tr height="30px">
		                    <td><label for="j_custom_name" class="control-label">最低投标金额：</label>${borrowMFlowMarkDetail.minTenderedSum}元
		                    </td>
		                    <td><label for="j_custom_name" class="control-label">最高投标金额：</label>
								<c:choose>
				               		<c:when test="${borrowMFlowMarkDetail.maxTenderedSum==-1}">
				               			 没有限制
									</c:when>
									<c:otherwise>
										${borrowMFlowMarkDetail.maxTenderedSum}元                
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
		               		<c:when test="${borrowMFlowMarkDetail.excitationType ==2}">
		               			按 固定金额,${borrowMFlowMarkDetail.excitationSum}元
							</c:when>
		               		<c:when test="${borrowMFlowMarkDetail.excitationType ==3}">
		               			按借款金额比例,${borrowMFlowMarkDetail.excitationSum}%
							</c:when>
							<c:otherwise>
								无            
							</c:otherwise>
						</c:choose>
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label">添加时间：</label>${borrowMFlowMarkDetail.publishTime}/IP: ${borrowMFlowMarkDetail.publishIP}
                    </td>
                </tr>
				<c:choose>
               		<c:when test="${borrowMFlowMarkDetail.borrowShow==1}">
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">借款详情：</label>${borrowMFlowMarkDetail.detail}
		                    </td>
		                </tr>
					</c:when>
					<c:otherwise>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">借款方商业概述：</label>${borrowMFlowMarkDetail.businessDetail}
		                    </td>
		                </tr>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">借款方资产情况：</label>${borrowMFlowMarkDetail.assets}
		                    </td>
		                </tr>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">借款方资金用途：</label>${borrowMFlowMarkDetail.moneyPurposes}
		                    </td>
		                </tr>
					</c:otherwise>
				</c:choose>
                <tr height="30px">
                    <td colspan="2" >
                    	<label for="j_custom_name" class="control-label"><br/>风控意见：</label><br/><br/>
                    	<textarea name="auditOpinion" data-toggle="autoheight" disabled="disabled" data-rule="required" cols="55" rows="5">${borrowMFlowMarkDetail.auditOpinion}</textarea>
                    </td>
                </tr>
									
            </tbody>
        </table>
    </form>
</div>