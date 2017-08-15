<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 

<div class="bjui-pageContent">
    <form action="saveOrUpdateAdmin.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
          <input type="hidden"  name="tabid" value="${tabid }">
         <input type="hidden" id="id" name="id" value="${id }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">管理组：</label>
                     <select name="roleId" id="groupId" data-toggle="selectpicker" data-rule="required">
            			<option value="">请选择</option>
            			<c:forEach items="${group }" var="group">
            	 		<option value="${group.id}" ${group.id == roleId ?'selected':''}>${group.name}</option>
            			</c:forEach>
           			 </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">用户名：</label>
                        <input type="text" name="userName" id="userName" value="${adminInfo.userName }" maxlength="20"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">密码：</label>
                        <input type="password" name="password" id="password" maxlength="20" data-rule="密码:required; password"  size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">确认密码：</label>
                        <input type="password" name="confirmPassword" id="confirmPassword" maxlength="20" data-rule="确认密码:required;match(password)" 
                         size="20">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">真实姓名：</label>
                        <input type="text" name="realName" id="realName" data-rule="required" maxlength="20" value="${adminInfo.realName }"  size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">手机号码：</label>
                        <input type="text" name="telphone" id="telphone" data-rule="required;mobile" maxlength="11" value="${adminInfo.telphone }" size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">QQ：</label>
                        <input type="text" name="qq" id="qq"  data-rule="required" maxlength="20" value="${adminInfo.qq }" size="20">
                    </td>
                </tr>
                
                  <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">邮箱：</label>
                        <input type="text" name="email" id="email" data-rule="required" value="${adminInfo.email }"  size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td id="mgrTd">
                        <label for="j_custom_birthday" class="control-label x85">维护经理ID：</label>
                        <input type="text" name="mgrId" id="loanUserId" value="${adminInfo.loanUserId }" size="20">
                    </td>
                </tr>
                
                   <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">状态：</label>
                         <input type="radio" name="enable" id="enable" data-toggle="icheck" value="1" ${adminInfo.enable == 1 ?'checked':''} data-rule="checked" 
                         data-label="启用&nbsp;&nbsp;">
                         
                        <input type="radio" name="enable" id="enable" data-toggle="icheck" value="2" 
                        data-label="禁用" ${adminInfo.enable == 2 ?'checked':''}>
                        
                    </td>
                </tr>
                
                  <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">是否为组长：</label>
                         <input type="checkbox" name="isLeader" id="isLeader" ${adminInfo.isLeader eq '1' ?'checked':''} data-toggle="icheck" value="1">
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