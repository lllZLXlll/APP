<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../../../include/base.jsp"%> 
<div class="bjui-pageContent">
    <form action="saveOrUpdateSms.do" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
          <input type="hidden"  name="tabid" value="${tabid }">
         <input type="hidden" id="id" name="id" value="${sms.id }">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
            	 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">短信运营商名称：</label>
                        <input type="text" name="smsoperator" id="smsoperator" maxlength="20"  value="${sms.smsoperator }" data-rule="required"  size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x120">公司名称：</label>
                        <input type="text" name="account" id="account" value="${sms.account }" maxlength="20"  data-rule="required" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">短信账户：</label>
                        <input type="text" name="userId" id="userId" value="${sms.userId }" maxlength="20" data-rule="required" 
                         size="20">
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">密码：</label>
                        <input type="text" name="password" id="password" value="${sms.password }" maxlength="20" data-rule="required" 
                         size="20">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">发送URL：</label>
                        <input type="text" name="url" id="url" data-rule="required" maxlength="100" value="${sms.url }"  size="20">
                    </td>
                </tr>
                
                <c:if test="${sms.type != null }">
                	<tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">标识：</label>
                        <input type="text" name="password" id="password" value="${sms.type }" maxlength="20" data-rule="required" 
                         size="20">
                    </td>
                </tr>
                </c:if>
                 
                
                   <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x120">启用状态：</label>
                         <input type="radio" name="status" id="enable" data-toggle="icheck" value="1" ${sms.status == 1 ?'checked':''} data-rule="checked" 
                         data-label="启用&nbsp;&nbsp;">
                         
                        <input type="radio" name="status" id="unenable" data-toggle="icheck" value="2" 
                        data-label="禁用" ${sms.status == 2 ?'checked':''}>
                        
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
