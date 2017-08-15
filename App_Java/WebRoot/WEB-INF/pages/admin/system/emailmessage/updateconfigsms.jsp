<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 

<div class="bjui-pageContent">
    <form action="updateConfigSms.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
          <input type="hidden"  name="tabid" value="${tabid }">
         <input type="hidden" id="id" name="id" value="${id }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">短信运营商：</label>
                     <select name="status" id="status" data-toggle="selectpicker" data-rule="required">
            			<option value="0" ${smsConfig.status == null ?'selected':''}>随机发送</option>
            			<c:forEach items="${sms }" var="sms">
            	 		<option value="${sms.type}" ${smsConfig.status == sms.type ?'selected':''}>${sms.smsoperator}</option>
            			</c:forEach>
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
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<script type="text/javascript">
	var loanUserId=$("#loanUserId").val();
	if(loanUserId=="" || loanUserId=="0"){
		$("#mgrTd").hide();
	}
	  var groupId=$('#groupId').selectpicker('val');
      if(groupId!=16){
       	$("#mgrTd").hide();
      	$("#loanUserId").val("0");
      }
	$("#loanUserId").removeAttr("data-rule");
	$("#groupId").on('change', function(e) {
        if(groupId==16){
        	$("#mgrTd").show();
        	$("#loanUserId").val("");
       		$("#loanUserId").attr("data-rule","required");
        }else{
      		$("#mgrTd").hide();
      		$("#loanUserId").val("0");
        }
	});
</script>