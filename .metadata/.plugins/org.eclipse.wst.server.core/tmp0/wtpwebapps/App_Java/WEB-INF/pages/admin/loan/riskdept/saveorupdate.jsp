<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<script type="text/javascript">
	$(function() {
		var roleId=${admin.roleId};
		var status=${inspectStatus};
		if (roleId==29){
			if(status==1 || status==2 || status==0){
				 removeDataRule();
			}
			$("#riskDeptAdvise").attr("readonly","readonly");
	        $("#riskDeptAdvise").removeAttr("data-rule");
			$("#mgrAdvise").attr("readonly","readonly");
	        $("#mgrAdvise").removeAttr("data-rule");
	        $("#riskDeptAdviseEnable").removeAttr("data-rule");
	        $("#mgrAdviseEnable").removeAttr("data-rule");
		}else if(roleId==28){
			if(status==3 || status==2 || status==4 || status==0){
				$("#riskDeptAdvise").attr("readonly","readonly");
	        	$("#riskDeptAdvise").removeAttr("data-rule");
	        	$("#riskDeptAdviseEnable").removeAttr("data-rule");
			}
	        removeDataRule();
	        $("#mgrAdvise").attr("readonly","readonly");
	        $("#mgrAdvise").removeAttr("data-rule");
			$("#mgrAdviseEnable").removeAttr("data-rule");
		}else if(roleId==27){
			if(status==4 || status==1 || status==3 || status==0){
				$("#mgrAdvise").attr("readonly","readonly");
	        	$("#mgrAdvise").removeAttr("data-rule");
				$("#mgrAdviseEnable").removeAttr("data-rule");
				$("#riskDeptAdvise").attr("readonly","readonly");
	        	$("#riskDeptAdvise").removeAttr("data-rule");
	        	$("#riskDeptAdviseEnable").removeAttr("data-rule");
			}
			removeDataRule();
			$("#riskDeptAdvise").attr("readonly","readonly");
	        $("#riskDeptAdvise").removeAttr("data-rule");
	        $("#riskDeptAdviseEnable").removeAttr("data-rule");
		}else{
			removeDataRule();
			$("#riskDeptAdvise").attr("readonly","readonly");
	        $("#riskDeptAdvise").removeAttr("data-rule");
	        $("#riskDeptAdviseEnable").removeAttr("data-rule");
	        $("#mgrAdvise").attr("readonly","readonly");
	        $("#mgrAdvise").removeAttr("data-rule");
			$("#mgrAdviseEnable").removeAttr("data-rule");
		}
	});
		
        function removeDataRule(){
         	$("#inspectTime").removeAttr("data-rule");
        	$("#loanFullName").attr("readonly","readonly");
	        $("#loanFullName").removeAttr("data-rule");
	        $("#saleIncome").attr("readonly","readonly");
	        $("#loanManager").attr("readonly","readonly");
	        $("#loanManager").removeAttr("data-rule");
	        $("#saleIncome").removeAttr("data-rule");
	        $("#flowRate").attr("readonly","readonly");
	        $("#flowRate").removeAttr("data-rule");
	        $("#totalAsset").attr("readonly","readonly");
	        $("#totalAsset").removeAttr("data-rule");
	        $("#quickRate").attr("readonly","readonly");
	        $("#quickRate").removeAttr("data-rule");
	        $("#profit").attr("readonly","readonly");
	        $("#profit").removeAttr("data-rule");
	        $("#assetLiabilitiesRate").attr("readonly","readonly");
	        $("#assetLiabilitiesRate").removeAttr("data-rule");
	        $("#saleRate").attr("readonly","readonly");
	        $("#saleRate").removeAttr("data-rule");
	        $("#accountTurnoverRate").attr("readonly","readonly");
	        $("#accountTurnoverRate").removeAttr("data-rule");
	        $("#fixedAssetChange").attr("readonly","readonly");
	        $("#fixedAssetChange").removeAttr("data-rule");
	        $("#inventoryTurnoverRate").attr("readonly","readonly");
	        $("#inventoryTurnoverRate").removeAttr("data-rule");
	        $("#externalInvesChange").attr("readonly","readonly");
	        $("#externalInvesChange").removeAttr("data-rule");
	        $("#currentLiabilitiesChange").attr("readonly","readonly");
	        $("#currentLiabilitiesChange").removeAttr("data-rule");
	        $("#manageAnaly").attr("readonly","readonly");
	        $("#manageAnaly").removeAttr("data-rule");
	        $("#prodManageAnaly").attr("readonly","readonly");
	        $("#pledgeKeepOpinion").attr("readonly","readonly");
	        $("#inspectAdvise").attr("readonly","readonly");
	        $("#inspectAdvise").removeAttr("data-rule");
        }

</script>

<div class="bjui-pageContent">
    <form action="saveOrUpdateRiskDeptMonthInspect.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
          <input type="hidden"  name="tabid" value="${tabid }">
         <input type="hidden" id="id" name="id" value="${inspect.id }">
         <input type="hidden" id="id2" name="id2" value="${borrowId }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td width="50%">
                        <label for="j_custom_name" class="control-label x150">检查时间：</label>
                        <input type="text" name="inspectTimeStr" id="inspectTime"  data-toggle="datepicker" readonly="readonly"
                       data-pattern="yyyy-MM-dd HH:mm:ss" value="${inspectTime }" data-rule="required;datetime" size="20">
                    </td>
                     <td>
                        <label for="j_custom_name" class="control-label x150">借后管理人员：</label>
                       
                        <input type="text" id="loanManager" name="loanManager" value="${inspect.loanManager }"  data-rule="required"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x150">借款人全称：</label>
                        <input type="text" id="loanFullName" name="loanFullName" value="${inspect.loanFullName }"  data-rule="required"/>
                    </td>
                     <td>
                        <label for="j_custom_name" class="control-label x150">销售收入（万元）：</label>
                        <input type="text" id="saleIncome" name="saleIncome" value="${inspect.saleIncome }" maxlength="30" data-rule="required" >
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x150">流动比率：</label>
                        <input type="text" name="flowRate" id="flowRate" value="${inspect.flowRate }" maxlength="30" data-rule="required" >
                    </td>
                     <td>
                        <label for="j_custom_name" class="control-label x150">总资产（万元）：</label>
                         <input type="text" name="totalAsset" id="totalAsset" value="${inspect.totalAsset }" maxlength="30" data-rule="required" >
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x150">速动比率：</label>
                       <input type="text" name="quickRate" id="quickRate" value="${inspect.quickRate }" maxlength="30" data-rule="required" >
                    </td>
                     <td>
                        <label for="j_custom_name" class="control-label x150">利润（亏损）（万元）：</label>
                        <input type="text" id="profit" name="profit" value="${inspect.profit }" maxlength="30" data-rule="required" >
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x150">资产负债率：</label>
                        <input type="text" name="assetLiabilitiesRate" id="assetLiabilitiesRate" data-rule="required" maxlength="20" value="${inspect.assetLiabilitiesRate }"  size="20">
                    </td>
                     <td>
                        <label for="j_custom_name" class="control-label x150">销售利润率：</label>
                        <input type="text" id="saleRate" name="saleRate" value="${inspect.saleRate }" maxlength="30" data-rule="required" >
                    </td>
                </tr>
                
                  <tr height="60px">
                    <td>
                        <label for="j_custom_birthday" class="control-label x150">应收账款周转率：</label>
                        <input type="text" name="accountTurnoverRate" id="accountTurnoverRate" data-rule="required" maxlength="20" value="${inspect.accountTurnoverRate }"  size="20">
                    </td>
                     <td >
                        <label for="j_custom_name" class="control-label x150">借款期固定资产<br/><br/>变动情况：</label>
                        <input type="text" id="fixedAssetChange" name="fixedAssetChange" value="${inspect.fixedAssetChange }" maxlength="30" data-rule="required" >
                    </td>
                </tr>
                
                  <tr height="60px">
                    <td>
                   <label for="j_custom_birthday" class="control-label x150">借款期流动负债<br/><br/>变动情况：</label>
                        <input type="text" name="currentLiabilitiesChange" id="currentLiabilitiesChange" data-rule="required" maxlength="20" value="${inspect.currentLiabilitiesChange }"  size="20">
                   
                    </td>
                     <td>
                        <label for="j_custom_name" class="control-label x150"><br/>借款期对外投资<br/><br/>变动情况：</label>
                        <input type="text" id="externalInvesChange" name="externalInvesChange" value="${inspect.externalInvesChange }" maxlength="30" data-rule="required" >
                    </td>
                </tr>
                
                  <tr>
                    <td colspan="2">
                         <label for="j_custom_birthday" class="control-label x150">存货周转率：</label>
                        <input type="text" name="inventoryTurnoverRate" id="inventoryTurnoverRate" data-rule="required" maxlength="20" value="${inspect.inventoryTurnoverRate }"  size="20">
                   
                    </td>
                </tr>
                
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x150">经营情况分析：</label>
                         <textarea name="manageAnaly" id="manageAnaly" data-toggle="autoheight" data-rule="required" cols="40" rows="7">${inspect.manageAnaly }</textarea>
                    </td>
                     <td>
                        <label for="j_custom_name" class="control-label x150">保证人生产经营<br/><br/>情况分析：</label>
                        <textarea name="prodManageAnaly" id="prodManageAnaly" data-toggle="autoheight"  cols="40" rows="7">${inspect.prodManageAnaly }</textarea>
                    </td>
                </tr>
                
                  <tr>
                    <td >
                        <label for="j_custom_birthday" class="control-label x150">抵、质押物保管<br/><br/>情况检查意见：</label>
                        <textarea name="pledgeKeepOpinion" id="pledgeKeepOpinion" data-toggle="autoheight" cols="40" rows="7">${inspect.pledgeKeepOpinion }</textarea>
                    </td>
                    
                      <td>
                        <label for="j_custom_name" class="control-label x150">存在的主要问题<br/><br/>及处理建议：</label>
                        <textarea name="inspectAdvise" id="inspectAdvise" data-toggle="autoheight" data-rule="required" cols="40" rows="7">${inspect.inspectAdvise }</textarea>
                   	&nbsp;&nbsp;
                   	<c:if test="${admin.roleId != 29 }">
                   		<c:if test="${inspect.status==3 or inspect.status==4 }">
                   			<span style="color:red;">修改中...</span>
                   		</c:if>
                   	</c:if>
                    </td>
                </tr>
                
                 <tr>
                    <td colspan="2">
                        <label for="j_custom_birthday" class="control-label x150">风控部综合评价意见：</label>
                        <textarea name="riskDeptAdvise" id="riskDeptAdvise" data-toggle="autoheight" data-rule="required" cols="40" rows="7">${riskDeptAdvise }</textarea>
                		
                   	 <c:choose>
	                	<c:when test="${admin.roleId ==28 and inspect.status==1  }">
	                		 &nbsp;&nbsp;
                      	<input type="radio" name="status" id="riskDeptAdviseUnEnable" data-toggle="icheck" 
                      	value="2" data-label="通过" >
                      	&nbsp;&nbsp;
                      	  <input type="radio" name="status" id="riskDeptAdviseEnable" data-toggle="icheck" value="3" 
                         data-rule="checked"  data-label="不通过">
                      		
	                	
	                	</c:when>
	                	<c:otherwise>
	                	&nbsp;&nbsp;
	                	<c:if test="${inspect != null }">
	                	
	                		<c:if test="${inspect.status == 1 }"><span style="color:orange;">待审核</span></c:if>
	                		<c:if test="${inspect.status == 3 }"><span style="color:red;">不通过</span></c:if>
	                		<c:if test="${inspect.status == 4 }"><span style="color:green;">通过</span></c:if>
	                		<c:if test="${inspect.status == 2 }"><span style="color:green;">通过</span></c:if>
	                		<c:if test="${inspect.status == 0 }"><span style="color:green;">通过</span></c:if>
	                		<c:if test="${riskDeptAdviseTime !=null }">
	                		&nbsp;&nbsp;日期：<fmt:formatDate value="${riskDeptAdviseTime }" pattern="yyyy-MM-dd HH:mm:ss" />
	                		</c:if>
	                	</c:if>	  
	                	</c:otherwise>
	                </c:choose>
	                
	                &nbsp;&nbsp;
	                <c:if test="${riskDeptCount != null and riskDeptCount > 0 }">
	                		<a href="queryHistoryAdvise.do?id=${inspect.id }&type=1" data-toggle="dialog" 
                   		data-id="inspectLoan2"data-title="风控部审批历史意见" data-mask="true" data-width="600" 
                   		data-height="500" class="btn btn-green" class="btn btn-green">历史意见</a>
	                </c:if>
                       
                        
                    </td>
                </tr>
         
                 <tr>
                     <td colspan="2">
                        <label for="j_custom_name" class="control-label x150">总经理审阅：</label>
                        <textarea name="mgrAdvise" id="mgrAdvise" data-toggle="autoheight" data-rule="required" cols="40" rows="7">${mgrAdvise }</textarea>
                     
                     <c:choose>
	                	<c:when test="${admin.roleId == 27 and inspect.status==2 }">
	                	 &nbsp;&nbsp;
                         <input type="radio" name="status" id="mgrAdviseUnEnable" data-toggle="icheck" 
                         value="0" data-label="通过">
                     	 &nbsp;&nbsp;
                     	 <input type="radio" name="status" id="mgrAdviseEnable" data-toggle="icheck" value="4" 
                     	 data-rule="checked"  data-label="不通过">
                      
                      	</c:when>
	                	<c:otherwise>
	                		&nbsp;&nbsp;
	                	<c:if test="${inspect != null }">
	                		<c:if test="${inspect.status == 2 }"><span style="color:orange;">待审核</span></c:if>
	                		<c:if test="${inspect.status == 4 }"><span style="color: red;">不通过</span></c:if>
	                		<c:if test="${inspect.status == 0 }"><span style="color: green;">通过</span></c:if>
	                		<c:if test="${mgrAdviseTime !=null }">
	                		&nbsp;&nbsp;日期：<fmt:formatDate value="${mgrAdviseTime }" pattern="yyyy-MM-dd HH:mm:ss" />
	                		</c:if>
	                	</c:if>	 
	                	</c:otherwise>
	                </c:choose>
	                
	                	&nbsp;&nbsp;
	                	<c:if test="${mgrAdviseCount != null and mgrAdviseCount > 0 }">
                       	<a href="queryHistoryAdvise.do?id=${inspect.id }&type=2" data-toggle="dialog" 
                   		data-id="inspectLoan2" data-title="总经理审批历史意见" data-mask="true" data-width="600" 
                   		data-height="500" class="btn btn-green">历史意见</a>
                   		</c:if>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <c:if test="${admin.roleId==27 }">
        	<c:if test="${inspect.status==2 }">
         	<li><button type="submit" class="btn-default" data-icon="save">提交</button></li>
         	</c:if>
        </c:if>
        
         <c:if test="${admin.roleId==28 }">
        	<c:if test="${inspect.status==1 }">
         	<li><button type="submit" class="btn-default" data-icon="save">提交</button></li>
         	</c:if>
        </c:if>
        
         <c:if test="${admin.roleId==29 }">
         
         	<c:if test="${inspect.status==3 or inspect.status==4 or inspectStatus==-1 }">
         	<li><button type="submit" class="btn-default" data-icon="save">提交</button></li>
         	</c:if>
         	
         	
        </c:if>
       
        
    </ul>
</div>
