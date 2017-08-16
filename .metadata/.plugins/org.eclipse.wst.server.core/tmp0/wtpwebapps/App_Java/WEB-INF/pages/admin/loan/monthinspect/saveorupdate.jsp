<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 

<div class="bjui-pageContent">
    <form action="saveOrUpdateBorrowLoanManager.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
          <input type="hidden"  name="tabid" value="${tabid }">
         <input type="hidden" id="id" name="id" value="${inspect.id }">
         <input type="hidden" id="borrowId" name="borrowId" value="${borrowId }">
         <input type="hidden" id="inspectId" name="inspectId" value="${inspectId }">
         <input type="hidden" id="recordTime" name="recordTime" value="${recordTime }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
               
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x120">借款标题：</label>
                        <input type="text" id="borrowTitle" name="borrowTitle" value="${inspect.borrowTitle }" maxlength="20" readonly="readonly" >
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x120">拜访时间：</label>
                        <input type="text" name="visitDate" id="visitDate"  data-toggle="datepicker" readonly="readonly"
                       data-pattern="yyyy-MM-dd HH:mm:ss" value="${visitDate }" data-rule="required;datetime" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">前去拜访的人：</label>
                        <input type="text" name="loanMaintenance" id="loanMaintenance" value="${inspect.loanMaintenance }" maxlength="20" data-rule="required" >
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">主要约谈人姓名：</label>
                        <input type="text" name="mainVisitName" id="mainVisitName" value="${inspect.mainVisitName }" maxlength="20" data-rule="required" 
                         size="20">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">次要约谈人姓名：</label>
                        <input type="text" name="minorVisitName" id="minorVisitName" data-rule="required" maxlength="20" value="${inspect.minorVisitName }"  size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">问题描述：</label>
                        <textarea name="description" id="description" data-toggle="autoheight" data-rule="required" cols="30" rows="6">${inspect.description }</textarea>
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">本息催收：</label>
                         <textarea name="corpusIncome" id="corpusIncome" data-toggle="autoheight" data-rule="required" cols="30" rows="6">${inspect.corpusIncome }</textarea>
                    </td>
                </tr>
                
                  <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">资料文件描述<br/>（稍后您可以上传资料）：</label>
                        <textarea name="materDescription" id="materDescription" data-toggle="autoheight" data-rule="required" cols="30" rows="6">${inspect.materDescription }</textarea>
                    </td>
                </tr>
                
                 <tr>
                    <td id="mgrTd">
                        <label for="j_custom_birthday" class="control-label x120">本金是否已收：</label>
                        <select name="isIncome" id="isIncome" data-toggle="selectpicker" data-rule="required">
            			<option value="">请选择</option>
            	 		<option value="1" ${inspect.isIncome == 1 ?'selected':''}>是</option>
            	 		<option value="2" ${inspect.isIncome == 2 ?'selected':''}>否</option>
           			 </select>
                    </td>
                </tr>
                
                   <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">状态：</label>
                  
                        <select name="status" id="status" data-toggle="selectpicker" data-rule="required">
            						<option value="">请选择</option>
	                            	<option value="1" ${inspect.status == 1 ?'selected':''}>正常</option>
	                            	<option value="2" ${inspect.status == 2 ?'selected':''}>关注</option>
	                            	<option value="3" ${inspect.status == 3 ?'selected':''}>较严重</option>
	                            	<option value="4" ${inspect.status == 4 ?'selected':''}>严重</option>
           			 </select>
                    </td>
                </tr>
                
         
                
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
         <c:if test="${admin.id != -1 and admin.loanUserId != -100 }">
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
        </c:if>
    </ul>
</div>
<script type="text/javascript">

</script>