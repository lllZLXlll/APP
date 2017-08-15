<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%>
<div class="bjui-pageContent">
    <form action="updateBorrowTender.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
   		<input type="hidden" name="id" value="${borrowMTenderInDetail.id }">
        <input type="hidden" name="tabid" value="${tabid }">
        <table class="table table-condensed table-hover">
            <tbody>
	            <tr height="35px">
					<td colspan="2"> <label for="j_custom_sale" class="control-label">标的详情</label></td> 
				</tr>
                <tr height="30px">
                    <td>
                        <label for="j_custom_sale" class="control-label">用户名：</label>${borrowMTenderInDetail.username}
                    </td>
                    <td>
                        <label for="j_custom_sale" class="control-label">真实姓名：</label>${borrowMTenderInDetail.realName}
                    </td>
                </tr>
                <tr height="30px">
                    <td>
                        <label for="j_custom_name" class="control-label">标的标题：</label>${borrowMTenderInDetail.borrowTitle}
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label">借款金额：</label>${borrowMTenderInDetail.borrowAmount}&nbsp;元
                    </td>
                </tr>
                <tr height="30px">
                    <td>
                        <label for="j_custom_name" class="control-label">年利率：</label>${borrowMTenderInDetail.annualRate}%
                    </td>
                    <td>
                        <label for="j_custom_birthday" class="control-label">借款期限：</label>${borrowMTenderInDetail.deadline}
				                <c:choose>
				               		<c:when test="${borrowMTenderInDetail.isDayThe ==1}">
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
                        <label for="j_custom_name" class="control-label">借款用途：</label>${borrowMTenderInDetail.purpose}
                    </td>
                    <td>
                        <label for="j_custom_birthday" class="control-label">
								还款方式：</label>
								<c:choose>
				               		<c:when test="${borrowMTenderInDetail.paymentMode==1}">
				               		    按月分期还款
									</c:when>
				               		<c:when test="${borrowMTenderInDetail.paymentMode==2}">
				               		    按月付息,到期还本
									</c:when>
				               		<c:when test="${borrowMTenderInDetail.paymentMode==3}">
				               		   秒还
									</c:when>
				               		<c:when test="${borrowMTenderInDetail.paymentMode==4}">
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
			               		<c:when test="${borrowMTenderInDetail.borrowWay==1}">
			               		    净值借款
								</c:when>
			               		<c:when test="${borrowMTenderInDetail.borrowWay==2}">
			               		    秒还借款
								</c:when>
			               		<c:when test="${borrowMTenderInDetail.borrowWay==3}">
			               		   信用借款
								</c:when>
			               		<c:when test="${borrowMTenderInDetail.borrowWay==4}">
			               		  实地考察借款
								</c:when>
			               		<c:when test="${borrowMTenderInDetail.borrowWay==5}">
			               		   机构担保借款
								</c:when>
			               		<c:when test="${borrowMTenderInDetail.borrowWay==6}">
			               		   流转标借款
								</c:when>
							</c:choose>
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label">投标密码：</label>
							<c:choose>
			               		<c:when test="${borrowMTenderInDetail.hasPWD ==1}">
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
		                    <td><label for="j_custom_name" class="control-label">最小认购金额：</label>${borrowMTenderInDetail.smallestFlowUnit}元
		                    </td>
		                    <td><label for="j_custom_name" class="control-label">认购总份数：</label>${borrowMTenderInDetail.circulationNumber}份
		                    </td>
		                </tr>    	                
					</c:when>
               		<c:when test="${borrowMTenderInDetail.borrowShow==2}">
		                <tr height="30px">
		                    <td><label for="j_custom_name" class="control-label">最小认购金额：</label>${borrowMTenderInDetail.smallestFlowUnit}元
		                    </td>
		                    <td><label for="j_custom_name" class="control-label">认购总份数：</label>${borrowMTenderInDetail.circulationNumber}份
		                    </td>
		                </tr>  
					</c:when>
					<c:otherwise>
		                <tr height="30px">
		                    <td><label for="j_custom_name" class="control-label">最低投标金额：</label>${borrowMTenderInDetail.minTenderedSum}元
		                    </td>
		                    <td><label for="j_custom_name" class="control-label">最高投标金额：</label>
								<c:choose>
				               		<c:when test="${borrowMTenderInDetail.maxTenderedSum==-1}">
				               			 没有限制
									</c:when>
									<c:otherwise>
										${borrowMTenderInDetail.maxTenderedSum}元                
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
		               		<c:when test="${borrowMTenderInDetail.excitationType ==2}">
		               			按 固定金额,${borrowMTenderInDetail.excitationSum}元
							</c:when>
		               		<c:when test="${borrowMTenderInDetail.excitationType ==3}">
		               			按借款金额比例,${borrowMTenderInDetail.excitationSum}%
							</c:when>
							<c:otherwise>
								无            
							</c:otherwise>
						</c:choose>
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label">添加时间：</label>${borrowMTenderInDetail.publishTime}/IP: ${borrowMTenderInDetail.publishIP}
                    </td>
                </tr>
				<c:choose>
               		<c:when test="${borrowMTenderInDetail.borrowShow==1}">
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">项目描述：</label>
                        		<textarea name="detail" data-toggle="kindeditor" data-rule="required" data-items="forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, link">${borrowMTenderInDetail.detail}</textarea>
		                    </td>
		                </tr>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">项目介绍：</label>
		                    	<textarea name="projectIntro" data-toggle="kindeditor" data-rule="required" data-items="forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, link">${borrowMTenderInDetail.projectIntro}</textarea>
		                    </td>
		                </tr>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">还款来源：</label>
		                    	<textarea name="retsource" data-toggle="kindeditor" data-rule="required" data-items="forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, link">${borrowMTenderInDetail.projectIntro}</textarea>
		                    </td>
		                </tr>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">保障措施：</label>
		                    	<textarea name="safeMeasures" data-toggle="kindeditor" data-rule="required" data-items="forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, link">${borrowMTenderInDetail.safeMeasures}</textarea>
		                    </td>
		                </tr>
					</c:when>
					<c:otherwise>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">借款方商业概述：</label>
                        		<textarea name="businessDetail" data-toggle="kindeditor" data-rule="required" data-items="forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, link">${borrowMTenderInDetail.businessDetail}</textarea>
		                    </td>
		                </tr>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">借款方资产情况：</label>
                        		<textarea name="assets" data-toggle="kindeditor" data-rule="required" data-items="forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, link">${borrowMTenderInDetail.assets}</textarea>
		                    </td>
		                </tr>
		                <tr height="30px">
		                    <td colspan="2" >
		                    	<label for="j_custom_name" class="control-label">借款方资金用途：</label>
                        		<textarea name="moneyPurposes" data-toggle="kindeditor" data-rule="required" data-items="forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, link">${borrowMTenderInDetail.moneyPurposes}</textarea>
		                    </td>
		                </tr>
					</c:otherwise>
				</c:choose>
									
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">修改</button></li>
    </ul>
</div>